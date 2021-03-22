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
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}





</style>
</head>
<body>



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
					<div class="carousel-caption d-none d-md-block">
						<h5>First slide label</h5>
						<p>Fastest growing Liver Transplant Centre in Western India .</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="image/clinic.jpg" height="600" width="1400"
						 alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Second slide label</h5>
						<p>Performing highest number of CT Angiographies in Asia.</p>
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
		<img src="image/DoctorHubLogo.png" alt="logo" style="width: 100%">
		<h1>Team25</h1>
		<p class="title">CEO & Founder, Example</p>
		<p>CDAC,Mumbai</p>
		<div style="margin: 24px 0;">
			<a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a
				href="https://www.linkedin.com/in/c-dac-mumbai-4b26111ba"><i
				class="fa fa-linkedin"></i></a> <a href="#"><i
				class="fa fa-facebook"></i></a>
		</div>
		<p>
			<a button href="addinquiry">Contact
				</button>
			</a>
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
