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
include('../Models/Cat.class.php');

$action = isset($_POST["action"]) ? $_POST["action"] : '';
$cat = new Cat();
$message = array();
switch ($action) {
    case "getAll":
        $message = $cat->getAll();
        break;
    case "getAllAccessory":
        $message = $cat->getAllAccessory();
        break;
    case "getBestSeller":
        $message = $cat->getBestSeller();
        break;
    case "getNewProduct":
        $message = $cat->getNewProduct();
        break;
    case "getAllCatByCategorySlug":
        $category_slug = $_POST["category_slug"];
        $message = $cat->getAllCatByCategorySlug($category_slug);
        break;
    case "getAllParentChildByCategorySlug":
        $category_slug = $_POST["category_slug"];
        $message = $cat->getAllParentChildByCategorySlug($category_slug);
        break;
    case "getBySlug":
        $slug = $_POST["slug"];
        $message = $cat->getBySlug($slug);
        break;
    case "changeIsShow":
        $cat_id = $_POST["cat_id"];
        $isShow = $_POST["isShow"];
        $message = $cat->changeIsShow($cat_id, $isShow);
        break;
    case "changeBestSellerList":
        $cat_id = $_POST["cat_id"];
        $isBestSeller = $_POST["isBestSeller"];
        $message = $cat->changeBestSellerList($cat_id, $isBestSeller);
        break;
    case "changeNewList":
        $cat_id = $_POST["cat_id"];
        $isNew = $_POST["isNew"];
        $message = $cat->changeNewList($cat_id, $isNew);
        break;
    case "deleteCat":
        $cat_id = $_POST["cat_id"];
        $listImage = $_POST["listImage"];
        $message = $cat->deleteCat($cat_id, $listImage);
        break;
    case "searchCat":
        $search = $_POST["search"];
        $message = $cat->searchCat($search);
        break;
    case "deleteImage":
        $listImage = $_POST["listImage"];
        $message = $cat->deleteImage($listImage);
        break;
    case "insertCat":
        $name = $_POST["name"];
        $slug = $_POST["slug"];
        $price = $_POST["price"];
        $new_price = $_POST["new_price"];
        $brand = $_POST["brand"];
        $origin = $_POST["origin"];
        $outstanding = $_POST["outstanding"];
        $description = $_POST["description"];
        $status = $_POST["status"];
        $isProfes = $_POST["isProfes"];
        $type = $_POST["type"];
        $isShow = $_POST["isShow"];
        $image = $_POST["image"];
        $video = $_POST["video"];
        $is_delete = $_POST["is_delete"];
        $category_id = $_POST["category_id"];
        $isBestSeller = $_POST["isBestSeller"];
        $isNew = $_POST["isNew"];
        $message = $cat->insertCat($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $is_delete, $category_id, $isBestSeller, $isNew);
        break;
    case "updateCat":
        $name = $_POST["name"];
        $slug = $_POST["slug"];
        $price = $_POST["price"];
        $new_price = $_POST["new_price"];
        $brand = $_POST["brand"];
        $origin = $_POST["origin"];
        $outstanding = $_POST["outstanding"];
        $description = $_POST["description"];
        $status = $_POST["status"];
        $isProfes = $_POST["isProfes"];
        $type = $_POST["type"];
        $isShow = $_POST["isShow"];
        $image = $_POST["image"];
        $video = $_POST["video"];
        $is_delete = $_POST["is_delete"];
        $category_id = $_POST["category_id"];
        $isBestSeller = $_POST["isBestSeller"];
        $isNew = $_POST["isNew"];
        $cat_id = $_POST["cat_id"];
        $message = $cat->updateCat($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $is_delete, $category_id, $isBestSeller, $isNew, $cat_id);
        break;
    default:
        $message = "action is not found";
        break;

}

header('Content-Type: application/json; charset=utf-8');
// ob_clean();
echo json_encode($message, JSON_NUMERIC_CHECK);
?>