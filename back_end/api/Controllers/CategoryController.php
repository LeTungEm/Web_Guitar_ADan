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
include('../Models/Category.class.php');

$action = isset($_POST["action"]) ? $_POST["action"] : '';
$category = new Category();
$message = array();
switch ($action) {
    case "getAll":
        $message = $category->getAll();
        break;
    case "getAllChild":
        $message = $category->getAllChild();
        break;
    case "getClassicCategory":
        $message = $category->getClassicCategory();
        break;
    case "getOldCategory":
        $message = $category->getOldCategory();
        break;
    case "getChildBySlug":
        $category_slug = $_POST["category_slug"];
        $message = $category->getChildBySlug($category_slug);
        break;
    // case "getDisplayCategories":
    //     $message = $categories->getDisplayCategories();
    //     break;
    // case "getSpecialCategories":
    //     $message = $categories->getSpecialCategories();
    //     break;
    default:
        $message = "action is not found";
        break;

}

header('Content-Type: application/json; charset=utf-8');
// ob_clean();
echo json_encode($message, JSON_NUMERIC_CHECK);
?>