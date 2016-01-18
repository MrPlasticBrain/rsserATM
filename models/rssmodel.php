<?php

class RssModel extends Model
{
    public function _getRssUrls($id){
        $where = 'WHERE r.active = 1';
        if($id){
            $where .= " AND r.id=$id";
        }
        $sql = "SELECT 
                    r.id, 
                    r.rssname, 
                    r.rssurl, 
                    r.category, 
                    r.inputdate,
                    r.active 
                FROM
                    rss_urls as r
                    $where  
                ORDER BY r.inputdate DESC";
            
         $this->_setSql($sql);
         $rssUrl = $this->getAll(); 
         if(empty($rssUrl)){return;}
         
         return $rssUrl;
    }
    public function getRssData()
    {
        $sql = "SELECT
                    a.id,
                    a.title,
                    a.intro,
                    DATE_FORMAT(a.date, '%d.%m.%Y.') as date,
                    c.category_name
                FROM 
                    articles a
                INNER JOIN 
                    categories AS c ON a.category = c.category_id 
                ORDER BY a.date DESC";
        
        $this->_setSql($sql);
        $articles = $this->getAll();
        
        if (empty($articles))
        {
            return false;
        }
        
        return $articles;
    }
    
    public function getArticleById($id)
    {
        $sql = "SELECT
                    a.title,
                    a.article,
                    DATE_FORMAT(a.date, '%d.%m.%Y.') as date,
                    c.category_name 
                FROM 
                    articles a
                INNER JOIN categories AS c ON a.category = c.category_id 
                WHERE 
                    a.id = ?";
        
        $this->_setSql($sql);
        $articleDetails = $this->getRow(array($id));
        
        if (empty($articleDetails))
        {
            return false;
        }
        
        return $articleDetails;
    }
}
