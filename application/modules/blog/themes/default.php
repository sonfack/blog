<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <?php foreach($css as $file){ ?>
	<link type="text/css" href="<?php echo $file ; ?>" rel="stylesheet" />
    <?php } ?>

    <title>Blog</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
	 .btn-primary{
		background-color:#24AE00;
	 }
	 .btn-primary:hover{
		background-color:#FF1717;
	  }
	 .lead>a{
		text-transform: capitalize;
		color:#24AE00;
	}
	 h2>a{
			color:#313131;
	}
	h2:first-letter{
	text-transform: uppercase;
	}

	.lead_by{
		font-size:40%;
		font-style:italic;
		color:#A7A7A7;
	}

	.head_cat{
		margin-bottom:-30px;
	}

	</style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color:white;"> 
        <div class="container" style="height:150px; background-color:white; background-image:url(/blogfinal/assets/img/banner_blog.jpg); background-repeat: no-repeat;background-position:center;" />
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo site_url().'/index.php/blog/'.'welcome' ; ?>"><?php //  echo $site_name ; ?></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<?php if($this->session->user_id){ ?>
				<ul class="nav navbar-nav navbar-right">
                	<li>
						<a href="#"><span class="glyphicon glyphicon-user"></span>Profile</a>
					</li>
                    <li><a href="<?php echo base_url().'index.php/users/auth/logout' ; ?>">
						<span class="glyphicon glyphicon-log-out"></span> Logout</a>
					</li>
				</ul>
				<?php }else{ ?>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<?php echo base_url().'index.php/users/auth/login' ; ?>">
						<span class="glyphicon glyphicon-log-in"></span> Login </a></li>
				</ul>
				<?php } ?>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                
                <?php 
			if(!isset($category_name ) || empty($category_name) ) { ?>
			<h1 class="page-header head_cat" >
                   		<?php echo " Toutes les cat&eacute;gories"; ?> 
			<?php }else{ ?>
			<h1 class="page-header head_cat" >
				
			<?php	echo " Cat&eacute;gorie"." ".$category_name["name"] ; ?>
		<?php } ?>
                </h1>
		<br>

                <!--  Post -->
                 <?php echo $output ; ?>
                <!--  Post -->
            </div>
            <br>
            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">
                <br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Blog Search</h4>
                    <div class="input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                               <?php  if(count($categories) <= 3) {
                                           foreach($categories as $category){ ?>
                                <li><a href="<?php echo site_url().'/index.php/blog/welcome/category/'.$category['id_categories'] ; ?>"><?php echo $category['name'] ; ?></a></li>
                     <?php } } ?>
                            </ul>
                        </div>
                        <!-- /.col-lg-6 -->
                        <?php if(count($categories) > 3){  ?>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <?php
                                      $i = 4 ; 
				      $n = count($categories); 
				      while($i <= $n){ ?>
                                <li><a href="#"><?php  echo $categories[i]['name'] ; ?></a> </li>
                               <?php $i = $i+1;  } ?>
                            </ul>
                        </div>
                       <?php } ?>
                        <!-- /.col-lg-6 -->
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Calendar</h4>
                    <p><?php echo $calendar ; ?></p>
                </div>

            </div>

        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12" style="text-align:center;">
                    <p>Copyright &copy; MINJEC 2017</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <?php foreach($js as $file){ ?>
    <script src="js/bootstrap.min.js"></script>
    <?php } ?>
</body>
</html>
