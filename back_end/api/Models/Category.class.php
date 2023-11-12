<?php
class Category extends Db
{
    public function getAll()
    {
        $sql = "SELECT * from category";
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

}
?>