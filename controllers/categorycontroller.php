<?php

class CategoryController extends Controller
{
                     public function __construct($model, $action)
    {
        parent::__construct($model, $action);
        $this->_setModel($model);
    }
    
    public function index()
    {
        try {
            
            $categories = $this->_model->getCategories();
            $this->_view->set('categories', $categories);
            $this->_view->set('title', 'Categoryes articles from DB');
            
            return $this->_view->output();
            
        } catch (Exception $e) {
            echo '<h1>Application error:</h1>' . $e->getMessage();
        }
    }
    
    public function details($articleId)
    {
        try {
            
            $article = $this->_model->getArticleById((int)$articleId);
            
            if ($article)
            {
                $this->_view->set('title', $article['title']);
                $this->_view->set('articleBody', $article['article']);
                $this->_view->set('datePublished', $article['date']);
            }
            else 
            {
                $this->_view->set('title', 'Invalid article ID');
                $this->_view->set('noArticle', true);
            }
            
            return $this->_view->output();
             
        } catch (Exception $e) {
            echo '<h1>Application error:</h1>' . $e->getMessage();
        }
    }
}