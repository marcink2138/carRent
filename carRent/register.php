<?php
$status = true;
if (!empty($_POST['registerLogin']) && !empty($_POST['registerPassword'])) {

    $databaseConnection = new DatabaseConnection();
    $status = $databaseConnection->register();
}

echo $twig->render('register.html.twig', array(
    'status'=>$status
));