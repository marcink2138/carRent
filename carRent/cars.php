<?php
$carList = $databaseConnection->getCarList();
echo $twig->render('cars.html.twig', array(
    'carList'=>$carList
));