<!DOCTYPE html>
<html lang="en" >

<head></head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="headercss.jsp" %>
    <%int roleId1 = Integer.parseInt(session.getAttribute("loginRoleId").toString());%>
	<c:set value="<%=roleId1%>" scope="session" var="roleId"></c:set>
	 <script type="text/javascript">
     
	function sync()
	{
		document.getElementById("sync1").innerHTML="<a class='nav-link dropdown-toggle text-muted waves-effect waves-dark' onclick='getDashboard1()' href='javascript:void(0)' ><i class='mdi mdi-sync'></i></a>"
		var xmlhttp;
		var urls ="../UserMasterController?flag=notify";
		if (window.XMLHttpRequest)
		{
			xmlhttp=new XMLHttpRequest();
		}
		else
		{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{	 
				var a=xmlhttp.responseText;
				  
				if(a == '')
				{
					 
				}
				else if(a!='')
				{
					 
					document.getElementById("notify12").innerHTML="<span class='point'></span>"
					document.getElementById("message-center").innerHTML=a;
				
				}			
			}
		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
	}
</script>
    
	<c:choose>
	<c:when test="${roleId == 2 || roleId==3}">
   
	<body class="fix-header fix-sidebar card-no-border"  onload="sync()" >
    
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
     
    <div id="main-wrapper" >
        
        <%@ include file="header.jsp" %>
        
        <%@ include file="menubar.jsp" %>
       
        <div class="page-wrapper">
            
            <nav class="breadcrumb  ">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a> 
				<span class="breadcrumb-item active">Dashboard</span>
				 
				
			</nav>
            
            <div class="container-fluid">
                
                			<div class="row m-t-40">
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-info">
                                            <div class="box bg-info text-center">
                                                <h1 class="font-light text-white" id="totalInquiry"><%=session.getAttribute("allInquiry")%> </h1>
                                                <h6 class="text-white">Total Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-success card-inverse">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalLead"><%=session.getAttribute("tLead")%></h1>
                                                <h6 class="text-white">Today's Leads</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-danger">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalCustomer"><%=session.getAttribute("allCustomer")%> </h1>
                                                <h6 class="text-white">Total Customer</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3" >
                                        <div class="card card-inverse card-dark">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalProduct"><%=session.getAttribute("allProduct")%> </h1>
                                                <h6 class="text-white">Total Product</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
                                <div class="row m-t-40">
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-info " style="color: yellow;">
                                            <div class="box bg-info text-center">
                                                <h1 class="font-light text-white" id="pendingInquiry"><%=session.getAttribute("pendingInquiry")%> </h1>
                                                <h6 class="text-white">Pending Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-success card-inverse">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="convertedInquiry"><%=session.getAttribute("convertedInquiry")%></h1>
                                                <h6 class="text-white">Converted Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-danger">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="cancelInquiry"><%=session.getAttribute("cancelInquiry")%> </h1>
                                                <h6 class="text-white"> Cancel Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3" >
                                        <div class="card card-inverse card-dark">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="targetSize"><%=session.getAttribute("targetSize") %></h1>
                                                <h6 class="text-white"><%=session.getAttribute("targetFromDate")%> Target <%=session.getAttribute("targetToDate") %> </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
       
            </div>
           
            <footer class="footer"> CRM © Admin by anonymous :) </footer>
         
        </div>
        
    </div>
    
    <%@ include file="footerjs.jsp" %>
    
</body>
</c:when>

<c:when test="${roleId == 1}">
 <body class="fix-header fix-sidebar card-no-border"  onload="sync()"  >
    
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
   
    <div id="main-wrapper">
        
        <%@ include file="header.jsp" %>
         
        <%@ include file="menubar.jsp" %>
        
        <div class="page-wrapper">
            
            <nav class="breadcrumb  ">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a> 
				<span class="breadcrumb-item active">Dashboard</span>
			</nav>
           
            <div class="container-fluid">
                 <div class="row m-t-40">
                                   <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-info">
                                            <div class="box bg-info text-center">
                                                <h1 class="font-light text-white" id="totalInquiry"><%=session.getAttribute("allInquiry")%> </h1>
                                                <h6 class="text-white">Total Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-success card-inverse">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalLead"><%=session.getAttribute("tLead")%></h1>
                                                <h6 class="text-white">Today's Leads</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-danger">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalCustomer"><%=session.getAttribute("allCustomer")%> </h1>
                                                <h6 class="text-white">Total Customer</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3" >
                                        <div class="card card-inverse card-dark">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalProduct"><%=session.getAttribute("allProduct")%> </h1>
                                                <h6 class="text-white">Total Product</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
                                <div class="row m-t-40">
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-info " style="color: yellow;">
                                            <div class="box bg-info text-center">
                                                <h1 class="font-light text-white" id="pendingInquiry"><%=session.getAttribute("pendingInquiry")%> </h1>
                                                <h6 class="text-white">Pending Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-success card-inverse">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="convertedInquiry"><%=session.getAttribute("convertedInquiry")%></h1>
                                                <h6 class="text-white">Converted Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3">
                                        <div class="card card-inverse card-danger">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="cancelInquiry"><%=session.getAttribute("cancelInquiry")%> </h1>
                                                <h6 class="text-white"> Cancel Inquiry</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-6 col-lg-3 col-xlg-3" >
                                        <div class="card card-inverse card-dark">
                                            <div class="box text-center">
                                                <h1 class="font-light text-white" id="totalTarget">0</h1>
                                                <h6 class="text-white">  Target  </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
                                   
                 
                
                 
            </div>
            
            <footer class="footer"> CRM © Admin by anonymous :) </footer>
            
        </div>
        
    </div>
    
    <%@ include file="footerjs.jsp" %>
    
    
</body>
</c:when>
</c:choose>

</html>