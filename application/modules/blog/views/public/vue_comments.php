<!-- Blog Post Content Column -->
            <div class="col-lg-8">

                <!-- Blog Post -->

                <!-- Title -->
                <h3><b>Title </b>: <?php echo $post[0]['title'] ; ?></h3>

                <!-- Author -->
                <h2>
                <span class="lead lead_by">
                    by <a href="#"><?php echo $post[0] ["first_name"]." ".$post[0] ["last_name"] ; ?></a>
                </span>
				</h2>
                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo date('d-m-Y H:i:s', intval($post[0]['pub_date'])) ; ?></p>

                <hr>

                <!-- Preview Image -->
                <img class="img-responsive" src="http://placehold.it/900x300" alt="">

                <hr>

                <!-- Post Content -->
                <!-- <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p> -->
	<p><?php echo $post[0]['body'] ; ?></p>

                <hr>

                <!-- Blog Comments -->
<?php if($this->session->name){ ?>
                <!-- Comments Form -->
                <div class="well" style="width:150%;">
                    <h4>Leave a Comment:</h4>
		    <?php echo form_open(site_url().'/index.php/blog/'.'welcome'.'/'.'comment'.'/'.$post[0]['id_posts']); ?>
                        <div class="form-group">
                            <textarea name="comment"  class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                   <?php form_close(); ?> 
                </div>
<?php } ?>
                <hr>

                <!-- Posted Comments -->

                <!-- Comment -->
		<?php if(count($comments) > 0){ 
			foreach($comments as $comment){
				if(!empty($comment['comments'])){?>
	                   	
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading"><?php echo $comment['last_name'].' '.$comment['first_name'] ; ?>
                            <small><?php echo date('d-m-Y H:i:s', intval( $comment['comments_date'])); ?></small>
                        </h4>
                        <?php echo $comment['comments'] ; ?>
                    </div>
                </div>
                <?php }}} ?>
                <!-- Comment -->
	</div>
