<?php

class Setting extends Db
{
    public function getAll()
    {
        $sql = "SELECT * from `setting`";
        $data = $this->select($sql);
        if (count($data) > 0) {
            return $data[0];
        } else {
            return null;
        }
    }
    
    public function updateClientRespons($client_respons)
    {
        $sql = "UPDATE `setting` SET `client_respons`= ?";
        return $this->update($sql, array($client_respons));
    }

    public function updateSetting($banner, $facebook, $tiktok, $instagram, $youtube, $phone, $zalo, $messenger)
    {
        $sql = "UPDATE `setting` SET `footer_content`=?,`facebook`=?,`tiktok`=?,`instagram`=?,`youtube`=?,`phone`=?,`zalo`=?,`messenger`=?";
        return $this->update($sql, array($banner, $facebook, $tiktok, $instagram, $youtube, $phone, $zalo, $messenger));
    }
}
?>