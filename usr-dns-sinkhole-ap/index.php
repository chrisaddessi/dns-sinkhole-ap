<?php

$pinicornot = shell_exec('sudo cat /usr/share/dns-sinkhole-ap/pinicornot.txt');
if ($pinicornot == "2\n") {
	$disableREALTEK = 'Disable REALTEK NIC: <input type="checkbox" name="niccode" value="1"><br><p>(you must unplug all extra Wireless NICS for this to work on reboot)</p>';
}else {
		$disableREALTEK = '';
}



echo <<<HTML
<html>
<body>
<form action="submit.php" method="post">
Access Point Name: <input type="text" name="ssid"><br>
<p>Enter mac of realtek nic : </p><input type="text" name="rmac"><br>
<p>matching this fromat (lo:we:er:ca:se:45)</p><br>
Enable REALTEK NIC: <input type="checkbox" name="niccode" value="2"><br>
$disableREALTEK

<input type="submit">
</form>
</body>
</html>

HTML;

//make a login page

?>

