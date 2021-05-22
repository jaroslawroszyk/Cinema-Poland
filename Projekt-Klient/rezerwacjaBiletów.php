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

        <form action="rezerwacja.php" method="post">
            <fieldset>
                <legend>Rezerwacja:</legend>

                Email:
                <input name="email"></input>
                <br />

                Ilosc biletów:
                <input name="ilosc_biletow"></input>
                <br />
               
                <select name="id_seansu">
                    <option value="id_seansu">Tytul Filmu</option>
                    <?php
                    $link = mysqli_connect('localhost', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

                    $query =  "SELECT S.ID_seans, F.tytul FROM Seans S, Film F WHERE S.ID_film = F.ID_film ORDER BY ID_seans;";

                    $result = mysqli_query($link, $query) or die('Blad zapytania SQL');

                    while ($line = mysqli_fetch_assoc($result)) {
                        
                        echo "<option value=" .$line["ID_seans"] .">".$line["tytul"]."</option>";
                      
                    }
                    


                    mysqli_close($link);
                    ?>
                </select>


                <button>Rezerwuj</button>
            </fieldset>
        </form>


        <br>
        <br>

        <form action="rezerwujBilet.php" method="post">
            <fieldset>
                <legend>Bilet:</legend>
                ID seansu:
                <select name="ID_seans">
                    <option value="ID_seans">Tytul Filmu</option>
                    <?php
                    $link = mysqli_connect('localhost', 'root', '', 'Kino') or die('Blad polaczenia z Serwerem BD');

                    $query =  "SELECT S.ID_seans, F.tytul FROM Seans S, Film F WHERE S.ID_film = F.ID_film ORDER BY ID_seans;";

                    $result = mysqli_query($link, $query) or die('Blad zapytania SQL');

                    while ($line = mysqli_fetch_assoc($result)) {
                        
                        echo "<option value=" .$line["ID_seans"] .">".$line["tytul"]."</option>";
                      
                    }
                    


                    mysqli_close($link);
                    ?>
                </select>
                </select>
                <br />

                Typ biletu:
                <select name="ID_typ_bilet">
                    <option value="0">Twój Wybór</option>
                    <option value="1">Bilet normalny - 27.00 zł.</option>
                    <option value="2">Bilet do lat 12 - 15.00 zł.</option>
                    <option value="3">Uczniowie i studenci - do lat 26 - 20.00 zł.</option>
                    <option value="4">Seniorzy - od 60 lat - 21.00 zł.</option>
                </select>
                <br />

                ID rezerwacji:
                <input type="text" name="ID_rezerwacja"></input>
                <br />
                <button>Rezerwuj bilet</button>
            </fieldset>
        </form>
        <br><br>
        <input type="button" onclick="location.href='index.html';" value="Powrót" />

        <br> <br>


    </div>
</body>

</html>