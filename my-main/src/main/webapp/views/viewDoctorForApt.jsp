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




<div class="row">					         
						<br>
						<div class="mx-auto">
						
						<c:if test="${b==1}">
						<div class="alert alert-success mt-2">Appointment booked</div>
					</c:if>
					<c:if test="${b==0}">
						<div class="alert alert-warning mt-2">Appointment not booked. Try
							again...</div>
					</c:if>
						
					
					</div>
					</div>		

<!-- display dr list -->	
			
	   <c:if test="${DRLIST==1 }">
	   
  
    
       <div ><center><h4 style="color:grey">Doctor List</h4></div></center>
       <div class="row" >
       <div class="mx-auto">
        <table class="table table-striped border-dark table-bordered">
             <tr>
   <th>Sr.No</th>   <th>Name</th> <th>Speciality</th>  <th>Status</th> <th>Select Appointment Date</th> <th>Book Action</th>
                                 
             </tr>
           
           <c:forEach var="item" items="${drList}" begin="0" end="100" varStatus="srno">  
             <tr>
   <td>${srno.index+1 }</td>    <td>${item.drName}</td> <td> ${item.drSpec}</td> 
              <td>
                       <c:if test="${item.drStatus==true}"> Available</c:if>  
                       <c:if test="${item.drStatus==false}"> Not Available</c:if> 
               </td>
               <form action="aptBooking" method="post">
               <td>
                 <input type="date" id="loc" name="appdate" value="" min="tdate" placeholder="" tabindex="3" required="required" />
               </td>  
                                        
              <td>
                <!-- <form action="aptBooking" method="post"> -->
               <!--  <input type="date" id="loc" name="appdate" value="" placeholder="" tabindex="3" required="required" /> -->
                <input type="hidden" name="drid" value="${item.drId}" readonly />	
                <input type="hidden" name="ptid" value="${patient.ptId}" readonly />								
				<button class="btn btn-sm btn-light" type="submit">Book Here</button>							    
	            <!--  </form>     -->         
               </td>   
            </form>
             </tr>
           </c:forEach>  
             
         </table>
      </div>
        </div>
    </c:if>		
    
    
    
    
    
</body>
</html>