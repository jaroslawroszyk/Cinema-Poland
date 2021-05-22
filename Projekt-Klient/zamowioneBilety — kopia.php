﻿<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <title>Cinema Poland</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/style.css">

        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <style>table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}
</style>
    </head>

    <body class="animated bounceInDown">
        <div class="avatar">
            <img src="img/avatar.png" alt="Avatar">
        </div>

        <div class="content">
            <h1 class="title">Lista Twoich zamówień<br></h1>
            <br><br>
			
			
            
<?php
$link = mysqli_connect('localhost:3306', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$email     = $_POST["email"];
$haslo = $_POST["haslo"];

$query =  " SELECT B.ID_bilet, F.tytul, S.godzina, S.dzien_tygodnia, S.ID_sala, T.nazwa_typu_biletu, 
 T.cena_biletu, T.opis, R.ID_rezerwacja, R.ID_klient, R.ilosc_biletow, S.ID_seans  FROM Bilet B, Seans S, 
 TypBiletu T, Rezerwacja R, Film F, Klient K WHERE K.ID_klient = R.ID_klient AND K.email = '$email' AND K.haslo = '$haslo';
  ";

$result = mysqli_query($link, $query) or die('Blad zapytania SQL');

echo "<table border=1>";
 echo "<tr>
        <th>ID biletu</th>
        <th>Tytuł filmu</th>
		<th>Dzień tygodnia</th>
		<th>Godzina</th>
		<th>Sala</th>
		<th>ID rezerwacji</th>
		<th>ID klienta</th>
		<th>Ilość biletów</th>
		<th>Typ biletu</th>	
		<th>Cena biletu</th>
		<th>Opis biletu</th>
		<th>ID seansu</th>
        </tr>";

while ($line = mysqli_fetch_assoc($result)) {
     echo "<tr>";
    echo "<td>".$line["ID_bilet"]."</td>";
    echo "<td>".$line["tytul"]."</td>";
	echo "<td>".$line["dzien_tygodnia"]."</td>";
    echo "<td>".$line["godzina"]."</td>";
	echo "<td>".$line["ID_sala"]."</td>";
	echo "<td>".$line["ID_rezerwacja"]."</td>";
	echo "<td>".$line["ID_klient"]."</td>";
	echo "<td>".$line["ilosc_biletow"]."</td>";
	echo "<td>".$line["nazwa_typu_biletu"]."</td>";
	echo "<td>".$line["cena_biletu"]." zł.</td>";
	echo "<td>".$line["opis"]."</td>";
	echo "<td>".$line["ID_seans"]."</td>";
	echo "</tr>";
	}
echo "</table>";

mysqli_close($link);
?>
         <br> <br>			
<input type="button" onclick="location.href='index.html';" value="Powrót" />
               
        </div>
    </body>
</html>
