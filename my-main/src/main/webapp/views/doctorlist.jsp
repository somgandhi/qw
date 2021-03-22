<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body >
               <br>
				
				<div class="row">					
					<div class="mx-auto">
				   <center><h3>Doctors list</h3></center>	
				   
				  
						<table class="table table-striped border-dark table-bordered" >
						
					<tr>
					<th colspan="3">	Hospital - ${hospital.hspName} </th>
					<th colspan="3">	Address - ${hospital.hspAdd}</th>
						
					
						
					</tr>
						
							<tr>
							
								<th>Sr.No</th>
								<th>Doctor Name</th>
								<th>Doctor Speciality</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Status</th>
							</tr>

							<c:forEach var="item" items="${drList}" begin="0" end="100"
								varStatus="srno">
								<tr> 
						
						
									<td>${srno.index+1 }</td>
									<td>${item.drName}</td>
									<td>${item.drSpec}</td>
									<td>${item.drEmail}</td>
									<td>${item.drMobile}</td>

									<td><c:if test="${item.drStatus==true}"> Available</c:if>
										<c:if test="${item.drStatus==false}"> Not Available</c:if></td>
								</tr>
							</c:forEach>

						</table>

					</div>

				</div>

</body>
</html>