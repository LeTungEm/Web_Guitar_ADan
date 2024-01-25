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
include('../Models/Blog.class.php');

$action = isset($_POST["action"]) ? $_POST["action"] : '';
$action = isset($_GET["action"]) ? $_GET["action"] : $action;
$blog = new Blog();
$message = array();
switch ($action) {
    case "getAll":
        $message = $blog->getAll();
        break;
    case "getAllBC":
        $message = $blog->getAllBC();
        break;
    case "getAllTN":
        $message = $blog->getAllTN();
        break;
    case "countBC":
        $message = $blog->countBC();
        break;
    case "countTN":
        $message = $blog->countTN();
        break;
    case "getBCActiveLimit":
        $limit = $_POST["limit"];
        $length = $_POST["length"];
        $message = $blog->getBCActiveLimit($limit, $length);
        break;
    case "getTNActiveLimit":
        $limit = $_POST["limit"];
        $length = $_POST["length"];
        $message = $blog->getTNActiveLimit($limit, $length);
        break;
    case "updateIsShow":
        $blogId = $_POST["blog_id"];
        $isShow = $_POST["is_show"];
        $message = $blog->updateIsShow($blogId, $isShow);
        break;
    case "getBySlug":
        $slug = isset($_POST["slug"]) ? $_POST["slug"] : '';
        $slug = isset($_GET["slug"]) ? $_GET["slug"] : $slug;
        $message = $blog->getBySlug($slug);
        break;
    case "insertBlog":
        $name = $_POST["name"];
        $short_description = $_POST["short_description"];
        $description = $_POST["description"];
        $is_show = $_POST["is_show"];
        $image = $_POST["image"];
        $slug = $_POST["slug"];
        $type = $_POST["type"];
        $message = $blog->insertBlog($name, $short_description, $description, $is_show, $image, $slug, $type);
        break;
    case "updateBlog":
        $name = $_POST["name"];
        $short_description = $_POST["short_description"];
        $description = $_POST["description"];
        $is_show = $_POST["is_show"];
        $image = $_POST["image"];
        $slug = $_POST["slug"];
        $type = $_POST["type"];
        $blog_id = $_POST["blog_id"];
        $message = $blog->updateBlog($name, $short_description, $description, $is_show, $image, $slug, $type, $blog_id);
        break;
    case "deleteBlog":
        $blog_id = $_POST["blog_id"];
        $message = $blog->deleteBlog($blog_id);
        break;
    default:
        $message = "action is not found";
        break;

}

header('Content-Type: application/json; charset=utf-8');
// ob_clean();
echo json_encode($message, JSON_NUMERIC_CHECK);
?>