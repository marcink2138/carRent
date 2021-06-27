<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);
define("IN_INDEX", 1);

use Twig\Environment;
use Twig\Loader\FilesystemLoader;

require 'vendor/autoload.php';
include("config.inc.php");
require('./DatabaseConnection.php');
$loader = new FilesystemLoader("templates");
$twig = new Environment($loader);
$date = date("Y-m-d");
$_SESSION['loginFail'] = false;
$databaseConnection = new DatabaseConnection();
if (!empty($_POST['main_login']) && !empty($_POST['main_password'])) {
    $user = $databaseConnection->logIn();
}
if (isset($user) && $user != false) {
// uzytkownik odnaleziony, w tablicy $user znajdują się wszystkie kolumny z tabeli

    $_SESSION['id'] = $user['id'];
    $_SESSION['email'] = $user['email'];
    $_SESSION['loginFail'] = false;
    $_SESSION['carRented'] = $user['carRented'];

} else if (isset($user) && $user == false) {
    $_SESSION['loginFail'] = true;
}
if (isset($_POST['logOut'])) {
    unset($_SESSION['id'], $_SESSION['email']);
}


$twig->addGlobal('date', $date);
$twig->addGlobal('session', $_SESSION);
$allowed_pages = ['main', 'cars', 'register', 'account'];
$protected_pages = ['account'];
if (isset($_GET['page']) && $_GET['page'] && in_array($_GET['page'], $allowed_pages)) {
    if (!in_array($_GET['page'], $protected_pages) || isset($_SESSION['id'])) {
        if (isset($_GET['car']) && $_GET['page'] == 'cars' && preg_match('/^[0-9]*$/', $_GET['car'])) {
            $listOfIds = $databaseConnection->getListOfIds();
            if (array_search($_GET['car'], array_column($listOfIds, 'id')) !== false)
                include 'singleCar.php';
            else {
                echo $twig->render('main.html.twig', array(
                    'date' => $date,
                ));
            }
        } elseif (file_exists($_GET['page'] . '.php')) {
            include($_GET['page'] . '.php');
        }
    } else {
        echo $twig->render('main.html.twig', array(
            'date' => $date,
        ));
    }
} else {
    echo $twig->render('main.html.twig', array(
        'date' => $date,
    ));
}




