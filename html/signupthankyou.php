<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>TOKYO REALTIME - Audio Guided Walking Tours</title>

	<link rel="stylesheet" type="text/css" href="/css/screen.css" />
	<link rel="stylesheet" type="text/css" href="/css/shadowbox.css" />
	<link rel="stylesheet" type="text/css" href="/css/tooltips.css" />
	<!--[if lte IE 7]><style> @import "/css/ie.css"; </style><![endif]-->
	<!--[if lte IE 6]><style> @import "/css/ie6.css"; </style><![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
<?php 
	// ----------------------------------------------
	// OBFUSCATE EMAILS (seems to work, amazingly)
	// ----------------------------------------------

	function emailLink($email,$link='',$subject='') {
		while ($i<strlen($email)) {
			if (rand(0,1000)>400)
				$obfuscated.='&#'.ord($email{$i}).';';
			else
				$obfuscated.=$email{$i};
			$i++;
		}
		$return .= "<a href=\"mailto:$obfuscated";
		if ($subject) $return .= "?subject=$subject";
		$return .= '">';
		$return .= ($link) ? $link : $obfuscated;
		$return .= '</a>';
		return $return;
	}
?>
	
	<script src="js/mootools.v1.1.js" type="text/javascript"></script>	
	<script src="js/shadowbox-mootools.js" type="text/javascript"></script>	
	<script src="js/shadowbox.js" type="text/javascript"></script>	
	<script src="js/swfobject.js" type="text/javascript"></script>	
	<script src="js/audio-player.js" type="text/javascript"></script>	
	<script src="js/main.js?200800810" type="text/javascript"></script>		
	
	<style>
	.container:after {
	    clear: both;
	    content: " ";
	    display: block;
	    height: 0;
	    visibility: hidden;
	}
	.container {
	    margin: 0 auto;
	    padding: 0;
	    position: relative;
	    width: 960px;
	}
	h1.logo {
	    background: url('http://whiterabbitjapan.com/images/white-rabbit-japan-logo.png') no-repeat scroll 0 0 transparent;
	    float: left;
	    height: 51px;
	    width: 206px;
	}
	.ir {
	    background-color: transparent;
	    border: 0 none;
	    color: transparent;
	    font: 0pt/0 a;
	    text-shadow: none;
	}
	.header{
		width: 100%;
		height: 51px;
		background: url('http://whiterabbitjapan.com/images/header-bg.png') repeat-x;
	}
	.header ul{
		float: right;
		/*margin-top: 15px;*/
		margin-top: 13px; /* fix for WRE */
	}
	.header ul li {
		float: left;
		color: #fff;
		margin-left: 37px;
	}
	.header ul li a{
		font: 13px/21px "Open Sans","HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif;
		float: left;
		color: #fff;
		text-decoration: none;
		font-weight: normal;
		-webkit-transition: all 0.2s ease-in-out;
		-moz-transition: all 0.2s ease-in-out;
		-ms-transition: all 0.2s ease-in-out;
		-o-transition: all 0.2s ease-in-out;
		transition: all 0.2s ease-in-out;
	}
	.header ul li a:hover,
	.header ul li a:focus,
	.header ul li a:active{
		color: #71a9d0;
		-webkit-transition: all 0.2s ease-in-out;
		-moz-transition: all 0.2s ease-in-out;
		-ms-transition: all 0.2s ease-in-out;
		-o-transition: all 0.2s ease-in-out;
		transition: all 0.2s ease-in-out;
	}
	.header ul li.on a{
		color: #a3d4f7;
	}
	body {
		background-position: 0 51px !important;
	}
	ul.big-nav li {
		list-style:none;
	}
	</style>
</head>

<body>
<div class="header">
		<div class="container">
			<h1 class="logo ir">White Rabbit Japan</h1>
			<ul class="big-nav">
<!--				<li class="on"><a href="http://whiterabbitexpress.com">Services</a></li>-->
				<li><a href="http://whiterabbitjapan.com">Home</a></li>
				<li><a href="http://whiterabbitexpress.com">Services</a></li>
				<li><a href="http://shop.whiterabbitjapan.com">Shop</a></li>
				<!--li><a href="http://blog.whiterabbitjapan.com">Blog</a></li-->
<!--				<li><a href="#customers">Customers</a></li>-->
				<li><a href="http://community.whiterabbitjapan.com">Community Forums</a></li>
				<li><a href="http://support.whiterabbitjapan.com">Support</a></li>
<!--				<li><a href="#nav-link">Our Story</a></li>-->
			</ul> 
		</div><!-- container -->
		
	</div>
<div id="wrapper">
	<div id="header">
		<h1 id="logo">TOKYO REALTIME -- Audio Guided Walking Tours</h1>
		
		<img src="/img/white-rabbit-press.gif" alt="white rabbit press logo" id="white-rabbit-press" />

		<!--ul id="nav"><li><a title="home" id="nav-home" href="/" >home</a></li><li><a title="company news" id="nav-news" href="/news/" >company news</a></li><li class="tail"><a title="contact" id="nav-contact" href="/support" >contact</a></li></ul-->
		
		<form class="mailing-list" action="http://app.icontact.com/icp/signup.php" method="post">
		    <input type="hidden" name="listid" value="9955340" />
		    <input type="hidden" name="specialid:9955340" value="MYXX" />

		    <input type="hidden" name="clientid" value="71032" />
		    <input type="hidden" name="formid" value="3880" />
		    <input type="hidden" name="reallistid" value="1" />
		    <input type="hidden" name="doubleopt" value="0" />

			<input type="hidden" name="redirect" value="http://www.tokyorealtime.com/signupthankyou.php" />
			<input type="hidden" name="errorredirect" value="http://www.icontact.com/www/signup/error.html" />

			<input class="yremail required isEmail" type="text" value="Join our mailing list!" name="fields_email" />
			<input type="submit" class="submit" name="submit" value="Submit" />
		</form>
		<br class="spacer" />
	</div><!-- END #header -->
	

	<br/>	<br/>	<br/>	<br/>	<br/>
	<div align="center">
	  <p>You have been subscribed. Thank you.</p>
	  <p> <a href="http://www.tokyorealtime.com">Click here to return</a>  <br class="spacer" />
	    <br/>	
	    <br/>	
	    <br/>	
	    <br/>	
	    <br/>
	      </p>
	</div>
	<div id="footer">
		<p class="col1">Copyright &copy; 2012 White Rabbit Press &nbsp;|&nbsp; <a href="#" id="footer-privacy">Privacy Policy</a></p>
		<p class="col2">Tokyo Realtime on <a href="http://www.new.facebook.com/group.php?gid=27611998072">facebook</a></p>
	</div>
</div><!-- END .indent -->
</div><!-- END #wrapper -->
</body>
</html>