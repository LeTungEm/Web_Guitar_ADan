<?php
class Cat extends Db
{
    public function getAll()
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, `status`, `isProfes`, `type`, `isShow`, `image`, `video`, `is_delete`, `isBestSeller`, `isNew`, category.name as category_name, brand.name as brand_name FROM `cat` INNER JOIN category on cat.category_id = category.category_id INNER JOIN brand on brand.brand_id = cat.brand WHERE type = 'product' ORDER BY cat_id DESC";
        return $this->select($sql);
    }
    public function getAllAccessory()
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, `status`, `isProfes`, `type`, `isShow`, `image`, `video`, `is_delete`, `isBestSeller`, `isNew`, category.name as category_name, brand.name as brand_name FROM `cat` INNER JOIN category on cat.category_id = category.category_id INNER JOIN brand on brand.brand_id = cat.brand WHERE type = 'accessory' ORDER BY cat_id DESC";
        return $this->select($sql);
    }
    public function getBestSeller()
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, cat.`status`, `isProfes`, `type`, cat.`isShow`, `image`, `video`, `is_delete`, category.name as category_name FROM `cat` INNER JOIN category ON category.category_id = cat.category_id WHERE type = 'product' and `isBestSeller` = 1 ORDER BY cat_id DESC";
        return $this->select($sql);
    }
    public function getNewProduct()
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, cat.`status`, `isProfes`, `type`, cat.`isShow`, `image`, `video`, `is_delete`, category.name as category_name FROM `cat` INNER JOIN category ON category.category_id = cat.category_id WHERE type = 'product' and `isNew` = 1 ORDER BY cat_id DESC";
        return $this->select($sql);
    }
    public function getAllCatByCategorySlug($category_slug)
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, cat.`status`, `isProfes`, `type`, cat.`isShow`, `image`, `video`, `is_delete`, category.name as category_name FROM `cat` INNER JOIN category ON category.category_id = cat.category_id WHERE category.slug = ? and type = 'product' ORDER BY cat_id DESC";
        return $this->select($sql, array($category_slug));
    }
    public function getAllParentChildByCategorySlug($category_slug)
    {
        $sql = "SELECT `cat_id`, cat.`name`, cat.`slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, cat.`description`, cat.`status`, `isProfes`, `type`, cat.`isShow`, `image`, `video`, `is_delete`, category.name as category_name FROM `cat` INNER JOIN category ON category.category_id = cat.category_id WHERE category.slug = ? OR category.slug in (SELECT T2.slug FROM category as T1 INNER JOIN category as T2 on T1.category_id = T2.parent_category WHERE T1.slug = ?) and type = 'product' ORDER BY cat_id DESC";
        return $this->select($sql, array($category_slug, $category_slug));
    }
    public function getBySlug($slug)
    {
        $sql = "SELECT cat.`cat_id`, cat.`name`, cat.`slug`, cat.`price`, cat.`new_price`, cat.brand, brand.name as brand_name, cat.origin, origin.name as origin_name, cat.`outstanding`, cat.`description`, cat.`status`, cat.`isProfes`, cat.`type`, cat.`isShow`, cat.`image`, cat.`video`, cat.category_id, category.name as category_name, cat.`isBestSeller`, cat.`isNew` FROM `cat` INNER JOIN brand on brand.brand_id = cat.brand INNER JOIN origin on origin.origin_id = cat.origin INNER JOIN category on  category.category_id = cat.category_id WHERE cat.slug = ?";
        $data = $this->select($sql, array($slug));
        if (count($data) > 0) {
            return $data[0];
        } else {
            return null;
        }
    }
    public function changeIsShow($cat_id, $isShow)
    {
        $sql = "UPDATE `cat` SET `isShow`= ? WHERE `cat_id` = ?";
        $result = $this->update($sql, array($isShow, $cat_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function changeBestSellerList($cat_id, $isBestSeller)
    {
        $sql = "UPDATE `cat` SET `isBestSeller`= ? WHERE `cat_id` = ?";
        $result = $this->update($sql, array($isBestSeller, $cat_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function changeNewList($cat_id, $isNew)
    {
        $sql = "UPDATE `cat` SET `isNew`= ? WHERE `cat_id` = ?";
        $result = $this->update($sql, array($isNew, $cat_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function deleteCat($cat_id, $listImage)
    {
        $sql = "DELETE FROM `cat` WHERE `cat_id` = ?";
        $result = $this->delete($sql, array($cat_id));
        $isDeleteAllImage = $this->deleteImage($listImage);
        if ($result['rowCount'] > 0) {
            return ['message' => true, 'isDeleteAllImage' => $isDeleteAllImage];
        } else {
            return ['message' => false, 'isDeleteAllImage' => $isDeleteAllImage];
        }
    }
    public function deleteImage($listImage)
    {
        $imageArr = json_decode($listImage);
        $countImageDeleted = 0;
        $path = '../../uploads/';
        if (count($imageArr) > 0) {
            foreach ($imageArr as $imageName) {
                $imageLink = $path . $imageName;
                if (file_exists($imageLink)) {
                    if (unlink($imageLink)) {
                        $countImageDeleted++;
                    }
                }
            }
            if ($countImageDeleted == count($imageArr)) {
                return true;
            } else {
                return false;
            }
        }
    }

    public function searchCat($search)
    {
        $search = "'%" . $search . "%'";
        $sql = "SELECT cat.`cat_id`, cat.`name`, cat.`slug`, cat.`price`, cat.`new_price`, cat.brand, brand.name as brand_name, cat.origin, origin.name as origin_name, cat.`outstanding`, cat.`description`, cat.`status`, cat.`isProfes`, cat.`type`, cat.`isShow`, cat.`image`, cat.`video`, cat.category_id, category.name as category_name, cat.`isBestSeller`, cat.`isNew` FROM `cat` INNER JOIN brand on brand.brand_id = cat.brand INNER JOIN origin on origin.origin_id = cat.origin INNER JOIN category on  category.category_id = cat.category_id where cat.name like " . $search . " or category.name like " . $search;
        return $this->select($sql);
    }
    public function insertCat($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $is_delete, $category_id, $isBestSeller, $isNew)
    {
        $sql = "INSERT INTO `cat`(`name`, `slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, `description`, `status`, `isProfes`, `type`, `isShow`, `image`, `video`, `is_delete`, `category_id`, `isBestSeller`, `isNew`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $result = $this->insert($sql, array($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $is_delete, $category_id, $isBestSeller, $isNew));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function updateCat($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $is_delete, $category_id, $isBestSeller, $isNew, $cat_id)
    {
        $sql = "UPDATE `cat` SET `name`=?,`slug`=?,`price`=?,`new_price`=?,`brand`=?,`origin`=?,`outstanding`=?,`description`=?,`status`=?,`isProfes`=?,`type`=?,`isShow`=?,`image`=?,`video`=?,`category_id`=?,`isBestSeller`=?,`isNew`=? WHERE `cat_id` = ?";
        $result = $this->update($sql, array($name, $slug, $price, $new_price, $brand, $origin, $outstanding, $description, $status, $isProfes, $type, $isShow, $image, $video, $category_id, $isBestSeller, $isNew, $cat_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }

}
?>