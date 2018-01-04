function heroVideo() {

    var materialButtonSelector = '.material-btn';

	$('.js-material-video').on('click', function(e){
		e.preventDefault();
 
		if(isAnimating){
			return;
		}

		isAnimating = true;

		var self = $(this);
		var windowWidth = $(window).width();
		var windowHeight = $(window).height();
		var scrollBar = $(window).width() < 768 ? 0 : 8;
		var materialButton = $(materialButtonSelector, self);

		// create background 
		$('<div class="material-video-container" />').appendTo('body').css({
			'width': '100%',
			'height': '100%',
			'position': 'fixed',
			'top': 0,
			'left': 0,
			'overflow': 'hidden',
			'z-index': '100'
		});

		var videoPopupContainer = $('.material-video-container');

		// create the inner container
		$('<div class="material-video-container__inner" />').appendTo(videoPopupContainer).css({
			'width': windowWidth - 128,
			'height': windowHeight - 128,
			'position': 'fixed',
			'top': 64,
			'left': 64,
			'overflow': 'hidden',
			'z-index': '100'
		});
		
    	var videoPopup = $('.material-video-container__inner');

		// create our new button
		// which is longest edge of the viewport 
		var longEdge = windowWidth >windowHeight ? windowWidth*2 : windowHeight*2;

		// the button is square so we only need one
		var materialButtonEdge = parseFloat(materialButton.css('width'));

		// find relative to the viewport
		var materialButtonTop = materialButton.offset().top - $(document).scrollTop();
		var materialButtonLeft = materialButton.offset().left - $(document).scrollLeft();

		// get center of page
		var grid = {
			verticalCenter: windowWidth*0.5,
			horizontalCenter: windowHeight*0.5
		}
		// is button past centers
		var buttonPast = {
			vertical: (materialButtonLeft > grid.verticalCenter) ? true : false,
			horizontal: (materialButtonTop > grid.horizontalCenter) ? true : false
		}
		
		var popupButtonTop = (0 - (longEdge - windowHeight)*0.5);
		var popupButtonLeft = (0 - (longEdge - windowWidth)*0.5);

		popupButtonTop = (buttonPast.horizontal) ? popupButtonTop + ((materialButtonTop-grid.horizontalCenter)+materialButtonEdge*0.5) : popupButtonTop - ((grid.horizontalCenter-materialButtonTop)-materialButtonEdge*0.5);
		popupButtonLeft = (buttonPast.vertical) ? popupButtonLeft + ((materialButtonLeft-grid.verticalCenter)+materialButtonEdge*0.5) : popupButtonLeft - ((grid.verticalCenter-materialButtonLeft)-materialButtonEdge*0.5);

		// figure out our initial scale
		var buttonInitialScale = materialButtonEdge / longEdge;

		// clone element into it
		materialButton.clone().appendTo(videoPopup).css({
			'width': longEdge,
			'height': longEdge,
			'position': 'fixed',
			'top': popupButtonTop,
			'left': popupButtonLeft - scrollBar,
			'box-shadow': 'none',
			'opacity': '0',
			'-webkit-transform-origin': '50% 50%',
	    	'-ms-transform-origin':     '50% 50%',
	    	'transform-origin':         '50% 50%',
			'-webkit-transform': 'scale(' + buttonInitialScale + ')',
	    	'-ms-transform':     'scale(' + buttonInitialScale + ')',
	    	'transform':         'scale(' + buttonInitialScale + ')'
		});

		// create our close button
		$('<a href="#" class="material-icons material-video-container__close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>').appendTo(videoPopup);
		
		var videoClose = $('.material-video-container__close');

		// hide original button
		// give the original button a class so we can find it later
		materialButton.addClass('material-btn--last');

		// expand button
		var popupButton = $(materialButtonSelector, videoPopup);
		// destroy the icon inside
		$('span', popupButton).remove();

		// bypass a timing bug
		setTimeout(function(){
			popupButton.css({
				'opacity': '1',
			});
		}, 1);
		setTimeout(function(){
			popupButton.css({
				'-webkit-transform': 'scale(1)',
				'-ms-transform':     'scale(1)',
				'transform':         'scale(1)'
			}).addClass('material-btn--normal-transition');
		}, 100);
		popupButton.one(transitionEvent, function(){
			// add black to background while loading
			videoPopup.css('background-color', '#000');
			// fade in close button
			videoClose.css('opacity', '1');
			// add youtube video 
			$('<iframe id="js-youtube-video" src="' + self.attr('data-url') + '" frameborder="0"></iframe>').appendTo(videoPopup).css({
				'height': '100%',
				'width':'100%',
			});
			// hide red overlay
			popupButton.css({
				'opacity': '0',
				'visibility': 'hidden'
			});
			popupButton.one(transitionEvent, function(){
				isAnimating = false; 
			});
		});
	});
	
	// to close a material video
	$(document).on('click', '.material-video-container, .material-video-container__close', function(e){
		e.preventDefault();

		if(isAnimating){
			return;
		}

		var self = $('.material-video-container');
		var lastMaterialButton = $('.material-btn--last');

		self.css('opacity', '0');
		lastMaterialButton.removeClass('material-btn--last');
		self.one(transitionEvent, function(){
			self.remove();
			isAnimating = false; 
		});
	});

}