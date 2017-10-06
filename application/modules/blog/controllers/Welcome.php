<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->database();
		$this->load->library(array('Template','form_validation'));
		$this->load->helper(array('url','language'));
        $this->template->add_css('bootstrap');
		$this->template->add_css('template');
		$this->template->add_css('bootstrap.min');
		$this->template->add_css('blog_home');
		$this->template->add_js('jquery');
		$this->template->add_js('bootstrap.min');
	}

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
// var_dump($this->model_posts->get_joind('users','users','id'));
// exit();
	
                $data['site_name'] = 'BLOG-MINJEC';
		$data['calendar'] = $this->calendar->generate(); 
                $data['categories'] = $this->model_categories->get_record();
		if($this->session->userdata("user_id")){
                       $data['posts'] = array_reverse($this->model_posts->get_joind('users','users','id',array('users'=>$this->session->user_id)));
		    // $data['posts'] = array_reverse($this->model_posts->get_record(array('users'=>$this->session->user_id)));
		     $user = $this->model_users->get_record(array('id'=>$this->session->userdata("user_id")));
		   $this->session->set_userdata(array("name"=>$user[0]["first_name"]." ".$user[0]["last_name"], "company"=>$user[0]["company"]));
                }else{
                       $data['posts'] = array_reverse($this->model_posts->get_joind('users','users','id'));
			//$data['posts'] = $this->model_posts->get_record();
		}
		$this->template->view('public/vue_posts', $data);
	}

        /*
 	 *  Print out  all posts of a given category id
	 *
	 */
	public function category($id_category){
		$data['site_name'] = 'BLOG-MINJEC';
		$data['calendar'] = $this->calendar->generate(); 
        $data['categories'] = $this->model_categories->get_record();
        foreach($data['categories'] as $category){
			if($category['id_categories'] == $id_category){
				$data['category_name']["name"] = $category["name"];
				$data['category_name']["id"] = $category["id_categories"];
			}
		}
        $data['posts'] = array_reverse($this->model_posts->get_joind('users','users','id', array('categories_id_categories'=>$id_category)));
		$this->template->view('public/vue_posts', $data);
 	}
   
        /*
	 * Print out a post with it's comments given it id
  	 *
	 */
         public function post($id_post){
        $data['site_name'] = 'BLOG-MINJEC';
		$data['calendar'] = $this->calendar->generate(); 
        $data['categories'] = $this->model_categories->get_record();
        $post = $data['post'] = array_reverse($this->model_posts->get_joind('users','users','id',array('id_posts'=>$id_post)));
		foreach($data['categories'] as $category){
			if($category['id_categories'] == $post[0]["categories_id_categories"]){
				$data['category_name']["name"] = $category["name"];
				$data['category_name']["id"] = $category["id_categories"];
			}
		}
		$comment = $this->model_comments->get_joind('users','users','id',array('posts_id_posts'=>$id_post));
		$data['comments'] = $comment;
		$this->template->view('public/vue_comments', $data);
	}

        /*
	 * register a comment 
         * if simple personne comment must be validated
	 * if user comment published automaticaly
	 *
	 */
   	 public function comment($id_post){
	  	$comment = $this->input->post("comment"); 
                $date = new DateTime();
		$data['calendar'] = $this->calendar->generate(); 
		$this->model_comments->add_record(array('comments'=>$comment, 'comments_date'=>time(),'users'=>$this->session->user_id, 'posts_id_posts'=>$id_post)); 
		$this->post($id_post);
 	}

	/*
	 * register a new created post in a category
	 *
	 */
	public function create_post($id_category){
		$data['calendar'] = $this->calendar->generate(); 
		$post = $this->input->post('post'); 
		$title = $this->input->post('title');
                $date = new DateTime();
		$this->model_posts->add_record(array('categories_id_categories'=>$id_category, 'body'=>$post, 'title'=>$title,'users'=>$this->session->user_id, 'pub_date'=>time(), 'status'=>1)); 
		$this->category($id_category); 
	}
}
