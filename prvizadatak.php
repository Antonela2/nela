<?php
$veza = mysqli_connect("localhost", "root", "", "antonelagale");
if ($veza->connect_error) {
    die("Povezivanje neuspješno: " . $veza->connect_error);
}
echo "Uspješno spojeno!";
echo "<br><br>";
echo "<h3>PRODAVAONICA</h3>";
$sql = "SELECT Prodavaonica_id, imeArtikla, cijenaArtikla, velicinaArtikla FROM prodavaonica";
if($result = mysqli_query($veza, $sql)) {
    if(mysqli_num_rows($result) > 0) {
        echo "<table border='1'>";
        echo "<tr>";
        echo "<th>Prodavaonica_id</th>";
        echo "<th>imeArtikla</th>";
        echo "<th>cijenaArtikla</th>";
        echo "<th>velicinaArtikla</th>";
        echo "</tr>";

        while($row = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>" . $row['Prodavaonica_id'] . "</td>";
            echo "<td>" . $row['imeArtikla'] . "</td>";
            echo "<td>" . $row['cijenaArtikla'] . "</td>";
            echo "<td>" . $row['velicinaArtikla'] . "</td>";
        }
        echo "</table>";
        mysqli_free_result($result);
    } else {
        echo "No records matching your query were found.";
    }
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($veza);
}
echo "<br><br>";
echo "<h3>SOBE</h3>";
$sql2 = "SELECT Skladiste_id, Prodavaonica_id, kolicinaArtikla FROM skladiste";
if($result2 = mysqli_query($veza, $sql2)) {
    if(mysqli_num_rows($result2) > 0) {
        echo "<table border='1'>";
        echo "<tr>";
        echo "<th>Skladiste_id</th>";
        echo "<th>Prodavaonica_id</th>";
        echo "<th>kolicinaArtikla</th>";
        echo "</tr>";

        while($row = mysqli_fetch_array($result2)) {
            echo "<tr>";
            echo "<td>" . $row['Skladiste_id'] . "</td>";
            echo "<td>" . $row['Prodavaonica_id'] . "</td>";
            echo "<td>" . $row['kolicinaArtikla'] . "</td>";
        }
        echo "</table>";
        mysqli_free_result($result2);
    } else {
        echo "No records matching your query were found.";
    }
} else {
    echo "ERROR: Could not able to execute $sql2. " . mysqli_error($veza);
}
mysqli_close($veza);