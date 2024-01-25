<?php
class Origin extends Db
{
    public function getAll()
    {
        $sql = "SELECT origin_id as `key`, name from origin";
        return $this->select($sql);
    }
    public function insertOrigin($name)
    {
        $sql = "INSERT INTO `origin`(`name`) VALUES (?)";
        $result = $this->insert($sql, array($name));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    public function updateOrigin($name, $origin_id)
    {
        $sql = "UPDATE `origin` SET `name`= ? WHERE `origin_id` = ?";
        $result = $this->insert($sql, array($name, $origin_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
}
?>