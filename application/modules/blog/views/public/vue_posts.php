<?php // var_dump($posts); ?>
<?php if(isset($category_name) &&  !empty($category_name) && $this->session->name){ ?>
<h3>Add a new post under the <?php echo $category_name["name"] ; ?> category</h3>
<?php echo form_open(site_url().'/index.php/blog/'.'welcome'.'/'.'create_post'.'/'.$category_name['id']); ?>
 <div class="form-group">
    <label for="title">Title:</label>
    <input name="title"  type="text" class="form-control" id="title">
 </div>
 <div class="form-group">
    <label for="post">Your Post:</label>
    <textarea name="post"  class="form-control" rows="5" id="post"></textarea>
 </div>
  <button type="submit" class="btn btn-default">Submit</button>	
<?php echo form_close(); ?>
<hr>
<?php } ?>
<br>
<?php if(!empty($posts)){ 
	foreach($posts as $post) { 
		if(!empty($post['body'])){?>

  <h2>
                    <a  href="<?php echo site_url().'index.php/blog/welcome/'.'post/'.$post['id_posts']; ?>"><?php echo $post['title']; ?></a>
		<?php if($post['first_name'] &&  $post['last_name']){ ?>
                <span class="lead lead_by" >
                    by <a href="#"><?php echo $post['first_name'].' '.$post['last_name'] ; ?></a>
                </span>
                </h2>
		<?php } ?>
                <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo date("d-m-Y H:i:s", intval($post['pub_date'])) ; ?></p>
                <hr>
                <img class="img-responsive" src="http://placehold.it/900x300" alt="">
                <hr>
                <p><?php $word = explode(' ', $post['body']); $word = array_slice($word, 0, 20);  $word = implode(' ', $word) ;  echo $word.'...' ; ?></p>
                <a class="btn btn-primary" href="<?php echo site_url().'index.php/blog/welcome/'.'post/'.$post['id_posts']; ?>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

                <hr>
<?php }}} ?>
