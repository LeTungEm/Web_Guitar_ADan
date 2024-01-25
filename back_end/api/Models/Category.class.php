<?php
class Category extends Db
{
    public function getAll()
    {
        $sql = "SELECT * from category";
        return $this->select($sql);
    }
    public function getAllChild()
    {
        $sql = "SELECT * from category where parent_category <> 0";
        return $this->select($sql);
    }
    public function getClassicCategory()
    {
        $sql = "SELECT * from category WHERE parent_category = 3";
        return $this->select($sql);
    }
    public function getOldCategory()
    {
        $sql = "SELECT * from category WHERE parent_category = 4";
        return $this->select($sql);
    }
    public function getChildBySlug($slug)
    {
        $sql = "SELECT slug as `key`, name FROM `category` WHERE `parent_category` = (SELECT `category_id` FROM `category` WHERE `slug` = ?)";
        return $this->select($sql, array($slug));
    }


}
?>