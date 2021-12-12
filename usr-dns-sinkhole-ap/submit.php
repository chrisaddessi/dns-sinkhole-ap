<?php
$ssid = $_POST["ssid"];
$niccode = $_POST["niccode"];
$rmac = $_POST["rmac"];
$rebootcode = $_POST["rebootcode"];


//show changes made latter
echo <<< HTML
<html>
<body>
<div id="title">
<h2>Chagnes Made:</h2>
</div>
<div id="changes">
<p>YOU MUST REBOOT FOR CHANGES TO TAKE EFFECT!</p>
<form action="submit.php" method="post">
$disableREALTEK
<input type="submit" name="rebootcode" value="now">
</form>
</div>
</body>
</html>
HTML;

if ($rebootcode == "now") {
	exec('sudo reboot now');
}

if (isset($ssid)) {
	exec('sudo /./usr/share/dns-sinkhole-ap/phpreplace.sh "'. $ssid. '"');	
}
if (isset($niccode)) {
	exec('sudo /./usr/share/dns-sinkhole-ap/phpniccode.sh "'. $niccode. '"');
}
if (isset($rmac)) {
	exec('sudo /./usr/share/dns-sinkhole-ap/phprmac.sh "'. $rmac. '"');
}






?>
