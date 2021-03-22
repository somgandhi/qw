<body>

	<div class="row bg-light " style="height: 70px">

		<div class=" d-flex justify-content-start align-items-center">

			<a class="navbar-band ml-5" href="/home"><img
				style="border-radius: 50%; width: 50px; height: 50px;"
				src="/image/DoctorHubLogo.png" /> </a>
				
				 <form action="showPatientProf" method="post">														
				 <input type="hidden" name="id" value="${patient.ptId}" readonly />							
				<button class="btn btn-sm btn-white ml-3 mr-3" type="submit">Profile</button>							    
	    </form>	
				
				

			<form action="update-opt" method="post">
				<div>
					<input type="hidden" name="id" value="${patient.ptId}" readonly />
					<button class="btn btn-sm btn-white  mr-3" type="submit">Update Profile</button>
				</div>
			</form>


			<form action="bookAppBtn" method="post">
				<div>
					<!--  <input type="date" id="loc" name="appdate" value="" placeholder="" tabindex="3" required="required" />  -->
					<input type="hidden" name="ptid" value="${patient.ptId}" readonly />
					<button class="btn btn-sm btn-white mr-3" type="submit">Book Appointment</button>
				</div>
			</form>

			<form action="aptinfoWindow" method="post">
				<div>
					<input type="hidden" name="ptid" value="${patient.ptId}" readonly />
					<button class="btn btn-sm btn-white mr-3" type="submit">Appointment Information</button>
				</div>
			</form>


			<a class="btn btn-sm btn-white mr-3" href="/home" role="button">
				Logout </a>
		</div>

	</div>