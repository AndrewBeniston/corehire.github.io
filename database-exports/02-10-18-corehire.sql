<!DOCTYPE html>
<html lang="en" dir="ltr">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" content="noindex">
<title>Login - db - Adminer</title>
<link rel="stylesheet" type="text/css" href="?file=default.css&amp;version=4.6.1">
<script src='?file=functions.js&amp;version=4.6.1' nonce="YzRjMmFkZjJjNWU5NzcwOWY3OGNmMTZmZjM1YzFjZTc="></script>
<link rel="shortcut icon" type="image/x-icon" href="?file=favicon.ico&amp;version=4.6.1">
<link rel="apple-touch-icon" href="?file=favicon.ico&amp;version=4.6.1">

<body class="ltr nojs">
<script nonce="YzRjMmFkZjJjNWU5NzcwOWY3OGNmMTZmZjM1YzFjZTc=">
mixin(document.body, {onkeydown: bodyKeydown, onclick: bodyClick});
document.body.className = document.body.className.replace(/ nojs/, ' js');
var offlineMessage = 'You are offline.';
var thousandsSeparator = ',';
</script>

<div id="help" class="jush-sql jsonly hidden"></div>
<script nonce="YzRjMmFkZjJjNWU5NzcwOWY3OGNmMTZmZjM1YzFjZTc=">mixin(qs('#help'), {onmouseover: function () { helpOpen = 1; }, onmouseout: helpMouseout});</script>

<div id="content">
<h2>Login</h2>
<div id='ajaxstatus' class='jsonly hidden'></div>
<div class='error'>SQLSTATE[HY000] [1045] Access denied for user &#039;root&#039;@&#039;172.20.0.3&#039; (using password: NO)<br>Master password expired. <a href="https://www.adminer.org/en/extension/" target="_blank" rel="noreferrer noopener">Implement</a> <code>permanentLogin()</code> method to make it permanent.</div>
<form action='' method='post'>
<div></div>
<table cellspacing="0">
<tr><th>System<td><select name='auth[driver]'><option value="server" selected>MySQL<option value="sqlite">SQLite 3<option value="sqlite2">SQLite 2<option value="pgsql">PostgreSQL<option value="oracle">Oracle<option value="mssql">MS SQL<option value="firebird">Firebird (alpha)<option value="simpledb">SimpleDB<option value="mongo">MongoDB (beta)<option value="elastic">Elasticsearch (beta)</select>
<tr><th>Server<td><input name="auth[server]" value="db" title="hostname[:port]" placeholder="localhost" autocapitalize="off">
<tr><th>Username<td><input name="auth[username]" id="username" value="root" autocapitalize="off">
<tr><th>Password<td><input type="password" name="auth[password]">
<tr><th>Database<td><input name="auth[db]" value="wordpress" autocapitalize="off">
</table>
<script nonce="YzRjMmFkZjJjNWU5NzcwOWY3OGNmMTZmZjM1YzFjZTc=">focus(qs('#username'));</script>
<p><input type='submit' value='Login'>
<label><input type='checkbox' name='auth[permanent]' value='1'>Permanent login</label>
</form>
</div>

<div id="menu">
<h1>
<a href='https://www.adminer.org/' target="_blank" rel="noreferrer noopener" id='h1'>Adminer</a> <span class="version">4.6.1</span>
<a href="https://www.adminer.org/#download" target="_blank" rel="noreferrer noopener" id="version"></a>
</h1>
</div>
<script nonce="YzRjMmFkZjJjNWU5NzcwOWY3OGNmMTZmZjM1YzFjZTc=">setupSubmitHighlight(document);</script>
