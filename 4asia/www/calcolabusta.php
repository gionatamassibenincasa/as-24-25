<h1>Calcola la busta paga</h1>

<?php
$sql = "SELECT nome, cognome, CF " .
"FROM Dipendente " .
"WHERE CF='" .
$_REQUEST["cf"] . "'";
   // DataBase File path
   $dbf = "data/bustapaga.db3";
   // Data Source Name (DSN)
   $dsn = "sqlite:$dbf";

   try {
	   $conn = new PDO($dsn);
   } catch (PDOException $e) {
	   echo $e->getMessage();
	   die();
   }
   $result = $conn->query($sql);
   if (!$result) {
	   echo "<p>Could not retrieve Dipendente list: " .
		   $conn->errorInfo() .
		   "</p>";
	   die();
   }
   
   // echo $sql;
   $dipendente = $result->fetch();
   $conn = null;

   $mese = date("m");
   $anno = date("Y");
?>


<table>
   <thead>
      <th>Cognome</th>
      <th>Nome</th>
      <th>Codice fiscale</th>
      <th>Mese</th>
      <th>Anno</th>
   </thead>
   <tbody>
      <td><?= $dipendente["cognome"] ?></td>
      <td><?= $dipendente["nome"] ?></td>
      <td><?= $dipendente["CF"] ?></td>
      <td><?= $mese ?></td>
      <td><?= $anno ?></td>
   </tbody>
</table>




