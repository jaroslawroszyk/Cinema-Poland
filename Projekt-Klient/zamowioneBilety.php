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
        <style>

table {
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}
th,
td {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #fff;
}
th {
  text-align: left;
}
thead th {
  background-color: #55608f;
}
tbody tr:hover {
  background-color: rgba(255, 255, 255, 0.3);
}
tbody td {
  position: relative;
}
tbody td:hover:before {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  top: -9999px;
  bottom: -9999px;
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
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
$link = mysqli_connect('localhost', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

$email = $_POST["email"];
$haslo = $_POST["haslo"];

// $query = "SELECT B.ID_bilet, F.tytul, S.godzina, S.dzien_tygodnia, S.ID_sala, T.nazwa_typu_biletu, 
//  T.cena_biletu, T.opis, R.ID_rezerwacja, R.ID_klient, R.ilosc_biletow, S.ID_seans  FROM Bilet B, Seans S, 
//  TypBiletu T, Rezerwacja R, Film F, Klient K WHERE R.ID_rezerwacja=B.ID_rezerwacja AND 
//  K.ID_klient = R.ID_klient AND K.email = '$email' AND K.haslo = '$haslo' AND F.ID_film = S.ID_film AND S.ID_seans = B.ID_seans 
//  AND T.ID_typ_bilet = B.ID_typ_bilet ORDER BY ID_rezerwacja;";
 $query="SELECT B.ID_bilet, F.tytul, S.godzina, S.dzien_tygodnia, S.ID_sala, T.nazwa_typu_biletu, 
 T.cena_biletu, T.opis, R.ID_rezerwacja, R.email, R.ilosc_biletow, S.ID_seans  FROM Bilet B, Seans S, 
 TypBiletu T, Rezerwacja R, Film F, Klient K WHERE R.ID_rezerwacja=B.ID_rezerwacja AND 
 K.email = R.email AND K.email = '$email' AND K.haslo = '$haslo' AND F.ID_film = S.ID_film AND S.ID_seans = B.ID_seans 
 AND T.ID_typ_bilet = B.ID_typ_bilet ORDER BY ID_rezerwacja;";
$query2 = "SELECT ID_klient FROM Klient WHERE email = '$email' AND haslo = '$haslo';";

$result2 = mysqli_query($link, $query2) or die('Blad zapytania SQL');
echo "Twoje ID to: ";
while ($l = mysqli_fetch_assoc($result2)) echo "<td>" . $l["ID_klient"] . "</td>";
echo ". Numer jest potrzebny podczas rezerwacji biletu!";

$result = mysqli_query($link, $query) or die('Blad zapytania SQL');
echo "<table border = 1 >";
echo "<tr>
 <th>Numer rezerwacji</th>
        <th>Numer biletu</th>
        <th>Tytuł filmu</th>
		<th>Dzień tygodnia</th>
		<th>Godzina</th>
		<th>Sala</th>
		<th>Email klienta</th>
		<th>Ilość biletów</th>
		<th>Typ biletu</th>	
		<th>Cena biletu</th>
		<th>Opis biletu</th>
		<th>ID seansu</th>
        </tr>";

while ($line = mysqli_fetch_assoc($result)) 
{
    echo "<tr>";
    echo "<td>" . $line["ID_rezerwacja"] . "</td>";
    echo "<td>" . $line["ID_bilet"] . "</td>";
    echo "<td>" . $line["tytul"] . "</td>";
    echo "<td>" . $line["dzien_tygodnia"] . "</td>";
    echo "<td>" . $line["godzina"] . "</td>";
    echo "<td>" . $line["ID_sala"] . "</td>";
    echo "<td>" . $line["email"] . "</td>";
    echo "<td>" . $line["ilosc_biletow"] . "</td>";
    echo "<td>" . $line["nazwa_typu_biletu"] . "</td>";
    echo "<td>" . $line["cena_biletu"] . " zł.</td>";
    echo "<td>" . $line["opis"] . "</td>";
    echo "<td>" . $line["ID_seans"] . "</td>";
    echo "</tr>";
}
echo "</table>";

mysqli_close($link);
?>
         <br> <br>			
<input type="button" onclick="location.href='index.html';" value="Powrót" />
               
               <br><br>
        </div>
    </body>
</html>
