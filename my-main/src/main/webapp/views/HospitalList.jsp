<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="common-css-js.jsp" %>
 <jsp:include page="common-header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link href="css/HospitalList.css" rel="stylesheet" type="text/css">

</head>
<body style="background-color: white" >
<br>
<center>
<form th:action="@{/}">
    Filter: <input type="text" name="keyword" id="keyword" size="50" th:value="${keyword}" required />
    &nbsp;
    <input type="submit" value="Search" />
    
</form>
 </center>
 
     <div class="container mt-3">
   <c:forEach var="hospital" items="${hospitallist}">
	
	  <div class="container-fluid">
		<div class="">
			<div class="row border shadow-lg p-3  bg-white rounded"
				style="height: 165px">
				<div class="col-md-4 col-2 ">
					<img style="height: 120px; width: 200px"
						src="https://cdn.pixabay.com/photo/2016/04/19/13/22/hospital-1338585_960_720.jpg"
						class="img-fluid" alt="...">
				</div>
				
				<div class="col-8 col-md-6 ">
					<h5>${hospital.hspName}</h5>
					<p class="m-0">
						<span class="border bg-success text-light d-inline-block">4.2</span> <span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					</p>
					
					<div class="m-0">

						<p class="m-0 " style="top: 0;left: 0;">Hospital:${hospital.hspName}</p>
						<p class="m-0">Address:${hospital.hspAdd}</p>
						<p class="m-0">Beds available:${hospital.hspBNo}</p>
						<p class="m-0"></p>


					</div>
				</div>
				<div class="col-2 col-md-2 ">
					<div class="d-flex mt-4 justify-content-center ">
						<div class="btn-group   " role="group"
							aria-label="Basic radio toggle button group">
							<form action="doctorlist" method="get">	
							   <input type="hidden" name="hspid" value="${hospital.hspId}"/>	
								<button type="submit" class="btn btn-sm btn-outline-primary">View doctors</button>
								</form>	
						</div>
					</div>

				</div>

			</div>
		  	<div class="row border shadow-lg p-3 mb-2 bg-white rounded"
				style="height: 40px"></div></div>  		
	        </div>
	
	</c:forEach>
	</div>
 	
	
	
</body>
</html>