<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>Cinema Poland</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/style.css">

        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>

    <body class="animated bounceInDown">
        <div class="avatar">
            <img src="img/avatar.png" alt="Avatar">
        </div>

        <div class="content">
            <h1 class="title">Edycja Klienta</h1>
            <br><br>
             <input type="button" onclick="location.href='zarządzanieKlientami.html';" value="Powróć" />	
     <br><br>
			
			
            
<?php
$link = mysqli_connect('localhost:3306', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$ID_klient= $_POST["ID_klient"];
    $imie = $_POST["imie"];
    $nazwisko = $_POST["nazwisko"];
	$haslo = $_POST["haslo"]; 
	$email= $_POST["email"];

if ( $ID_klient != "" AND $imie != "" AND $nazwisko != "" AND $email != "" AND $haslo != "") 
{
    $sql = "UPDATE Klient SET imie = '$imie', nazwisko = '$nazwisko', email = '$email', haslo = '$haslo'  WHERE ID_klient = '$ID_klient'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Konto klienta zostało poprawnie edytowane.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}

if ( $ID_klient != "" AND $email != "" AND $haslo != "") 
{
    $sql = "UPDATE Klient SET email = '$email', haslo = '$haslo'  WHERE ID_klient = '$ID_klient'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Konto klienta zostało poprawnie edytowane.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}

if ( $email != "" AND $haslo != "") 
{
    $sql = "UPDATE Klient SET haslo = '$haslo' WHERE email = '$email'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Konto klienta zostało poprawnie edytowane.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}

mysqli_close($link);

?>
               
        </div>
    </body>
</html>
