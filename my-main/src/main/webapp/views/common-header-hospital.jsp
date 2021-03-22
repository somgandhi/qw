<body>

	<div class="row bg-light " style="height: 70px">
		
		<div class=" d-flex justify-content-start align-items-center">
	
					<a class="navbar-band ml-5" href="/home"><img
					style="border-radius: 50%; width: 50px; height: 50px;"
					src="/image/DoctorHubLogo.png" /> </a>
					
										
					 
					 <form action="hospProfile" method="post">														
				 <input type="hidden" name="hspId" value="${hospital.hspId}" readonly />							
				<button class="btn btn-sm btn-white ml-3 mr-3" type="submit">Profile</button>							    
	    </form>	
					 
					 
					
					<form action="drList" method="post">														
				 <input type="hidden" name="hspId" value="${hospital.hspId}" readonly />							
				<button class="btn btn-sm btn-white mr-3" type="submit">Doctors</button>							    
	    </form>	
	    
				<form action="addDrOpt" method="post">														
				 <input type="hidden" name="hspId" value="${hospital.hspId}" readonly />							
				<button class="btn btn-sm btn-white mr-3" type="submit">Add New Doctor</button>							    
	    </form>		   
		
		  
	    	<form action="editHspBedOpt" method="post">															
				 <input type="hidden" name="hspId" value="${hospital.hspId}" readonly />								
				 <button class="btn btn-sm btn-white mr-3" type="submit">Update Status</button>							
		 </form>
					    
		    <a class="btn btn-sm btn-white mr-3" href="/home" role="button"> Logout </a>
		</div>

	</div>
	
	