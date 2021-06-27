<?php


class DatabaseConnection
{

    private $dbh;

    private function openConnection()
    {
        include('config.inc.php');
        try {
            if (isset($config) && is_array($config)) {

                try {
                    $this->dbh = new PDO('mysql:host=' . $config['db_host'] . ';dbname=' . $config['db_name'] . ';charset=utf8mb4', $config['db_user'], $config['db_password']);
                    $this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    return true;
                } catch (PDOException $e) {
                    echo $e;
                    return "databaseIncorrectConfig";
                }

            } else {
                return "databaseIncorrectConfig";

            }
        } catch (PDOException $e) {
            return "databaseError";
        }
    }

    private function closeConnection()
    {
        $this->dbh = null;
    }

    function register()
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare('INSERT INTO users (email, password) VALUES (
                                     :email, :password)');
        $password = password_hash($_POST['registerPassword'], PASSWORD_DEFAULT);
        $login = $_POST['registerLogin'];
        try {
            $stmt->execute([':email' => $login, ':password' => $password]);
            $this->closeConnection();
            return $stmt;
        } catch (PDOException $e) {
            $this->closeConnection();
            return false;
        }

    }

    function logIn()
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT * FROM users WHERE (email = :email )");
        $login = $_POST['main_login'];
        $stmt->execute([':email' => $login]);
        $this->closeConnection();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function getCarList()
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT * FROM cars");
        $stmt->execute();
        $this->closeConnection();
        return $stmt->fetchAll();
    }

    function getSingleCar($id)
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT * FROM cars WHERE id = :id");
        $stmt->execute([':id' => $id]);
        $this->closeConnection();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function getListOfIds()
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT id FROM cars");
        $stmt->execute();
        $this->closeConnection();
        return $stmt->fetchAll();
    }

    function getLoanList($id)
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT loanStart, loanEnd from users where carRented = (SELECT title from cars where id = :id)");
        $stmt->execute([':id' => $id]);
        $this->closeConnection();
        return $stmt->fetchAll();
    }

    function bookCar($userId, $carId, $loanStart, $loanEnd, $fee)
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("UPDATE users SET carRented = (SELECT title FROM cars WHERE id=:carId), 
                 loanStart = :loanStart, loanEnd = :loanEnd , fee = :fee WHERE id=:userId");
        try {
            $stmt->execute([':carId'=>$carId, ':loanStart'=>$loanStart, ':loanEnd'=>$loanEnd,':fee'=>$fee ,':userId'=>$userId]);
            $this->closeConnection();
            return true;
        }catch (PDOException $e){
            $this->closeConnection();
            echo $e;
            return false;
        }
    }

    function getSingleLoan($userId){
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT loanStart, loanEnd, fee from users where id = :userId");
        $stmt->execute([':userId'=>$userId]);
        $this->closeConnection();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function getSingleCarByTitle($title)
    {
        $this->openConnection();
        $stmt = $this->dbh->prepare("SELECT * FROM cars WHERE title = :title");
        $stmt->execute([':title' => $title]);
        $this->closeConnection();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}