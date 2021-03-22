<%@ include file="common-css-js.jsp" %>
<%@ include file="common-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
 
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  Fontawsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
	integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
	crossorigin="anonymous" />
	
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<style>
.about-section {
	padding: 50px;
	text-align: center;
	background-color: grey;
	color: white;
}

.about-section1 {
	padding: 20px;
	text-align: center;
	background-color: yellowgreen;
	color: white;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 400px;
	margin: auto;
	text-align: center;
	font-family: arial;
	
}

.title {
	color: grey;
	font-size: 18px;
	font-family: arial;
}




body, html {
  height: 100%;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbyK8eOulaU4eySe5IzIhKbFKtsGLD8SqIzA&usqp=CAU");

  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);

  /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  text-align: center;
}


</style>
</head>
<body>

<div class="bg-image"></div>

<div class="bg-text">
  <h1>I am John Doe</h1>
  <p>And I'm a Photographer</p>
</div>

	<div class="about-section">

		<h2>Who we are</h2>
		<h2>
			<p>At your side, every step of the way.</p>
		</h2>


		<p>
			DoctorHub is committed to being a leading provider of health care services <br>
			by delivering high quality outcomes for patients and ensuring long term profitability.
		</p>
		<a href="home"><i class="fas fa-hand-point-left"></i></a>
	</div>


	

				<div>
		

		<div id="carouselExampleCaptions" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleCaptions" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>

			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="image/groupdoctor.jpg" height="600" width="1400"
						 alt="...">
					<div class="carousel-caption d-none d-md-block" >
						<h5>Living Healthier Together</h5>
						<p>Together, we are working toward a healthier community</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="image/clinic.jpg" height="600" width="1400"
						 alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Something to feel good about.</h5>
						<p>Not just better healthcare, but a better healthcare experience.</p>
					</div>
				</div>			

	</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	
  <br>
	<h2 style="text-align: center">Contact Us</h2>

	<div class="card">
		<img src="image/DoctorHubLogo.png" alt="logo" height="330px" style="width: 100% ">
		<h1>Team25</h1>
		<p class="title">CEO & Founder, Example</p>
		<p>CDAC,Mumbai</p>
		<div >
			<a href="#"><i class="fab fa-facebook fa-3x"></i></a> 
			<a href="#"><i class="fab fa-twitter-square fa-3x ml-4"></i></a> 
			<a href="https://www.linkedin.com/in/c-dac-mumbai-4b26111ba"><i class="fab fa-linkedin fa-3x ml-4"></i></a> 
		</div>
		<p>
			<a button href="/contactus">Contact Us </a>
		</p>
	</div>

	<footer class="about-section1">
		<div class="container">
			<div>
				Copyright © 2021 CDAC,Mumbai. All rights reserved | Designed by	Team25. 
				<a href="#" style="color: #FFFFFF;" target="_blank"><u>Design For U</u></a>
			</div>
	         </div>
	</footer>

</body>
</html>
