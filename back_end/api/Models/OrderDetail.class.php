<?php
class OrderDetail extends Db
{
    public function getAllByOrderId($order_id)
    {
        $sql = "SELECT * FROM `order_detail` WHERE `order_id` = ?";
        return $this->select($sql, array($order_id));
    }

    public function insertOrderDetail($order_id, $listDetail)
    {
        $orderDetail = json_decode($listDetail);
        $arrValueForm = array();
        $arrValue = array();
        foreach ($orderDetail as $value) {
            $arrValue[] = $order_id;
            $arrValue[] = $value->quantity;
            $arrValue[] = $value->price;
            $arrValue[] = $value->cat_id;
            $arrValueForm[] = '(?,?,?,?)';
        }
        $sql = "INSERT INTO `order_detail`(`order_id`, `quantity`, `price`, `cat_id`) VALUES ". implode(", ", $arrValueForm) . ';';
        $result = $this->insert($sql, $arrValue);
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }

}
?>