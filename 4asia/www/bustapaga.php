<!DOCTYPE html>
<html lang="it">

<head>
    <title>Buste paga</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>

    <?php
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

    $sql = "SELECT CF, cognome, nome FROM Dipendente";
    $result = $conn->query($sql);
    if (!$result) {
        echo "<p>Could not retrieve Dipendente list: " .
            $conn->errorInfo() .
            "</p>";
        die();
    }
    ?>

    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <caption>Dipendente</caption>
            <thead class="thead-dark">
                <tr>
                    <th>Cognome</th>
                    <th>Nome</th>
                    <th>Azione</th>
                </tr>
            </thead>
            <tbody><?php
                while ($row = $result->fetch()) {
                    // Un dipendente. Genero la riga
                    echo "\n\t\t\t\t<tr>\n" .
                        "\t\t\t\t\t<td>{$row["cognome"]}</td>\n" .
                        "\t\t\t\t\t<td>{$row["nome"]}</td>\n" .
                        "\t\t\t\t\t<td><a href=\"calcolabusta.php?cf={$row["CF"]}\"><i class=\"bi bi-calculator\"></i></a></td>\n" .
                        "\t\t\t\t</tr>";
                }
                ?>

            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>

</html>