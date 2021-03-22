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
 <br>
        <br>
<div class="row">


 <div class="col-4"></div>
       <div  class="col-4">
      
	               <c:if test="${u==1 }">
						<div class=" alert alert-success mt-2">Profile Updated Successfully
					</c:if>

					<c:if test="${u==0 }">
						<div class="alert alert-warning">Updatation Failed</div>
					</c:if>
					
					<c:if test="${u==3 }">
						<div class="alert alert-success">unable to update</div>
					</c:if>
					
					<c:if test="${u==2 }">

						<form action="upd-patient" method="post" class=""
							style="border: 2px solid green; background-color: white; padding: 20px; border-radius: 20px">

							<div>
								<center><h6>
									Update profile
								</h6></center>
							</div>
							<div>
								<input name="id" type="hidden" value="${patient.ptId}" readonly />
							</div>
							<div>
							 <input type="hidden" name="username" value="${patient.ptUsername}" readonly />
							</div>
							<div>
							   <input type="hidden" name="password" value="${patient.ptPassword}" readonly />
							</div>
							<div class="mt-1">
								Name:<input name="ptName" class="form-control form-control-md"
									type="text" value="${patient.ptName}"  pattern="[A-Za-z\s]{1,40}" required autocomplete="off" title="only characters are allowed"/>
							</div>
							<div class="mt-1">
								Age:<input name="age" class="form-control form-control-md"
									type="text" value="${patient.ptAge}" Pattern= "[0-9]{1,2}" required autocomplete="off" title="entered age not valid"/>
							</div>
							<div class="mt-1">
								Email: <input name="ptGmail" class="form-control form-control-md"
									type="email" value="${patient.ptGmail}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{3}$" required autocomplete="off" title="enter valid email"/>
							</div>
							<div class="mt-1">
								Mobile: <input name="ptMobile"
									class="form-control form-control-md" type="text"
									value="${patient.ptMobile}" Pattern= "[789][0-9]{9}" required autocomplete="off" title="enter valid mobile no"/>
							</div>
							<div class="form-row mt-2">
								<input class="btn btn-outline-success btn-sm col-md-6" type="submit"
									value="Save" />
							
								<input class="btn btn-outline-success btn-sm col-md-6" type="reset"
									value="Cancel" />
							</div>
						</form>
						
						
					</c:if>
					</div>
					
</div>
    
    
    
</body>
</html>