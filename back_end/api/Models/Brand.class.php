<?php
class Brand extends Db
{
    public function getAll()
    {
        $sql = "SELECT brand_id as `key`, name from brand";
        return $this->select($sql);
    }
    public function insertBrand($name)
    {
        $sql = "INSERT INTO `brand`(`name`) VALUES (?)";
        $result = $this->insert($sql, array($name));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function updateBrand($name, $brand_id)
    {
        $sql = "UPDATE `brand` SET `name`= ? WHERE `brand_id` = ?";
        $result = $this->insert($sql, array($name, $brand_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
}
?>