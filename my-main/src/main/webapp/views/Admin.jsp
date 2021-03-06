<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="common-css-js.jsp"%>
<jsp:include page="common-header-admin.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
</style>

</head>
<body>

	<!--  hospital -->
	<c:if test="${HSPLIST==1 }">
		<div class="row">

			<div class="mx-auto">
			<br>
				<center><h4 style="color:grey" >Hospital Details</h4></center>
				<table class="table table-striped border-dark table-bordered">
					<tr>
						<th>Sr.No</th>
						<!-- <th>Hospital Id</th> -->						
						<th>Hospital Name</th>
						<th>Hospital Address</th>
						<th>Edit Action</th>
						<th>Delete Action</th>
					</tr>

					<c:forEach var="item" items="${hspList}" begin="0" end="100"
						varStatus="srno">
						<tr>
							<td>${srno.index+1 }</td>
							<%-- <th>${item.hspId}</th> --%>
							<td>${item.hspName}</td>
							<td>${item.hspAdd}</td>

							<td>
								<form action="editHspOpt" method="post">
									<input type="hidden" name="id" value="${item.hspId}" readonly />
									<button class="btn btn-sm btn-light" type="submit">Edit</button>
								</form>
							</td>

							<td>
								<form action="deleteHsp" method="post">
									<input type="hidden" name="id" value="${item.hspId}" readonly />
									<button class="btn btn-sm btn-light" type="submit">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</c:if>


	<c:if test="${addHspWindow==1 }">
		<br>
		<br>
		<div class="row" style="height:">

             <div class="col-4"></div>
			<div class="col-4">
				<c:if test="${hspReg==1 }">
					<div class="alert alert-success">Registration Successful</div>
				</c:if>
				<c:if test="${hspReg==0 }">
					<div class="alert alert-warning">Registration Failed</div>
				</c:if>
				<c:if test="${hspReg==2 }">
					
						<form action="addHsp" method="post" class=""
							style="border: 2px solid green; background-color: white; padding: 20px; border-radius: 20px">
							<c:if test="${hspReg==1 }">
								<div class="alert alert-success">hospital Registration
									Success</div>
							</c:if>
							<c:if test="${hspReg==0 }">
								<div class="alert alert-warning">hospital Registration
									Failed</div>
							</c:if>
                  <center>
                        <h6>Registration Form</h6></center>
                        <br>
                        
							<div class="form-group ">
								Hospital Name<input name="hspName"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Name Here..." pattern="[A-Za-z\s]{1,40}"
									required autocomplete="off" title="only characters are allowed" />
							</div>

							<div class="form-group">
								Hospital Address<input name="hspAdd"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Address Here..." pattern="[A-Za-z\s]{1,40}"
									required autocomplete="off" title="only characters are allowed" />
							</div>
							<div class="from-group ">
								<input name="hspBNo" class="form-control form-control-sm"
									type="hidden" placeholder="No of beds available"
									Pattern="[0-9]{1,4}" required autocomplete="off"
									title="enter valid mobile no" />
							</div>
							<div class="form-group ">
								Username<input name="hspUsername"
									class="form-control form-control-sm" type="text"
									placeholder="Enter Username Here..."
									pattern="[A-Za-z0-9]{1,15}" required autocomplete="off"
									title="only 15 characters & numbers allowed" />
							</div>
							<div class="form-group ">
								Password<input name="hspPassword"
									class="form-control form-control-sm" type="password"
									placeholder="Enter Password Here..."
									pattern="[A-Za-z0-9]{1,10}" required autocomplete="off"
									title="only 10 characters & numbers allowed" />
							</div>
							
							  <div class="form-row mt-3">
							  <input class="btn btn-outline-success btn-sm col-md-6" type="submit"
									value="Register" />
							 
								 <input class="btn btn-outline-success btn-sm col-md-6"
									type="reset" value="Cancel" />
                                </div>

							

						</form>
					
				</c:if>
			</div>
		</div>

	</c:if>





	<c:if test="${editHspProf==1 }">
		<br>
		<br>
		<div class="row" style="height:">

             <div class="col-4"></div>
			<div class="col-4">


				<c:if test="${hspprofile==1 }">
					<div class="alert alert-success">Hospital Profile Updated
						Successfully</div>
				</c:if>

				<c:if test="${hspprofile==0 }">
					<div class="alert alert-warning">Hospital Profile Updatation
						Failed</div>
				</c:if>


				<c:if test="${hspprofile==2 }">

					<form action="updateHsp" method="post" class="mx-auto " 
					style="border: 2px solid green; background-color: white; padding: 20px; border-radius: 20px">

						 <center>
                        <h6>Update Details Here</h6></center>
                        <br>
						<div>
							<input name="id" type="hidden" value="${hspOldInfo.hspId}"
								readonly />
						</div>
						<div class="form-group">
							Hospital Name<input name="hspName"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspName }" pattern="[A-Za-z\s]{1,40}"
								required autocomplete="off" title="only characters are allowed" />
						</div>
						<div class="form-group">
							Hospital Address<input name="hspAdd"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspAdd }" pattern="[A-Za-z\s]{1,40}"
								required autocomplete="off" title="only characters are allowed" />
						</div>
						<div class="form-group">
							<input name="hspBNo" class="form-control form-control-sm"
								type="hidden" value="${hspOldInfo.hspBNo }" Pattern="[0-9]{1,4}"
								required autocomplete="off" title="enter valid mobile no" />
						</div>
						<div class="form-group">
							Username<input name="hspUsername"
								class="form-control form-control-sm" type="text"
								value="${hspOldInfo.hspUsername }" pattern="[A-Za-z0-9]{1,15}"
								required autocomplete="off"
								title="only 15 characters & numbers allowed" />
						</div>
						<div class="form-group">
							Password<input name="hspPassword"
								class="form-control form-control-sm" type="password"
								value="${hspOldInfo.hspPassword }" pattern="[A-Za-z0-9]{1,10}"
								required autocomplete="off"
								title="only 10 characters & numbers allowed" />
						</div>
						<div class="form-row mt-2 ">
							<input class="btn btn-outline-success btn-sm col-md-6" type="submit"
								value="Save" />
						
							<input class="btn btn-outline-success btn-sm col-md-6" type="reset"
								value="Cancel" />
						</div>

					</form>
				</c:if>
			</div>
		</div>
	</c:if>


</body>
</html>