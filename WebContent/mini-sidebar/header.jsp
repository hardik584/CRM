<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
  <script type="text/javascript">
  function Validate() {
      var password = document.getElementById("txtPassword").value;
      var confirmPassword = document.getElementById("txtConfirmPassword").value;
      if (password != confirmPassword) {
      	document.getElementById("errorPassword").innerHTML="Both Passwords must be same!";
      	var btn = document.getElementById("btn");
        btn.disabled = true;	
          return false;
      }
      else
     {
     var btn = document.getElementById("btn");
      btn.disabled = false;	
      document.getElementById("errorPassword").innerHTML="";
      return true;
     }
  }
  function getDashboard1()
	{
		var xmlhttp;
		 
		var urls="../UserMasterController?flag=listDashboard";
		
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
				var dashboard=xmlhttp.responseXML.documentElement;
				var targetFromToDate=dashboard.getElementsByTagName("targetFromDate")[0].childNodes[0].nodeValue;
				targetFromToDate+=" To ";
				targetFromToDate+=dashboard.getElementsByTagName("targetToDate")[0].childNodes[0].nodeValue;
				document.getElementById("totalInquiry").innerHTML=dashboard.getElementsByTagName("inquiry")[0].childNodes[0].nodeValue;
				document.getElementById("totalProduct").innerHTML=dashboard.getElementsByTagName("product")[0].childNodes[0].nodeValue;
				document.getElementById("totalCustomer").innerHTML=dashboard.getElementsByTagName("customer")[0].childNodes[0].nodeValue;
			 
				document.getElementById("totalLead").innerHTML=dashboard.getElementsByTagName("lead")[0].childNodes[0].nodeValue;
				document.getElementById("targetSize").innerHTML=dashboard.getElementsByTagName("targetSize")[0].childNodes[0].nodeValue;
				document.getElementById("cancelInquiry").innerHTML=dashboard.getElementsByTagName("cancelInquiry")[0].childNodes[0].nodeValue;
				document.getElementById("convertedInquiry").innerHTML=dashboard.getElementsByTagName("convertedInquiry")[0].childNodes[0].nodeValue;
				document.getElementById("pendingInquiry").innerHTML=dashboard.getElementsByTagName("pendingInquiry")[0].childNodes[0].nodeValue;
				
				

				//document.getElementById("notifyRemainder").innerHTML = title;//dashboard.getElementsByTagName("notify")[0].childNodes[0].nodeValue;

				if(targetSize!="0")
				{
				
				document.getElementById("targetFromToDate").innerHTML=targetFromToDate;
				}
				//document.getElementById("tblproduct").innerHTML=xmlhttp.responseText;
				/* var some=xmlhttp.responseXML.documentElement;
				document.getElementById("fun").append(some.getElementsByTagName("product")[0].childNodes[0].nodeValue);
				alert("Product.."+some.getElementsByTagName("product")[0].childNodes[0].nodeValue);
				alert("Customer.."+some.getElementsByTagName("customer")[0].childNodes[0].nodeValue);
				alert("inv.."+some.getElementsByTagName("inquiry")[0].childNodes[0].nodeValue); */
				 
			}
		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
	} 
    function getNotify(id1,id2)
    {
    	if(id1!='')
       {
    	var element = document.getElementById(id1);
    	element.classList.add("active");
       }
    	if(id2!='')
       {
    	var element1 = document.getElementById(id2);
    	element1.classList.add("active");
       }
    	 
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
    function changePassword()
    {
    	document.getElementById("btn").innerHTML="Please Wait.."
    	var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        var currentPassword= document.getElementById("currentPasssword").value;
    	var xmlhttp;
		 
		var urls="../UserMasterController?flag=changePassword&currentPassword="+currentPassword+"&newPassword="+password+"";
		
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
				var msg=xmlhttp.responseText;
				if(msg == 'Please enter correct password')
				{
					document.getElementById("btn").innerHTML="Save"
					document.getElementById("updateStatusPos").innerHTML="";
					document.getElementById("updateStatusNeg").innerHTML=msg;
				}
				else
				{
					document.getElementById("btn").innerHTML="Save"
					document.getElementById("updateStatusNeg").innerHTML="";
					document.getElementById("updateStatusPos").innerHTML=msg;
				}
			 
			}
		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
     }
    </script>
	<body>
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="../assets/images/crm.png" alt="homepage" class="dark-logo" height="40" />
                            <!-- Light Logo icon -->
                            <img src="../assets/images/crm.png" alt="homepage" class="light-logo" height="40" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="../assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->    
                         <img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <li class="nav-item m-l-10"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-message"></i>
                               <div id="notify12" class="notify">    </div> 
                            </a>
                            <div class="dropdown-menu mailbox animated slideInUp">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notifications</div>
                                    </li>
                                    <li id="notifyRemainder">
                                       <div id="message-center" class='message-center'>
                                       </div> 
                                    </li>
                                    <li>
                                        <a class="nav-link text-center" href="javascript:void(0);"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        
                         
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <!-- <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li> -->
                        <!-- ============================================================== -->
                        
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item " id="sync1"></li>
                        <li class="nav-item "> <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark"   href="<%=request.getContextPath()%>/UserMasterController?flag=logoutUser"><i class="fa fa-power-off"></i></a> </li>
                        <li class="nav-item dropdown">
                        	 <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        	 
                        	 <c:set var="profileImage" value="${profileImage}"></c:set>
                        	 <c:if test="${profileImage!=''}">
                        	 <img src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/profileImage/${profileImage}" alt="user" class="profile-pic" height="30"/>
                        	 </c:if>
                        	 <c:if test="${profileImage==''}">
                        	 <img src="../assets/images/users/images.png" alt="user" class="profile-pic" />
                        	 </c:if>
                        	 </a>
                           
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                                <ul class="dropdown-user">
                                    <li>
                                        <div class="dw-user-box">
                                            <div class="u-img">
                                            <c:set var="profileImage" value="${profileImage}"></c:set>
                        	 				<c:if test="${profileImage!=''}"><img src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/profileImage/${profileImage}" alt="user" height="60"></c:if>
                        	 				<c:if test="${profileImage==''}"><img src="../assets/images/users/images.png" alt="user"></c:if>
                                            
                                            </div>
                                           
                                            
                                            <div class="u-text">
                                            	 
                                                <h4><%=session.getAttribute("loginName") %></h4>
                                                <p class="text-muted">(<%=session.getAttribute("loginRole") %>)</p>
                                                
                                                <p class="text-muted"><%=session.getAttribute("loginEmail") %></p></div>
                                        </div>
                                    </li>
                                       <li role="separator" class="divider"></li>
                                    <li><a href="<%=request.getContextPath() %>/UserMasterController?flag=userProfile"><i class="ti-user"></i> My Profile</a></li>
                                     <li role="separator" class="divider"></li>
                                    <li><a href="javascript:void(0)" data-toggle="modal" data-target="#change-password"><i class="mdi mdi-key-change"></i>Change Password</a></li>
                                    
                                    <li role="separator" class="divider"></li>
                                    <li><a href="<%=request.getContextPath()%>/UserMasterController?flag=logoutUser"><i class="fa fa-power-off"></i> Logout</a></li>
                                </ul>
                            </div>
                        </li>
                         
                    </ul>
                </div>
            </nav>
        </header>
        
</body>
	<div id="change-password" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Change Password</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <form name="UserMasterVo" action="<%=request.getContextPath()%>/UserMasterController?flag=changePassword" method="post"  >
                                            <div class="modal-body">
                                               
                                                    <div class="form-group">
                                                        <label for="currentPassword" class="control-label">Current Password<span style="color: red;">*</span></label>
                                                        <input name="currentPassword" required="required" type="password" class="form-control" id="currentPasssword" placeholder="Enter Current Password">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userPassword" class="control-label">New Password<span style="color: red;">*</span></label>
                                                        <input name="userPassword" required="required" type="password" class="form-control" id="txtPassword" placeholder="Enter New Password">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="userConfirmPassword" class="control-label">Confirm Password<span style="color: red;">*</span></label>
                                                        <input name="userConfirmPassword" required="required" type="password" class="form-control" onchange="return  Validate()" id="txtConfirmPassword" placeholder="Enter Confirm Password">
                                                        <span id="errorPassword" style="color: red;"></span>
                                                    </div>
                                                     
                                                	<span id="updateStatusNeg" style="color: red;"></span>
                                                	<span id="updateStatusPos" style="color: green;"></span>
                                            </div>
                                            <div class="modal-footer">
                                                <button   type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
                                                <button  onclick="changePassword()" id="btn" type="button" disabled="disabled" class="btn btn-success waves-effect waves-light">Save</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
</html>