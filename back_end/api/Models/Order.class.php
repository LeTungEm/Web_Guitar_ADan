<?php
class Order extends Db
{
    public function getAll()
    {
        $sql = "SELECT * from `order` ORDER BY order_id DESC";
        return $this->select($sql);
    }

    public function insertOrder($user_name, $user_phone, $address, $total)
    {
        $sql = "INSERT INTO `order`(`user_name`, `user_phone`, `address`, `total`) VALUES (?, ?, ?, ?)";
        $result = $this->insert($sql, array($user_name, $user_phone, $address, $total));
        if ($result['rowCount'] > 0) {
            $this->sendMail();
            return ['message' => true, 'order_id' => $result['lastInsertId']];
        } else {
            return ['message' => false, 'order_id' => $result['lastInsertId']];
        }
    }

    public function sendMail()
    {
        $to = "em.letung213@gmail.com";
        $subject = "Tiêu đề email";
        $message = "<h1>Đây là Email có chứa HTML</h1>
            <p>Đoạn văn trong Email</p>";

        $header = "From:myemail@exmaple.com \r\n";
        $header .= "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html\r\n";

        mail($to, $subject, $message, $header);

    }

}
?>