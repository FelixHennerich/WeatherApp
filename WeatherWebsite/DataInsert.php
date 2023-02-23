<html>
<body>

<?php
	include("database_connect.php");

	/*$dbname = 'id20158736_weatheresp';
	$dbuser = 'id20158736_admin';  
	$dbpass = 'LeaGauGgel18.06'; 
	$dbhost = 'localhost'; 

	$connect = @mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

	if(!$connect){
		echo "Error: " . mysqli_connect_error();
		exit();
	}*/

	echo "Connection Success!<br><br>";


	$result = mysqli_query($con,"SELECT * FROM ESPtable2");

	while($row = mysqli_fetch_array($result)) {

		echo "<tr class='success'>";
		$unit_id = $row['id'];
		  
	   $column6 = "temp";
	   
	   $current_num_1 = $row[$column6];	

	   echo "Temperature: $current_num_1<br><br>";
	}   


	/*$query = "SELECT '*' FROM ESPtable2";
	$queryresult = mysqli_query($connect,$query);
	$result = mysqli_fetch_assoc($queryresult);

	$resultString = $result['temp'];

	echo $resultString + "<br><br>";*/

	echo "Insertion Success!<br>";

?>
</body>
</html>