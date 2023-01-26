<?php
/*This file should receive a link somethong like this: http://noobix.000webhostapp.com/TX.php?unit=1&b1=1
If you paste that link to your browser, it should update b1 value with this TX.php file. Read more details below.
The ESP will send a link like the one above but with more than just b1. It will have b1, b2, etc...
*/

//We loop through and grab variables from the received the URL
foreach($_REQUEST as $key => $value)  //Save the received value to the hey variable. Save each cahracter after the "&"
{
	//Now we detect if we recheive the id, the password, unit, or a value to update
if($key =="id"){
$unit = $value;
}	
if($key =="pw"){
$pass = $value;
}	
if($key =="un"){
$update_number = $value;
}
	
if($update_number == 1)
{
	if($key =="n1"){
		$sent_nr_1 = $value;
	}			
}
else if($update_number == 2)
{
	if($key =="n2"){
	$sent_nr_2 = $value;
	}			
}
else if($update_number == 3)
{
	if($key =="n3"){
	$sent_nr_3 = $value;
	}			
}
else if($update_number == 4)
{
	if($key =="n4"){
	$sent_nr_4 = $value;
	}			
}	
	
else if($update_number == 5)
	{
	if($key =="b6"){
	$sent_bool_1 = $value;
	}	
	if($key =="b7"){
	$sent_bool_2 = $value;
	}	
	if($key =="b8"){
	$sent_bool_3 = $value;
	}	
}
}//End of foreach


include("database_connect.php"); 	//We include the database_connect.php which has the data for the connection to the database


// Check  the connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


date_default_timezone_set('UTC');
$t1 = date("gi"); 	

$result = mysqli_query($con,"SELECT * FROM ESPtable2");	

while($row = mysqli_fetch_array($result)) {
if($row['id'] == $unit){
	
		
		$n1 = $row['RECEIVED_NUM1'];	
		$n2 = $row['RECEIVED_NUM2'];	
		$n3 = $row['RECEIVED_NUM3'];
		$n4 = $row['RECEIVED_NUM4'];	
		$n5 = $row['RECEIVED_NUM5'];
		
		$n6 = $row['TEXT_1'];
		
		echo " _n1$n1##_n2$n2##_n3$n3##_n4$n4##_n5$n5##_n6$n6##";
	
}	
}
?>








