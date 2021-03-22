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


  <c:if test="${appointPatientlist==1 }">
       <br>
       <div class="row" >
         
           <div class=" mx-auto">
            <center><h4 style="color:grey">Appointment List</h4></center> 
         <table class="table table-striped border-dark table-bordered" >
             <tr>
    <th>Sr.No</th>  <th>Patient Name</th>    <th>Status</th> <th>Appointment Date</th>  <th>Close Action</th>  <th>Cancel Action</th>
             </tr>
           
           <c:forEach var="item" items="${Appointpatientlist}" begin="0" end="100" varStatus="srno">  
             <tr>
     <td>${srno.index+1 }</td>  
        
          <td>     
                 <c:forEach var="singlePt" items="${patientList}" >
                              <c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptName} </c:if>                           
                 </c:forEach>
         </td>  
        
         <td>${item.aptStatus}</td> 
         <td> ${item.aptDate}</td>    
                 
              	
                 <td>
                   <form action="AptCloseByDr" method="post">
                <input type="hidden" name="ptid" value="${item.ptId}" readonly />														
				<input type="hidden" name="drid" value="${doctor.drId}" readonly />												
				<button class="btn btn-sm btn-light" type="submit"><i class="fas fa-check"></i> Close</button>							    
	             </form>                           
                 </td> 
                 	
               <td>
               <form action="AptCancelByDr" method="post">
                 <input type="hidden" name="ptid" value="${item.ptId}" readonly />														
				<input type="hidden" name="drid" value="${doctor.drId}" readonly />								
				<button class="btn btn-sm btn-light" type="submit"><i class="fas fa-times"></i> Cancel</button>							    
	             </form>              
               </td> 
                                 
             </tr>
             
           </c:forEach>  
                   
         </table>
         
        </div>
     </div> 
  </c:if>
  
  
  <c:if test="${allPatAptlist==1 }">
    <br>
      <div class="row" >
         
           <div class=" mx-auto">
             <center><h4 style="color:grey">All Patient List</h4></center> 
         <table class="table table-striped border-dark table-bordered" >
             <tr>
   <th>Sr.No</th>  <th>Patient Name</th>  <th>Age</th> <th>Mobile</th> <th>Status</th> <th>Appointment Date</th> 
             </tr>
           
           <c:forEach var="item" items="${AllpatAptlist}" begin="0" end="10" varStatus="srno">  
             <tr>
   <td>${srno.index+1 }</td>  
   
   <td><c:forEach var="singlePt" items="${patientList}" >
                              <c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptName} </c:if>                           
                            </c:forEach></td> 
                            
                     <td><c:forEach var="singlePt" items="${patientList}" >
                              <c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptAge} </c:if>                           
                            </c:forEach></td> 
                            
                            <td><c:forEach var="singlePt" items="${patientList}" >
                              <c:if test="${singlePt.ptId==item.ptId}"> ${singlePt.ptMobile} </c:if>                           
                            </c:forEach></td>        
                            
   
     <td>${item.aptStatus}</td> <td> ${item.aptDate}</td>    
            
             </tr>
           </c:forEach>                  
         </table>        
        </div>
      </div>
  </c:if>	

</body>
</html>