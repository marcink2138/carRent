<?php
$id = $_GET['car'];
$car = $databaseConnection->getSingleCar($id);
$dates = $databaseConnection->getLoanList($id);
$arr = array();
if (!empty($_POST['rentStart'])&&!empty($_POST['rentEnd'])){
    $databaseConnection->bookCar($_SESSION['id'], $id, $_POST['rentStart'], $_POST['rentEnd'], (int)$_POST['totalCost']);
    $_SESSION['carRented'] = $car['title'];
    $twig->addGlobal('session', $_SESSION);

}
$dates = $databaseConnection->getLoanList($id);
$arr = array();
for ($i = 0; $i < sizeof($dates); $i++){
    $temp = array("title" => "Zarezerwowane",
        "start" => $dates[$i]['loanStart'],
        "end"=>date('Y-m-d', strtotime($dates[$i]['loanEnd'].'+ 1 day')),
        "display" => 'background',
        "textColor" => 'white',
        "color" => 'red'
    );
    $arr[]=$temp;
}

echo $twig->render('singleCar.html.twig', array(
    'car'=>$car,
    'dates'=>$arr
));