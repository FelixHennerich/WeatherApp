<html>
<body>

<?php

$dbname = 'id20158736_weatheresp';
$dbuser = 'id20158736_admin';  
$dbpass = 'LeaGauGgel18.06'; 
$dbhost = 'localhost'; 

$connect = @mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

if(!$connect){
	echo "Error: " . mysqli_connect_error();
	exit();
}

echo "Connection Success!<br><br>";

$temperature = $_GET["temperature"];


$query = "UPDATE ESPtable2 SET temp = '$temperature' WHERE id = 0";
$result = mysqli_query($connect,$query);

echo "Insertion Success!<br>";

?>
</body>
</html>