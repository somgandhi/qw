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
							<th>User Id:</th>
							<td>	${patient.ptId}
							</td>
						</tr>
						<tr>
							<th>Name:</th>
							<td>
								${patient.ptName}
							</td>
						</tr>
						<tr>
							<th>
								Age:
							</th>
							<td>
								${patient.ptAge}
							</td>
						</tr>
						<tr>
							<th>
								Email:
							</th>
							<td>
								${patient.ptGmail}
							</td>
						</tr>
						<tr>
							<th>
								Mobile:
							</th>
							<td>
								${patient.ptMobile}
							</td>
						</tr>
									
						
					</table>
			
               </div>
			</div>
</c:if>
		
	
</body>
</html>