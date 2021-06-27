<?php
if (!empty($_SESSION['carRented'])) {
    $title = $_SESSION['carRented'];
    $car = $databaseConnection->getSingleCarByTitle($title);
    $userLoan = $databaseConnection->getSingleLoan($_SESSION['id']);
    $userLoan['loanEnd'] = date('Y-m-d', strtotime($userLoan['loanEnd'].'+ 1 day'));
}else{
    $car=null;
    $userLoan=null;
}
echo $twig->render('account.html.twig', array(
    'car' => $car,
    'userLoan' => $userLoan
));