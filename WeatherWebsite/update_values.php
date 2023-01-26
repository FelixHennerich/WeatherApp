<?php

$value = $_POST['value'];		
$unit = $_POST['unit'];			
$column = $_POST['column'];		


include("database_connect.php"); 

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


mysqli_query($con,"UPDATE ESPtable2 SET $column = '{$value}'
WHERE id=$unit");


header("location: index.php");
?>