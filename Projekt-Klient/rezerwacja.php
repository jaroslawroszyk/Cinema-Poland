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
            <h1 class="title">Rezerwacja Biletów</h1>
            <br><br> 
<?php
$link = mysqli_connect('localhost', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$ilosc_biletow = $_POST["ilosc_biletow"];
$email = $_POST["email"];
$id_seansu=$_POST['id_seansu'];
if ($ilosc_biletow != "" AND $email != "") 
{
    $sql = "INSERT into Rezerwacja(id_seansu,ilosc_biletow, email) VALUES('$id_seansu','$ilosc_biletow', '$email')";
    if (mysqli_query($link, $sql)) 
	{
        $ID = $link->insert_id;
        echo "Rezerwacja została pomyślnie utworzona! ID Twojej rezerwacji to: ";
        echo $ID;
        echo " Zapamiętaj je! Potrzebne jest to do zarezerwowania biletów. Powróć do poprzedniej strony za pomocą \"Wstecz\"";
    } 
	else 
	{
        echo "Error: " . $sql . "<br>" . mysqli_error($link);
    }
}
?>
<input type="button" onclick="location.href='rezerwacjaBiletów.php';" value="Wstecz" />
<?php
mysqli_close($link);
?>
         <br> <br>			

               
        </div>
    </body>
</html>


