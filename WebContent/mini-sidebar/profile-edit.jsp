<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>CRM System</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="../assets/plugins/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="fix-header card-no-border mini-sidebar" onload="getNotify('','')">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader" style="display: none;">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <%@ include file="header.jsp" %>
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
        <div class="page-wrapper" style="min-height: 533px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
			<nav class="breadcrumb">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a> 
				<a class="breadcrumb-item" href="javascript:void(0);">Profile</a> 
				<span class="breadcrumb-item active">New Profile</span>
			</nav><br>
			<!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->

				<!-- ============================================================== -->
				<!-- End Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- Row -->
					<div class="row">
					 <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Profile</h4>
                            </div>
                            <div class="card-body">
                                <form name="ProfileMasterVo" action="<%=request.getContextPath()%>/ProfileMasterController" method="post">
                                 	<c:forEach items="${userProfile}" var="userProfile" >
                                 	
                                	<div class="form-body">
                                	<input type="hidden" name="flag" value="updateProfile">
                                	<input type="hidden" name="userPassword" value="${userProfile.userPassword}">
                                	<input type="hidden" name="userId" value="${userProfile.userId}">
                                    
                                    
                                    <h3 class="card-title">Introduction</h3>
                                    </c:forEach>
                                        <hr>
                                        <c:forEach items="${userProfile}" var="userProfile">
                                       
                                            <!--/span-->
                                            <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">User Name</label>
                                                    <input type="text" value="${userProfile.userName}" name="userName" id="userName" class="form-control" >
                                           	   </div>
                                           	 </div> 
                                             <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Email</label>
                                                    <input type="text" value="${userProfile.userEmail}" name="userEmail" id="userEmail" class="form-control">
                                                </div>
                                            </div>
                                           </div>
                                           
                                           <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Role Name</label>
                                                    <select name="roleId"  class="form-control custom-select"
														data-placeholder="Choose a role" tabindex="1">
														<c:if test="${userProfile.roleId.roleName=='Sales Executive'}">
															<option selected="selected" value="2">Sales Executive </option>
															<option value="3">BDA</option>
														</c:if>
														<c:if test="${userProfile.roleId.roleName=='BDA'}">
															<option value="2">Sales Executive </option>
															<option selected="selected" value="3">BDA</option>
														</c:if>
													</select>
 												</div>
                                           	 </div> 
                                            
                                             <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">PhoneNo</label>
                                                    <input type="text" value="${userProfile.userMobile}" name="userMobile" id="userMobile" class="form-control">
                                                </div>
                                            </div>
                                           </div>
                                            </c:forEach>
                                         
                                      <!--/span-->
                                     
                                      <c:forEach items="${editProfile}" var="editProfile">
                                     	   <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Age</label>
                                                    <input type="text" name="profileAge" value="${editProfile.profileAge}" id="age" class="form-control" placeholder="Age">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Date of Birth</label>
                                                    <input type="date" name="profileDateOfBirth" value="${editProfile.profileDateOfBirth}" class="form-control" placeholder="dd/mm/yyyy">
                                                </div>
                                            </div>
                                         </div>
                                        </c:forEach>
                                        <!--/row-->
                                        <c:forEach items="${editProfile}" var="editProfile">
                                        <div class="row">
                                          <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Gender</label>
                                                    <div class="m-b-10">
                                                    <c:if test="${editProfile.profileGender=='male'}">
                                                        <label class="custom-control custom-radio">
                                                            <input id="male" value="male" checked="checked"  name="profileGender"  type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Male</span>
                                                        </label>
                                                        <label class="custom-control custom-radio">
                                                            <input id="female" value="female" name="profileGender" type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Female</span>
                                                        </label>
                                                    </c:if>
                                                        <c:if test="${editProfile.profileGender=='female'}">
                                                        <label class="custom-control custom-radio">
                                                            <input id="male" value="male"  name="profileGender"  type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Male</span>
                                                        </label>
                                                        <label class="custom-control custom-radio">
                                                            <input id="female" value="female" name="profileGender"  checked="checked" type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Female</span>
                                                        </label>
                                                    </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        </c:forEach>
                                        
                                        <c:forEach items="${editProfile}" var="editProfile">
                                     <h3 class="card-title">Bank Info</h3>
                                        <hr>
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Name</label>
                                                    <input type="text" name="bankName" value="${editProfile.bankName}"  id="bankName" class="form-control" placeholder="Bank Name">
                                                    
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Account No</label>
                                                    <input type="text" name="bankAccountNo" value="${editProfile.bankAccountNo}" id="accountno" class="form-control" placeholder="Account No ">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        </c:forEach>
                                        <!--/row-->
                                        <c:forEach items="${editProfile}" var="editProfile">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank IFSC Code</label>
                                                    <input type="text" name="bankIfscCode" value="${editProfile.bankIfscCode}"  id="ifsccode" class="form-control" placeholder="IFSC Code">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Pancard No</label>
                                                    <input type="text" name="pancardNo" value="${editProfile.pancardNo}"  id="PancardNo" class="form-control" placeholder="Pancard No">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        </c:forEach>
                                        <!--/row-->
                                        
                                        <!--/row-->
                                        <c:forEach items="${editProfile}" var="editProfile">
                                        <h3 class="box-title m-t-40">Address</h3>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                	 <textarea name="profileAddress"  rows="3" class="form-control">${editProfile.profileAddress}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        
                                        <c:forEach items="${editProfile}" var="editProfile">
                                        <div class="row">
                                         <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State</label>
                                                    <select name="stateId" id="stateId"onchange="ajax()" class="form-control custom-select">
                                                        <option value="0">Select your State</option>
                                                        <c:forEach items="${liststate}" var="listState">
                                                   			<c:if test="${listState.stateId == editProfile.stateId.stateId }">
                                                        		<option selected="selected" value="${listState.stateId}">${listState.stateName } </option>
                                                     		</c:if>
                                                     		<c:if test="${listState.stateId != editProfile.stateId.stateId }">
                                                    	 		<option  value="${listState.stateId}">${listState.stateName } </option>
                                                     		</c:if>
                                                     	</c:forEach>
                                                    </select>
                                                 </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City</label>
                                                   <select name="cityId" id="cityId"  class="form-control custom-select">
                                                        <option value="0">Select your City</option>
                                                        <c:forEach items="${listcity}" var="listCity">
                                                    		<c:if test="${listCity.cityId == editProfile.cityId.cityId }">
                                                        		<option selected="selected" value="${listCity.cityId}">${listCity.cityName } </option>
                                                    		 </c:if>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                           <!--/span-->
                                        </div>
                                        </c:forEach>
                                        <!--/row-->
                                        <c:forEach items="${editProfile}" var="editProfile">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Pin Code</label>
                                                    <input type="text" name="profilePincode" value="${editProfile.profilePincode}" class="form-control" placeholder="Pincode">
                                                </div>
                                            </div>
                                            <!--/span-->
                                       </div>
                                       </c:forEach>
                                 
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>Save</button>
                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                    </div>
                                  
                                      </form>
                                		</div>
                              		
                              		 </div>
                                  	</div>
                              	</div>
                             </div>
                      
				<!-- Row -->
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->

				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                CRM © Admin by anonymous :)
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script>
	   			 function ajax() {
				var xmlhttp;
				var key=String(document.getElementById("stateId").value);
			 
				var url=String("../ProfileMasterController?stateId="+key+"&flag=listCity");
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
					if(xmlhttp.readyState==4 && xmlhttp.status==200)
						{
							document.getElementById("cityId").innerHTML=xmlhttp.responseText;
						}
				}
				xmlhttp.open("POST",url,true);
				xmlhttp.send();
			}
	 			 
	    </script>
    
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
