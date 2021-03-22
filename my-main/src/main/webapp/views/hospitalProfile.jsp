<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-hospital.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div class="mx-auto">
			<center>
				<h3 style="color:grey">Hospital Profile</h3>
				<img src="/image/hospitalLogo.jpg"" alt="" width="100" height="100"/></center>
			</center>


			<table class="table  border-dark ">



				<tr>

					<th>Hospital Reg. No</th>

					<td>${hospital.hspId}</td>
				</tr>





				<tr>


					<th>Hospital Name</th>

					<td>${hospital.hspName}</td>
				</tr>



				<tr>


					<th>Hospital Address</th>

					<td>${hospital.hspAdd}</td>
				</tr>




			</table>

		</div>

	</div>




</body>
</html>