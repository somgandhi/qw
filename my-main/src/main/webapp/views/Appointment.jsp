<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-patient.jsp"></jsp:include>

   <%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${patProf==1}">
	       <br>
		<div class="row" >
			<div class="mx-auto">			      
             				<center><h4 style="color:grey">User Profile</h4> 
             				<img src="/image/profileUnknown.png"" alt="" width="100" height="100"/></center>
					<table class="table  border-dark ">
					
						<tr>
							<th><h5>User Id:</h5></th>
							<td>
								<h6>${patient.ptId}</h6>
							</td>
						</tr>
						<tr>
							<th><h5>Name:</h5></th>
							<td>
								<h6>${patient.ptName}</h6>
							</td>
						</tr>
						<tr>
							<th>
								<h5>Age:</h5>
							</th>
							<td>
								<h6>${patient.ptAge}</h6>
							</td>
						</tr>
						<tr>
							<th>
								<h5>Email:</h5>
							</th>
							<td>
								<h6>${patient.ptGmail}</h6>
							</td>
						</tr>
						<tr>
							<th>
								<h5>Mobile:</h5>
							</th>
							<td>
								<h6>${patient.ptMobile}</h6>
							</td>
						</tr>
									
						
					</table>
			
               </div>
			</div>
</c:if>
		
	
</body>
</html>