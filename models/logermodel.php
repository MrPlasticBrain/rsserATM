<?php
  Class LogerModel extends Model {
   public function _getRssUrlsLog($id){
        $where = '';
        if($id){
            $where .= "WHERE r.id=$id";
        }
        $sql = "SELECT 
                    r.id, 
                    r.rssname, 
                    r.rssurl, 
                    r.category, 
                    r.inputdate 
                FROM
                    rss_urls as r
                    $where  
                ORDER BY r.inputdate DESC";
            
         $this->_setSql($sql);
         if($id){
             $rssUrl = $this->getAll(); 
         }else{
             $rssUrl = $this->getRow(); 
         }
         
         
         if(empty($rssUrl)){return;}
         
         return $rssUrl;
    }
    public function logData($LogPerson,$LogInfo,$LogDate){
        $LogDateD = date('Y-m-d H:i:s');
        if($LogDate!=null){
            $LogDateD = $LogDate;    
        }
        
        $sql = "INSERT INTO rsser.logging (
                LogDate ,
                LogPerson ,
                LogInfo
                )
                VALUES (?, ?, ?)";
     
        $data = array(
            $LogDateD,
            $LogPerson,
            $LogInfo,
        );
        
        $sth = $this->_db->prepare($sql);
        return $sth->execute($data);
        
    }
      
  }
?>
