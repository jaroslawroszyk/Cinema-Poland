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
            <h1 class="title">Edycja Filmu</h1>
            <br><br>
             <input type="button" onclick="location.href='zarządzanieFilmami.html';" value="Powróć" />	
     <br><br>
			
			
            
<?php

$link = mysqli_connect('localhost:3306', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$ID_film = $_POST["ID_film"];
    $ID_ograniczenia = $_POST["ID_ograniczenia"];
    $ID_rezyser = $_POST["ID_rezyser"];
	$ID_gatunek = $_POST["ID_gatunek"];
    $oryginalny_tytul = $_POST["oryginalny_tytul"];
    $produkcja = $_POST["produkcja"];
    $czas_trwania= $_POST["czas_trwania"];
	$tytul = $_POST["tytul"]; 

if ($ID_film != "" AND $ID_ograniczenia != "" AND $ID_rezyser != "" AND $ID_gatunek != "" AND $oryginalny_tytul != "" AND $tytul != ""
AND $rok_premiery!="" AND $produkcja!="" AND $czas_trwania!="")  
{
    $sql = "UPDATE Film SET ID_ograniczenia = '$ID_ograniczenia', ID_rezyser = '$ID_rezyser', ID_gatunek = '$ID_gatunek',  oryginalny_tytul = '$oryginalny_tytul',
	 tytul = '$tytul',  rok_premiery = '$rok_premiery',  produkcja = '$produkcja',  czas_trwania = '$czas_trwania' WHERE ID_film = '$ID_film'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Film został poprawnie edytowany.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}

if ($ID_film != "" AND $oryginalny_tytul != "" AND $tytul != "" AND $rok_premiery!="" AND $produkcja!="" AND $czas_trwania!="")  
{
    $sql = "UPDATE Film SET oryginalny_tytul = '$oryginalny_tytul', tytul = '$tytul',  rok_premiery = '$rok_premiery',  produkcja = '$produkcja',  czas_trwania = '$czas_trwania' WHERE ID_film = '$ID_film'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Film został poprawnie edytowany.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}

if ($ID_film != "" AND $oryginalny_tytul != "" AND $tytul != "")  
{
    $sql = "UPDATE Film SET oryginalny_tytul = '$oryginalny_tytul', tytul = '$tytul' WHERE ID_film = '$ID_film'";
    
    if (mysqli_query($link, $sql)) 
	{
		echo "Film został poprawnie edytowany.";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);	
    }
}
mysqli_close($link);

?>
         <br> <br>			
<input type="button" onclick="location.href='zarządzanieFilmami.html';" value="Powrót" />
               
        </div>
    </body>
</html>
