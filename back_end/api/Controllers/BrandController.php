<?php
header("Access-Control-Allow-Origin: *");
// header("Content-Type: application/json;");
// header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
// header("Access-Control-Max-Age: 3600");
// header("Access-Control-Allow-Headers: Content-Type,
//     Access-Control-Allow-Headers, Authorization, X-Requested-With"); 
// header("Access-Control-Allow-Origin: http://localhost:8080");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include("../Config/config.php");
include('../Models/Db.class.php');
include('../Models/Brand.class.php');

$action = isset($_POST["action"]) ? $_POST["action"] : '';
$brand = new Brand();
$message = array();
switch ($action) {
    case "getAll":
        $message = $brand->getAll();
        break;
    case "insertBrand":
        $name = $_POST["name"];
        $message = $brand->insertBrand($name);
        break;
    case "updateBrand":
        $name = $_POST["name"];
        $brand_id = $_POST["brand_id"];
        $message = $brand->updateBrand($name, $brand_id);
        break;
    default:
        $message = "action is not found";
        break;

}

header('Content-Type: application/json; charset=utf-8');
// ob_clean();
echo json_encode($message, JSON_NUMERIC_CHECK);
?>