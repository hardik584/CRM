<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>CRM System</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING:  Respond.js doesn't work if you view the page via file: // -->
    <!--[if lt IE 9]>
    <script src="https: //oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https: //oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header card-no-border" onload="getNotify('','')">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <%@ include file="header.jsp"%> 
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <%@ include file="menubar.jsp" %>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <nav class="breadcrumb">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a> 
				<a class="breadcrumb-item" href="javascript: void(0);">User</a> 
				<span class="breadcrumb-item active">User Profile</span>
			</nav><br>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
            
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="container" style="margin-top: 50px">
                <div class="row">
                    <!-- Column -->
                     <!-- <div class="col-lg-3 col-xlg-2 col-md-4"></div> -->
                      
                      <div class="col-sm-4">
                      <%-- <c:forEach items="${userProfile}" var="userProfile">
                      <div class="card"> <img class="card-img" src="../assets/images/background/socialbg.jpg" alt="Card image">
                            <div class="card-img-overlay card-inverse social-profile d-flex ">
                                <div class="align-self-center">
                                <c:set var="profileImage" value=""></c:set>
                                 <c:forEach items="${profileListDetail}" var="profileListDetail">
                                <c:set var="profileImage" value="${profileListDetail.profileImage}"></c:set>
                                </c:forEach>
                                
                                  
                                	<c:if test="${profileImage!=''}">
										<img width="150" height="150"  src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/profileImage/${profileImage}"   class="img-circle"  /> 
									</c:if>
									<c:if test="${profileImage==''}">
									 <img src="../assets/images/users/images.png" class="img-circle" width="150" />
									</c:if>
                                    <h4 class="card-title">${userProfile.userName }</h4>
                                    <h6 class="card-subtitle">${userProfile.roleId.roleName}</h6>
                                    <a  href="<%=request.getContextPath()%>/ProfileMasterController?profileId=${userProfile.userId}&flag=addProfileButton"> <button class="m-t-10 waves-effect waves-dark btn btn-info btn-md btn-rounded">Profile</button></a>
                                    <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt </p>
                                </div>
                            </div>
                        </div>
                        </c:forEach> --%>
                     <c:forEach items="${userProfile}" var="userProfile">
                    <!-- <div class="col-lg-6 col-xlg-5 col-md-7"> -->
                    
                   <%-- <center div class="col-lg-8 col-mg-8"></center> --%>
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30">
                                 <c:set var="profileImage" value=""></c:set>
                                 <c:forEach items="${profileListDetail}" var="profileListDetail">
                                <c:set var="profileImage" value="${profileListDetail.profileImage}"></c:set>
                                </c:forEach>
                                
                                  
                                	<c:if test="${profileImage!=''}">
										<img width="150" height="150"  src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/profileImage/${profileImage}"   class="img-circle"  /> 
									</c:if>
									<c:if test="${profileImage==''}">
									 <img src="../assets/images/users/images.png" class="img-circle" width="150" />
									</c:if>
		 
								 
								
                                    <h4 class="card-title m-t-10">${userProfile.userName }</h4>
                                    <c:if test='${userProfile.userName=="userId"}'>
                                    	<address style="color: rgb(255, 153, 0);">
                                    		${userProfile.userName}
                                    	</address>
                                    </c:if>
                                    
                                    <h6 class="card-subtitle">${userProfile.roleId.roleName} </h6>
                                    <a  href="<%=request.getContextPath()%>/ProfileMasterController?profileId=${userProfile.userId}&flag=addProfileButton"> <button class="m-t-10 waves-effect waves-dark btn btn-info btn-md btn-rounded">Profile</button></a>
                                </center>
                           
                            <div>
                             <hr>
                            </div>
                            <div class="card-body"> <small class="text-muted">Email address </small>
                                <h6>${userProfile.userEmail}</h6> <small class="text-muted p-t-30 db">Phone</small>
                                <h6>${userProfile.userMobile}</h6> <!-- <small class="text-muted p-t-30 db">Address</small>
                                <h6>71 Pilgrim Avenue Chevy Chase, MD 20815</h6> -->
                            </div>
                          </div>
                         </div> 
                      </c:forEach>
                </div>
             
             
           	 <div class="col-lg-8">
            		<div class="card">
                           <div class="card-body">
                            <c:forEach items="${userProfile}" var="userProfile">
                             
                             <h6 class="card-title m-t-10">Introduction </h6>
                            <hr>
							 
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>Email: </strong> ${userProfile.userEmail}
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>Mobile: </strong> ${userProfile.userMobile}
								</address>
							</div>
							  
							 </c:forEach>
                  		<c:forEach items="${profileListDetail}" var="profileListDetail">
                      	  
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>Age: </strong> ${profileListDetail.profileAge}
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>DateofBirth: </strong>${profileListDetail.profileDateOfBirth} 
								</address>
							</div>
						<c:if test="${profileListDetail.bankName!=''}">
						<h6 class="card-title m-t-10">Bank Detail</h6>
						<div>
								<hr>
							</div>	
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>BankName: </strong>${profileListDetail.bankName} 
								
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>BankAccountNo: </strong>${profileListDetail.bankAccountNo} 
								</address>
							</div>
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>IFSC code: </strong>${profileListDetail.bankIfscCode}
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>PancardNo: </strong>${profileListDetail.pancardNo} 
								</address>
							</div>
						</c:if>	
							
							<h6 class="card-title m-t-10">Address</h6>
							<div>
								<hr>
							</div>
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>Address: </strong>${profileListDetail.profileAddress}
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>State: </strong>${profileListDetail.stateId.stateName}
								</address>
							</div>
							
							<div class="col-md-6 col-sm-6">
								<address>
								<strong>City:  </strong>${profileListDetail.cityId.cityName}
								</address>
							</div>
							
							<div class="form-actions">
								<a href="<%=request.getContextPath()%>/ProfileMasterController?profileId=${profileListDetail.userId.userId}&flag=addProfileButton" ><button type="submit" class="btn btn-success">
									<i class="fa fa-pencil text-inverse m-r-10"></i> Edit
								</button></a>
								<button type="button" class="btn btn-inverse">Cancel</button>
							</div>
							 
							</c:forEach>
							
							</div>
						  </div>
                        </div>
                       
	                   </div>
                     
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                 CRM © Admin by anonymous : )
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>

    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
