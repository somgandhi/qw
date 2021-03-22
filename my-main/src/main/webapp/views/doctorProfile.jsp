<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-doctor.jsp"></jsp:include>

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
				<h3 style="color:grey">Doctor Profile</h3>
			<img src="/image/doctorLogo.png"" alt="" width="100" height="100"/></center>
			</center>


			<table class="table  border-dark ">



				<tr>
					<th>Registration Id</th>

					<td>${doctor.drId}</td>
				</tr>

				<tr>
					<th>Name</th>

					<td>${doctor.drName}</td>
				</tr>

				<tr>
					<th>Speciality</th>

					<td>${doctor.drSpec}</td>
				</tr>



<tr>
					<th>Email</th>

					<td>${doctor.drEmail}</td>
				</tr>

<tr>
					<th>Mobile</th>

					<td>${doctor.drMobile}</td>
				</tr>

			</table>

		</div>

	</div>




</body>
</html>