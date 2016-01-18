<?php

class RssController extends Controller
{
    public function __construct($model, $action)
    {
        parent::__construct($model, $action);
        $this->_setModel($model);
         try {
          $rssDBlog = $this->_LogModel->logData('ControllerRss','Call Controller Construct',null);
          } catch (Exception $e) {
            echo '<h1>Application error:</h1>' . $e->getMessage();
        }

    }
    
    public function index($urlID)
    {                            
        try {
            var_dump('nothing to see here ... OK !?! (0~0)');
        } catch (Exception $e) {
            echo '<h1>Application error:</h1>' . $e->getMessage();
        }
    }
    
    public function getDataFromRss(){
        var_dump('d');
    }
    /*
    * CronControllerFunction  
    */
    public function cronCroller($postData){
        $this->_pp('UPDATE `rss_urls` SET `active`=0 WHERE 1');
        $rssURLS = $this->_model->_getRssUrls($postData);
        if($rssURLS != null){
            foreach($rssURLS as $url){
                $this->callRss($url['rssurl']);
            }
        }
        
    }
    private function callRss($url){
        if($url){
            try {
                $rss = simplexml_load_file($url);
                $this->getDataWithImages($rss);
                /*ZOKI PEDER*/
                
              //  $rss = $this->getDataWithImageNEW($url);
                if($rss){
                    $this->_LogModel->logData('OK: callRss','Success Execute: '.$url,null);
                }else{
                    $error = $rss;
                    throw new Exception($error);
                }
                
            } catch (Exception $e) {
                echo "<h1> $url Application error:</h1> ". $e->getMessage();
                $this->_LogModel->logData('ERROR: callRss','ERROR Execute: '.$url."  ERROR->desc :".$e->getMessage(),null);
            }    
        }
    }
    public function getDataWithImages($data){
       $feed = array();
        foreach ($data->channel->item as $node) { 
            var_dump($node->enclosure->attributes()->url);
          $item = array (
            'title' => $node->title,
            'description' => $node->description,
            'link' => $node->link,
            'pubDate' => $node->pubDate,
            'category'=> $node->category,
          );
          if($node->enclosure->attributes()->url != null && $node->enclosure->attributes()->url != ''){
              $this->_pp($node->enclosure->attributes()->url[0]);
              $ar = array(
              'image' => $node->enclosure->attributes()->url,
              );
              array_push($item, $ar);
          }else{
              $ar = array(
              'image' => '',
              );
              array_push($item, $ar);
          }
          
          array_push($feed, $item);
        }
        return $feed;
    }
   /* public function getDataWithImageNEW($url){
        $rss = new DOMDocument();
        $rss->load($url);
        $feed = array();
        foreach ($rss->getElementsByTagName('item') as $node) {
            var_dump($node);
          $item = array (
            'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
            'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
            'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
            'date' => $node->getElementsByTagName('pubDate')->item(0)->nodeValue,
            'image' => $node->getElementsByTagName('whattagdoiaddhere')->item(0)->nodeValue,
          );
          array_push($feed, $item);
        }
        //$this->_pp($feed);
    } */
}