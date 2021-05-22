<?php 
	session_start();
	
	if ((!isset($_POST['email'])) || (!isset($_POST['haslo'])))
	{
		header('Location: index.php');
		exit();
	}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>Cinema Jarek</title>

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
            <h1 class="title">Logowanie</h1>
	<br> <br>	

<?php
$link = mysqli_connect('localhost', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$email= $_POST["email"];
$haslo = $_POST["haslo"];
$email = htmlentities($email, ENT_QUOTES, "UTF-8");
$haslo = htmlentities($haslo, ENT_QUOTES, "UTF-8");
mysqli_real_escape_string($link,$email);
mysqli_real_escape_string($link,$haslo);
$url        = "rezerwacjaBiletów.php";
$site_title = "Przejdź do rezerwacji.";


$query2 = "SELECT ID_klient FROM Klient WHERE email = '$email' AND haslo = '$haslo';";
// $query2= "SELECT `email`, `imie`, `nazwisko`, `haslo` FROM `Klient` WHERE email AND haslo;";
$result2 = mysqli_query($link, $query2) or die('Blad zapytania SQL');
$line = mysqli_fetch_assoc($result2);
// $id = $line[ID_klient"];

if ($line !== NULL) 
{
    
    echo "Zalogowałeś się! Twoje ID to: ";
    
    
    $id  =  $line["ID_klient"];
	echo "<td>" . $id . ".</td>";
    
	echo "<a href=$url> $site_title</a>.";
} 
else 
{
    echo '<span style="color:red">Nieprawidłowy login lub hasło!</span>';
}

mysqli_close($link);
?>		
<br>
<br>
<input type="button" onclick="location.href='index.html';" value="Powrót do strony głównej" />
               
        </div>
    </body>
</html>