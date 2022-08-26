<?php
// On détermine sur quelle page on se trouve
if (isset($_GET['page']) && !empty($_GET['page'])) {
  $currentPage = (int) strip_tags($_GET['page']);
} else {
  $currentPage = 1;
}
// On se connecte à là base de données
require_once('connect.php');

// On détermine le nombre total d'offres
$sql = 'SELECT COUNT(*) AS nb_offres FROM `offres`;';

// On prépare la requête
$query = $db->prepare($sql);

// On exécute
$query->execute();

// On récupère le nombre d'offres
$result = $query->fetch();

$nbOffres = (int) $result['nb_offres'];

// On détermine le nombre d'offres par page
$parPage = 10;

// On calcule le nombre de pages total
$pages = ceil($nbOffres / $parPage);

// Calcul de la 1ère offre de la page
$premier = ($currentPage * $parPage) - $parPage;

$sql = 'SELECT * FROM `offres` ORDER BY `date_publication` DESC LIMIT :premier, :parpage;';

// On prépare la requête
$query = $db->prepare($sql);

$query->bindValue(':premier', $premier, PDO::PARAM_INT);
$query->bindValue(':parpage', $parPage, PDO::PARAM_INT);

// On exécute
$query->execute();

// On récupère les valeurs dans un tableau associatif
$offres = $query->fetchAll(PDO::FETCH_ASSOC);

require_once('close.php');
?>
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Test PHP SQL</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
  <main class="container">
    <div class="row">
      <section class="col-12">
        <h1>Liste des offres</h1>


        <div class="offre_body">
          <form class="" method="GET">
            <div class="row">
              <div class="col-md-4">
                <div class="input-group mb-3">
                  <select name="filtre" class="form-control">
                    <option>--Selectionner--</option>
                    <option value="a-z" <?php if (isset($_GET['alphabet']) && ($_GET['alphabet'] == "a-z")) ?>>Par ordre Alphabétique</option>
                    <option value="date" <?php if (isset($_GET['asc_date']) && ($_GET['asc_date'] == "date")) ?>>Par date de publication</option>
                  </select>

                  <?php
                  require_once('connect.php');

                  $filtre_option = "ASC";
                  if (isset($_GET['alphabet'])) {
                    if ($_GET['filtre'] == "a-z") {
                      $query = "SELECT * FROM offres ORDER BY ville ASC";
                    }
                  }
                  if (isset($_GET['asc_date'])) {
                    if ($_GET['filtre'] == "date") {
                      $query = "SELECT * FROM offres ORDER BY date_publication ASC";
                    }
                  }
                  ?>
                  <button type="submit" class="input-group-text btn btn-primary" id="basic-addon2">
                    Filtrer
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <table class="table">
          <thead>
            <th>ID</th>
            <th>Date de publication</th>
            <th>Entreprise</th>
            <th>Intitulé</th>
            <th>Réference</th>
            <th>Metier</th>
            <th>Contrat</th>
            <th>Ville</th>
            <th>Description</th>

          </thead>

          <tbody>
            <?php
            foreach ($offres as $offre) {
            ?>
              <tr>
                <td><?= $offre['id'] ?></td>
                <td><?= $offre['date_publication'] ?></td>
                <td><?= $offre['nom_entreprise'] ?></td>
                <td><?= $offre['intitule'] ?></td>
                <td><?= $offre['reference'] ?></td>
                <td><?= $offre['type_metier'] ?></td>
                <td><?= $offre['type_contrat'] ?></td>
                <td><?= $offre['ville'] ?></td>
                <td><?= $offre['description'] ?></td>
              </tr>
            <?php
            }
            ?>

          </tbody>
        </table>
        <nav>
          <ul class="pagination">
            <li class="page-item <?= ($currentPage == 1) ? "disabled" : "" ?>">
              <a href="./?page=<?= $currentPage - 1 ?>" class="page-link">Précédente</a>
            </li>
            <?php for ($page = 1; $page <= $pages; $page++) : ?>
              <li class="page-item <?= ($currentPage == $page) ? "active" : "" ?>">
                <a href="./?page=<?= $page ?>" class="page-link"><?= $page ?></a>
              </li>
            <?php endfor ?>
            <li class="page-item <?= ($currentPage == $pages) ? "disabled" : "" ?>">
              <a href="./?page=<?= $currentPage + 1 ?>" class="page-link">Suivante</a>
            </li>
          </ul>
        </nav>
      </section>
    </div>
  </main>
</body>

</html>