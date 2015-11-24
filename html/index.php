<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>TOKYO REALTIME - Audio Guided Walking Tours</title>

	<link rel="stylesheet" type="text/css" href="css/screen.css" />
	<link rel="stylesheet" type="text/css" href="css/shadowbox.css" />
	<link rel="stylesheet" type="text/css" href="css/tooltips.css" />
	<!-- new -->
	<link rel="stylesheet" href="css/global.css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

	<!--[if lte IE 7]><style> @import "css/ie.css"; </style><![endif]-->
	<!--[if lte IE 6]><style> @import "css/ie6.css"; </style><![endif]-->
	
	
	<!--script src="js/mootools.v1.1.js" type="text/javascript"></script>	
	<script src="js/shadowbox-mootools.js" type="text/javascript"></script>	
	<script src="js/shadowbox.js" type="text/javascript"></script>	
	<script src="js/swfobject.js" type="text/javascript"></script>	
	<script src="js/audio-player.js" type="text/javascript"></script>	
	<script src="js/main.js?200800810" type="text/javascript"></script-->

	<!-- highslide -->	
	<script type="text/javascript" src="/highslide/highslide.js"></script>
	<link rel="stylesheet" type="text/css" href="/highslide/highslide.css" />
	<script type="text/javascript">
	    // override Highslide settings here
	    // instead of editing the highslide.js file
	    hs.graphicsDir = '/highslide/graphics/';
	</script>	
	

    <script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/slides.min.jquery.js"></script>
	<script>
		$(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true
			});
		});
	</script>

<!-- the sound stuff -->
<!-- inline demo CSS (combined + minified for performance; see comments for raw source URLs) -->
<link rel="stylesheet" type="text/css" href="demo/index-rollup.css"/>

<!-- the SoundManager 2 API -->
<script type="text/javascript" src="script/soundmanager2.js"></script>

<!-- 360 UI demo, canvas magic for IE -->
<!--[if lt IE 9]><script type="text/javascript" src="demo/360-player/script/excanvas.js"></script><![endif]-->

<!-- SM2 demo/homepage-specific stuff -->
<script type="text/javascript">var is_home = true;</script>

<!-- inline demo JS (combined + minified; see comments for raw source URLs) -->
<script type="text/javascript" src="demo/index-rollup.js"></script>
<!-- IE CSS font hax -->
<!--[if lte IE 8]>
<style>
 h2.special {
  /* IE 6-8 font reset, doesn't like sort-of-defined @font-family */
  font-family:"helvetica neue",helvetica,arial,verdana,tahoma,"sans serif";
 }
</style>
<![endif]-->
	<style type="text/css">
	/* "SM2 loves you" */
	#heart {
		line-height: 1em;
		padding-top: 0px;
		text-indent: 1em;
	}

	#heart-icon {
		width: auto;
		font-family: arial;
		color: red;
		font-size: 48px;
    }
	</style>

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

<!-- end -->
</head>

<body onload="MM_preloadImages('img/facebook.png', 'img/twitter.png', 'img/email.png')">
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
		<h1 id="logo">TOKYO REALTIME - Audio Guided Walking Tours</h1>
		
		<img src="img/white-rabbit-press.gif" alt="white rabbit press logo" id="white-rabbit-press" />

		<!--ul id="nav"><li><a title="home" id="nav-home" href="http://www.whiterabbitjapan.com" >home</a></li><li><a title="company news" id="nav-news" href="http://www.whiterabbitpress.com/category/news" >company news</a></li><li class="tail"><a title="contact" id="nav-contact" href="http://www.whiterabbitjapan.com/support" >contact</a></li></ul-->

		
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
	
	<div class="intro">
	    <div id="wrapper">
		<div id="example">
    			<div id="slides">
					<div class="slides_container">
						<img src="img/Nikitaichibangai.jpg" width="747" height="408">
						<img src="img/blurb_kelt.jpg" width="747" height="408">
						<img src="img/98.jpg" width="747" height="408">
						<img src="img/5.jpg" width="747" height="408">
						<img src="img/blurb_playboy.jpg" width="747" height="408">
						<img src="img/55.jpg" width="747" height="408">
						<img src="img/10.jpg" width="747" height="408">
						<img src="img/blurb_guardian.jpg" width="747" height="408">
						<img src="img/30.jpg" width="747" height="408">
						<img src="img/60.jpg" width="747" height="408">
						<img src="img/blurb_jnto.jpg" width="747" height="408">
						<img src="img/40.jpg" width="747" height="408">
						<img src="img/50.jpg" width="747" height="408">
						<img src="img/blurb_jsnow.jpg" width="747" height="408">
						<img src="img/15.jpg" width="747" height="408">
						<img src="img/blurb_kalter.jpg" width="747" height="408">
						<img src="img/20.jpg" width="747" height="408">
						<img src="img/99.jpg" width="747" height="408">
						<img src="img/akiba_black.jpg" width="747" height="408">
					</div>
					<div class="nav-container">
						<a href="#" class="prev"><img src="img/arrow-prev.png" width="30" height="30" alt="Arrow Prev"></a>
						<a href="#" class="next"><img src="img/arrow-next.png" width="30" height="30" alt="Arrow Next"></a>
					</div>
				</div>
			</div>
    	</div><!-- wrapper -->

	
	<div class="col1">
		<p>TOKYO REALTIME is a series of audio guided walking tours revealing new sides to Tokyo’s most interesting neighborhoods.</p>
		<p class="nospace">Each tour includes:</p>
			  		<ul>
				<li>a CD with mp3 audio</li>

				<li>an area map</li>
				<li>a booklet of area photography</li>
			</ul>
	  <!-- <a rel="shadowbox['samplz0']" href="img/image-01.jpg">CD</a> with <a rel="shadowbox['samplz0']" href="img/image-01.jpg">mp3</a> audio, an area <a rel="shadowbox['samplz0']" href="img/image-01.jpg">map</a>, and a <a rel="shadowbox['samplz0']" href="img/image-01.jpg">photo book</a>.</p> -->
	</div>
	<div class="col2">
		<p>TOKYO REALTIME tours interweave narration and interviews within a soundscape of location ambience. The tours deliver a seamless mix of adventure and cultural insight while navigating real-world spaces. </p><p> Simply transfer the audio program to any portable mp3 player, go to the starting point on the included map and press play.</p>

	</div>
	<br class="spacer" />
	</div><!-- END .intro -->
	
	<br class="spacer" />
	
	<div class="indent">

	<!-- ********************** start other (replace "other" with appropriate text...) *************************** -->

		<div class="audio-tour">
			<img class="thumb" src="img/guidigo.png" alt="akihabara thumbnail" />
			<div class="tour-info">

				<h2 id="akihabara">Akihabara</h2> 
<!-- 				<img src="/img/other-header.gif" alt="other" /><br /> -->
				<p class="description">Get an insider tour of Japan's pop culture mecca for anime, manga, maids and more... </p>
				<p class="description">
TOKYO'S ELECTRIC TOWN, Akihabara is Japan's subculture hotspot for anime, manga, games and figures which attracts hardcore fans - and curious visitors - from all over the world. 


 Internationally recognized experts on the area take you on an unforgettable, behind-the-scenes tour of the area. You'll visit all the must-see shops, gain historical knowledge, cultural insights and learn insider jargon like otagei, moé, itasha and more.
				<div class="col1">
					<!--h3 class="audio-preview">AUDIO PREVIEW:</h3-->
					
										
			  </div>
			  <div class="col2">
			  <div class="price1" style="margin:0px;">$20</div>	

<?php
/*if (isset($_GET['a_aid'])) {
	echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-akihabara-download.html?a_aid=', $_GET['a_aid'], '" target="_blank" class="buy-now">BUY NOW</a>';
} else if (isset($_GET['partner'])) {
echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-akihabara-download.html?a_aid=', $_GET['partner'], '" target="_blank" class="buy-now">BUY NOW</a>';
} else {
echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-akihabara-download.html" target="_blank" class="buy-now">BUY NOW</a>';
}*/
?>
<div class="guidigo_btn">
<a href="http://www.guidigo.com/Tour/Japan/Chiyoda/tokyo-realtime-akihabara/kF7cwSFtDDI#" target="_blank"><img src="img/btn_iphone.png" /></a> <a href="http://www.guidigo.com/Tour/Japan/Chiyoda/tokyo-realtime-akihabara/kF7cwSFtDDI#" target="_blank"><img src="img/btn_android.png" /></a>
</div>

	<div class="spacer">&nbsp;</div>
			  </div>

				

			


			</div><!-- END .tour-info -->
<div style="padding-top:20px;clear:both;">
<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F2655560&amp;auto_play=false&amp;show_artwork=false&amp;color=FE379C"></iframe>
</div>
			<div class="more-info" id="more-other-target">
				<div class="pad">

				<h3 class="photo-gallery">Photo Gallery <em>(Click to Enlarge)</em></h3>

				<div class="thumbs">

<a href="/images/akiba/fcover.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/frontcover_thumb.jpg" alt="" title="Front Cover :: Akihabara package front cover" /></a>
<a href="/images/akiba/map.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/map_thumb.jpg" alt="" title="Area Map :: Akihabara tour map detail" href="/images/akiba/map.jpg" /></a>
<a href="/images/akiba/photobook.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/photobook_thumb.jpg" alt="" title="Photobook :: Photobook cover" /></a>
<a href="/images/akiba/pano.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/pano_thumb.jpg" alt="" title="Location :: Akihabara pano" /></a>
<a href="/images/akiba/arisa.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/arisa_thumb.jpg" alt="" title="Experience :: Arisa of Café Mai:lish" /></a>
<a href="/images/akiba/bcover.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/bcover_thumb.jpg" alt="" title="Back Cover :: Akihabara package back cover" /></a>
<a href="/images/akiba/FPO_thumb.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/akiba/FPO_thumb.jpg" alt="" title="Video :: Coming Soon" /></a>

				</div>
				<div class="col1">
					<h3>Praise for the Tour</h3>
					<p class="description">Akihabara is one of the world's most densely intricate urban enclaves, and producer Max Hodges has assembled a crack team of uber-geeks from Japan and abroad to navigate its alleys and decode its mysteries. The audio guide is an illuminating portal into the neighborhood's colorful history and vibrant currents of contemporary pizzaz.<br />
				    - Roland Kelts, author of Japanamerica</p>
					<p class="description">Patrick W. Galbraith reveals an Akihabara that even a long-term resident like me didn't fully understand.<br />
				    -Jean Snow, Editor-in-Chief snow-mag.com </p>
					<h3>About the Narrator</h3>
					<p>Patrick W. Galbraith is the author of "The Otaku Encyclopedia" and is a Ph.D. candidate at the University of Tokyo where he researches Akihabara and Otaku culture. He is a frequent contributor to Metropolis, Otaku USA Magazine and Otaku2.com </p>
				  </div>
				<!-- END .col1 -->
				<div class="col2">
					<h3>Interviews with</h3>
				  <p>Patrick Macias<span class="interview-role">  - Author of &quot;Cruising the Anime City&quot; and editor of &quot;Otaku USA Magazine&quot;</span><br/>
				    Morikawa Kaichiro<span class="interview-role"> - Professor at Meiji University &amp; author of several books including "Learning from Akihabara"</span><br/>
				      Danny Choo<span class="interview-role"> - blogger and Tokyo Stormtrooper</span><br/>
				      Kobayashi Takaya<span class="interview-role"> - local ward councilman</span><br/>
				      Kristina Dryza<span class="interview-role"> - consumer trend researcher</span><br/ >
				      Mei-chan<span class="interview-role"> - otaku and former little sister at a sister café</span></p>
					<h3>Music by</h3>
			<p>Pa letee of @HomeCafé<span class="interview-role"> - Happy Happy Morning</span><br/>
						Cutie Pai <span class="interview-role"> - Tokyo Refrain</span><br/>
			Shane Berry<span class="interview-role"> - Canned Oden</span><br/>
			Damn Dangerous<span class="interview-role"> - Nine to Five</span><br/>
			<span class="interview-role">and others...</span><br/ >
					<!-- AddThis Button BEGIN -->
<!--
<div class="addthis_toolbox addthis_default_style">
 <a class="addthis_button_facebook"></a>
<a class="addthis_button_email"></a>
<a class="addthis_button_favorites"></a>
<a class="addthis_button_print"></a>
<span class="addthis_separator">|</span> 
</div> -->

<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=maxhodges"></script>
<script type="text/javascript">
var addthis_config = {
     ui_header_color: "#fe379c",
}
</script>
<br/>
<div class="addthis_toolbox">   
    <div class="custom_images">
            <a class="addthis_button_facebook" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('facebook','','img/facebook.png',1)"><img src="img/facebook_gray.png" alt="Send to facebook" name="facebook" width="16" height="16" border="0" id="facebook" /></a>
            <a class="addthis_button_twitter" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('twitter','','img/twitter.png',1)"><img src="img/twitter_gray.png" alt="Tweet This" name="twitter" width="16" height="16" border="0" id="twitter" /></a>
            <a class="addthis_button_email" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('email','','img/email.png',1)"><img src="img/email_gray.png" alt="Email" name="email" width="21" height="16" border="0" id="email" /></a>
			<a class="addthis_button_compact"><img src="./img/more_gray.png" width="16" height="16" alt="More" /></a>
    </div>
</div>

<!-- AddThis Button END -->

			</p>
				</div><!-- END .col2 -->

				<div class="spacer">&nbsp;</div>
				</div><!-- END .pad -->
			</div><!-- end .more-info -->

		</div><!-- END .audio-tour (other) -->
		<br class="spacer" />

	<!-- ********************** end other *************************** -->

		<!-- ********************** start kabukicho *************************** -->

	<div class="audio-tour">
		<img class="thumb" src="img/kabukicho-thumb.jpg" alt="kabukicho thumbnail" />
		<div class="tour-info">

			<h2 id="kabukicho">Kabukicho</h2>
			<p class="description">Take a stroll through Japan’s most imaginative entertainment district</p><p class="description">
JUST A FEW MINUTES FROM SHINJUKU STATION, the Kabukicho district pumps the same energy, diversity and excitement into adult entertainment as the Shinjuku area it inhabits injects into city life. You’ll dive right into the hyper-energetic mix of bright lights, boisterous crowds, less-dressed girls, loud touts and discretely guarded doors.</p>

<div class="col1">
				<!--h3 class="audio-preview">AUDIO PREVIEW:</h3>
					<div class="ui360">
										<a href="/audio/kabukicho_preview.mp3" class="norewrite exclude button-exclude inline-exclude">Kabukicho</a>
									</div-->

			</div>
		  <div class="col2">
				<div class="price">$20</div>
<?php
if (isset($_GET['a_aid'])) {
	echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-kabukicho-audio-guided-walking-tour-download.html?a_aid=', $_GET['a_aid'], '" target="_blank" class="buy-now">BUY NOW</a>';
} else if (isset($_GET['partner'])) {
echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-kabukicho-audio-guided-walking-tour-download.html?a_aid=', $_GET['partner'], '" target="_blank" class="buy-now">BUY NOW</a>';
} else {
echo '<a href="http://shop.whiterabbitjapan.com/tokyo-realtime-kabukicho-audio-guided-walking-tour-download.html" target="_blank" class="buy-now">BUY NOW</a>';
}
?>
		  </div>
			
			<div class="spacer">&nbsp;</div>

			
		</div><!-- END .tour-info -->
<div style="padding-top:20px;clear:both;"><iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F11492293&amp;auto_play=false&amp;show_artwork=false&amp;color=FE379C"></iframe>
</div>
		
		<div class="more-info" id="more-kabukicho-target">
			<div class="pad">
			  	
			<h3 class="photo-gallery">Photo Gallery <em>(Click to Enlarge)</em></h3>

			<div class="thumbs">
<a href="/images/frontcover.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/frontcover_thumb.jpg" alt="" title="Front Cover :: Kabukicho package front cover" /></a>
<a href="/images/akiba/map.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/mapdetail_thumb.jpg" alt="" title="Area Map :: Kabukicho tour map detail" href="/images/mapdetail.jpg" /></a>
<a href="/images/photobook.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/photobook_thumb.jpg" alt="" title="Photobook :: Photobook cover" /></a>
<a href="/images/location.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/location_thumb.jpg" alt="" title="Location :: Kabukicho pano" /></a>
<a href="/images/experience1.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/experience1_thumb.jpg" alt="" title="An insider look" /></a>
<a href="/images/backcover.jpg" class="highslide" onclick="return hs.expand(this)"><img src="/images/backcover_thumb.jpg" alt="" title="Back Cover :: Kabukicho package back cover" /></a>
<!--a href="video.html" class="highslide" onclick="return hs.htmlExpand(this, { objectType: 'iframe' } )"><img src="/images/video_thumb.jpg" alt="" title="Video :: Kabukicho Teaser" /></a-->
<a href="/video/kabukichoteaser.mp4"><img src="/images/video_thumb.jpg" alt="" title="Video :: Kabukicho Teaser" /></a>
			</div>

			<div class="col1">
				<h3>Praise for the Tour</h3>
				<p class="description">Max Hodges strips Kabukicho bare in this raw, honest, and captivating tour.<br />
  - Playboy.com</p>
				<p class="description">Brace yourself for an hour in Hodges' company...on a tour to the heart of Kabukicho.<br />
				  - Justin McCurry, Guardian.co.uk </p>
				<h3>About the Tour</h3>
				<p class="description">AS YOU WEAVE THROUGH the streets of countless bars, strip joints, love hotels, and eateries, you’ll learn about the area’s colorful personalities and history, and get insights into the real action behind those closed doors. You’ll also get introduced to great places for a drink, a bite to eat, and to soak in the local ambience at your leisure.</p>

				<h3>About the Narrator</h3>
				<p>Max Hodges is a Tokyo-based photographer and producer. He frequently guides visiting journalists through Kabukicho. Max operates White Rabbit Press, a Tokyo-based publisher of Japanese language and travel products. </p>
			</div><!-- END .col1 -->
			<div class="col2">
				<h3>Interviews with</h3>
				<p>Lee Xiao Mu<span class="interview-role"> - Kabukicho guide &amp; writer</span><br/>

		Hiroshi<span class="interview-role"> - Kabukicho tout</span><br/>
		Naito Chin<span class="interview-role"> - Golden Gai bar owner</span><br/>
		Jim O’Connell<span class="interview-role"> - Photographer &amp; Golden Gai regular</span><br/ >
		Osada Steve<span class="interview-role"> - Japanese rope bondage artist</span></p>

				<h3>Music by</h3>
		<p>cEvin Key<span class="interview-role"> - download</span><br/>
		Mark Spybey<span class="interview-role"> - dead voices on air</span><br/>
		Steven Schultz<span class="interview-role"> - bouninjoutai</span><br/>

		Xavier Guiter<span class="interview-role"> - Xerak</span><br/>
		<span class="interview-role">and others...</span><br/ ></p>
		<p><h3>Errata</h3>
		Click <a href="http://blog.whiterabbitjapan.com/errata-for-tokyo-realtime-kabukicho-audio-tour/" title="Errata" target="_blank">here</a> for changes on the ground which may affect this tour.
		</p><br/>
		<br/>
		<div class="addthis_toolbox">   
    <div class="custom_images">
            <a class="addthis_button_facebook" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('facebook2','','img/facebook.png',1)"><img src="img/facebook_gray.png" alt="Send to facebook" name="facebook2" width="16" height="16" border="0" id="facebook2" /></a>
            <a class="addthis_button_twitter" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('twitter2','','img/twitter.png',1)"><img src="img/twitter_gray.png" alt="Tweet This" name="twitter2" width="16" height="16" border="0" id="twitter2" /></a>
            <a class="addthis_button_email" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('email2','','img/email.png',1)"><img src="img/email_gray.png" alt="Email" name="email2" width="21" height="16" border="0" id="email2" /></a>
			<a class="addthis_button_compact"><img src="./img/more_gray.png" width="16" height="16" alt="More" /></a>
    </div>
</div>

<!-- AddThis Button END -->
			</div>
			<!-- END .col2 -->
			
			<div class="spacer">&nbsp;</div>
			</div><!-- END .pad -->
		</div><!-- end .more-info -->

	</div><!-- END .audio-tour (kabukicho) -->
	<br class="spacer" />
	
	<!-- ********************** end kabukicho *************************** -->




	

	<div id="more-block">
		<h2 class="more-lg">More...</h2>
	
		<div class="col1">
			<h3>ABOUT WHITE RABBIT PRESS</h3>

			<p>With customers in over 80 countries, Tokyo-based White Rabbit Press is widely recognized for their outstanding <em>Japanese Kanji Flashcards</em>. With the launch of the TOKYO REALTIME audio tour series, White Rabbit Press continues to receive praise for making Japanese language and culture more accessible to the world.</p>

			<div class="bottom-mailer">
				<h3>Join our Mailing List</h3>
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
				<p class="quiet">Receive infrequent Tokyo Realtime updates by email. We'll never share your email address, period.</p>

			</div>

			<!-- <h3>VIEW THE WHITE RABBIT PRESS BLOG</h3>
			<p>Check out our collection of Kanji Flash cards, electronic dictionaries, and other products!</p> -->
		</div>
	  <div class="col2">
			<h4>COMING SOON</h4>
			<!--<img src="img/coversneak1_sm.jpg" alt="harajuku" />-->
			<img src="img/spines_sm.jpg" alt="tokyo realtime series" />
	  </div>

	</div><!-- END #more-block -->
	
	<br class="spacer" />
	
	<div id="footer">
		<p class="col1">Copyright &copy; 2012 White Rabbit Press &nbsp;|&nbsp; <a href="http://www.whiterabbitpress.com/support/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=37" target="_blank" id="footer-privacy">Privacy Policy</a></p>
		<p class="col2">Tokyo Realtime on <a href="http://www.facebook.com/TokyoRealtime" target="_blank">facebook</a></p>

	</div>
</div><!-- END .indent -->
</div><!-- END #wrapper -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-126293-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>