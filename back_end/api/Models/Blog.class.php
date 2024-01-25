<?php

class Blog extends Db
{
    public function getAll()
    {
        $sql = "SELECT * from `blog`";
        return $this->select($sql);
    }
    public function getAllBC()
    {
        $sql = "SELECT * from `blog` where `type` = 'bc'";
        return $this->select($sql);
    }
    public function getAllTN()
    {
        $sql = "SELECT * from `blog` where `type` = 'tn'";
        return $this->select($sql);
    }

    public function getBCActiveLimit($limit, $length)
    {
        $sql = "SELECT * from `blog` where is_show = 1 and `type` = 'bc' limit " . $limit . ", " . $length;
        return $this->select($sql);
    }
    public function getTNActiveLimit($limit, $length)
    {
        $sql = "SELECT * from `blog` where is_show = 1 and `type` = 'tn' limit " . $limit . ", " . $length;
        return $this->select($sql);
    }

    public function countBC()
    {
        $count = $this->select("select count(blog_id) as count from blog where `type` = 'bc'");
        return $count[0]["count"];
    }
    public function countTN()
    {
        $count = $this->select("select count(blog_id) as count from blog where `type` = 'tn'");
        return $count[0]["count"];
    }
    
     public function getBySlug($slug)
    {
        $sql = "SELECT * from `blog` where slug = ?";
        $data = $this->select($sql, array($slug));
        if (count($data) > 0) {
            return $data[0];
        } else {
            return null;
        }
    }

    public function updateIsShow($blogId, $isShow)
    {
        $sql = "UPDATE `blog` SET `is_show`= ? where blog_id = ?";
        $result = $this->update($sql, array($isShow, $blogId));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    
    public function insertBlog($name, $short_description, $description, $is_show, $image, $slug, $type)
    {
        $sql = "INSERT INTO `blog`(`name`, `short_description`, `description`, `is_show`, `image`, `slug`, `type`) VALUES (?,?,?,?,?,?,?)";
        $result = $this->update($sql, array($name, $short_description, $description, $is_show, $image, $slug, $type));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    
    public function updateBlog($name, $short_description, $description, $is_show, $image, $slug, $type, $blog_id)
    {
        $sql = "UPDATE `blog` SET `name`= ?,`short_description`= ?,`description`= ?,`is_show`= ?,`image`= ?,`slug`= ?, `type`= ? WHERE `blog_id` = ?";
        $result = $this->update($sql, array($name, $short_description, $description, $is_show, $image, $slug, $type, $blog_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    
    public function deleteBlog($blog_id)
    {
        $sql = "DELETE FROM `blog` WHERE `blog_id` = ?";
        $result = $this->update($sql, array($blog_id));
        if ($result['rowCount'] > 0) {
            return ['message' => true];
        } else {
            return ['message' => false];
        }
    }
    
    
}
?>