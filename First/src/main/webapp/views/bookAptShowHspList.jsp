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

<!-- display hospital list -->
					
		<c:if test="${HSPLIST==1 }">
		<br>			    					   
      
       <div ><center><h4 style="color:grey">Hospital List</h4></div></center>
       <div class="row" >
       <div class="mx-auto">
        <table class="table table-striped border-dark table-bordered">
             <tr>
   <th>Sr.No</th>    <th>Hospital Name</th> <th>Address</th>  <th> Bed Available</th>  <th> Action</th> 
             </tr>
           
           <c:forEach var="item" items="${hspList}" begin="0" end="100" varStatus="srno">  
             <tr>
   <td>${srno.index+1 }</td>    <td>${item.hspName}</td> <td> ${item.hspAdd}</td>  <td><center>${item.hspBNo}</center></td> 
   
              <td>
                <form action="drList" method="post">
                <input type="hidden" name="hspid" value="${item.hspId}" readonly />     
                  <input type="hidden" name="ptid" value="${patient.ptId}" readonly />																				
				<button class="btn btn-sm  btn-light" type="submit"><i class="far fa-eye"></i> View doctors</button>							    
	             </form>              
               </td> 
   
             </tr>
           </c:forEach>  
             
         </table>
      </div>
  </div>
    </c:if>
    
    
    
    
</body>
</html>