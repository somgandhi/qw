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
						
						
						<c:if test="${c==1}">
						<div class="alert alert-warning mt-2">Appointment cancelled</div>
					</c:if>
					<c:if test="${c==0}">
						<div class="alert alert-warning mt-2">Appointment not cancelled.
							Try again...</div>
					</c:if>
					
					</div>
					</div>	



<!-- display appointment list for cancel appointment-->
    
        <c:if test="${APTLIST==1 }">
	   
   
      <div ><center><h4 style="color:grey">Appointment Info</h4></div></center>
       <div class="row" >
       <div class="mx-auto">
        <table class="table table-striped border-dark table-bordered">
             <tr>
   <th>Sr.No</th> <th>Doctor Name</th>  <!--  <th>Apt Id</th> --> <th>Appointment Status </th>  <th>Appointment Date</th>  
               <!--  <th>pat Id</th> -->    <th>Cancel Action</th>
                                 
             </tr>
           
           <c:forEach var="item" items="${aptList}" begin="0" end="100" varStatus="srno">  
             <tr>
                     <td>${srno.index+1 }</td> 
                      <td>           
                       <c:forEach var="singledr" items="${drList}" >
                              <c:if test="${singledr.drId==item.drId}"> ${singledr.drName} </c:if>                           
                            </c:forEach>
                              </td> 
   
     <%--  <td>${item.aptId}</td>  --%> <td> ${item.aptStatus}</td> <td> ${item.aptDate}</td> 
                             
                              
                        <%--   <td>    
                            <c:forEach var="singlePt" items="${patientList}" >
                              <c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptName} </c:if>                           
                            </c:forEach>
                            </td>  --%>                                                         
                                              
              <td>
                <form action="aptCancel" method="post">
                <input type="hidden" name="drid" value="${item.drId}" readonly />	
                <input type="hidden" name="ptid" value="${patient.ptId}" readonly />
                <c:if test="${item.aptStatus=='BOOKED'}">
                <button class="btn btn-sm btn-light" type="submit">Cancel Appointment</button>	
                </c:if>								
										    
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