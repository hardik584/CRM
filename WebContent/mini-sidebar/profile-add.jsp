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
				<c:if test="${listSize==1}">
                 <span class="breadcrumb-item active">Edit Profile</span>
                </c:if>
                <c:if test="${listSize==0}">
                 <span class="breadcrumb-item active">New Profile</span>
                </c:if>
				 
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
                             	<c:if test="${listSize==0}">
                                <h4 class="m-b-0 text-white">New Profile</h4>
                                </c:if>
                                <c:if test="${listSize==1}">
                                <h4 class="m-b-0 text-white">Edit Profile</h4>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <form name="ProfileMasterVo" method="post" enctype="multipart/form-data"  action="<%=request.getContextPath()%>/ProfileMasterController">
                                    <div class="form-body">
                                    <input type="hidden" name="flag" value="addprofiledetail">
                                   
                                    <h3 class="card-title">Introduction</h3>
                                        <hr>
                                        <c:forEach items="${userProfile}" var="userProfile">
                                        <input type="hidden" name="userPassword" value="${userProfile.userPassword}">
                                		<input type="hidden" name="userId" value="${userProfile.userId}">
                                            <!--/span-->
                                            <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">User Name<span style="color: red;">*</span></label>
                                                    <input required="required"  tabindex="1" type="text" value="${userProfile.userName}" name="userName" id="userName" class="form-control" >
                                           	   </div>
                                           	 </div> 
                                             <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Email<span style="color: red;">*</span></label>
                                                    <input required="required" tabindex="1" type="email" value="${userProfile.userEmail}" name="userEmail" id="userEmail" class="form-control">
                                                </div>
                                            </div>
                                           </div>
                                           
                                           <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Role Name<span style="color: red;">*</span></label>
                                                    <select required="required" name="roleId"  class="form-control custom-select"
														data-placeholder="Choose a role" tabindex="1">
														<c:if test="${userProfile.roleId.roleName=='Sales Executive'}">
															<option selected="selected" value="2">Sales Executive </option>
															<option value="3">BDA</option>
														</c:if>
														<c:if test="${userProfile.roleId.roleName=='BDA'}">
															<option value="2">Sales Executive </option>
															<option selected="selected" value="3">BDA</option>
														</c:if>
														<c:if test="${userProfile.roleId.roleName=='Admin'}">
															<option selected="selected" value="1">Admin</option>
															<option value="2">Sales Executive </option>
															<option  value="3">BDA</option>
														</c:if>
													</select>
 												</div>
                                           	 </div>
                                           	  
                                             <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Contact<span style="color: red;">*</span></label>
                                                    <input required="required" maxlength="10" pattern="[0-9]{10}"  tabindex="1" type="text" value="${userProfile.userMobile}" name="userMobile" id="userMobile" class="form-control">
                                                </div>
                                            </div>
                                           </div>
                                            </c:forEach>
                                            
                                       
                                        <c:choose> 
                                         <c:when test="${listSize==1}">
                                           <c:forEach items="${checkProfile}" var="checkProfile">
                                           <input type="hidden" value="${checkProfile.profileImage}" name="profileImage">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Age<span style="color: red;">*</span> </label>
                                                    <input required="required"  tabindex="1" type="text" name="profileAge" id="age" value="${checkProfile.profileAge}" class="form-control" placeholder="Age">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Date of Birth<span style="color: red;">*</span></label>
                                                    <input required="required" tabindex="1" type="date" name="profileDateOfBirth" value="${checkProfile.profileDateOfBirth}" class="form-control" placeholder="dd/mm/yyyy">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Gender<span style="color: red;">*</span></label>
                                                    <div class="m-b-10">
                                                       <c:if test="${checkProfile.profileGender=='male'}">
                                                        <label class="custom-control custom-radio">
                                                            <input id="male" value="male" checked="checked"  name="profileGender"  type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Male</span>
                                                        </label>
                                                        <label class="custom-control custom-radio">
                                                            <input id="female" value="female" name="profileGender" type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Female</span>
                                                        </label>
                                                    </c:if>
                                                        <c:if test="${checkProfile.profileGender=='female'}">
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
                                            
                                            <div class="col-md-6">
												<div class="form-group">
													<label>Profile Image</label><br/>
													<input type="file" name="fileName"
														id="file-with-multi-file" class="input-default-js"
														data-multiple-target="{target} files selected" multiple  >
													<label class="label-for-default-js rounded-right mb-3"
														for="file-with-multi-file"> </label>
												</div>
											</div>
                                            <!--/span-->
                                        </div>
                                    
                                        <h3 class="card-title">Bank Info</h3>
                                        <hr>
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Name</label>
                                                    <input  tabindex="1"  type="text" name="bankName" id="bankName"  value="${checkProfile.bankName}" class="form-control" placeholder="Bank Name">
                                                    
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Account No</label>
                                                    <input   tabindex="1" type="text" name="bankAccountNo" id="accountno" value="${checkProfile.bankAccountNo}" class="form-control" placeholder="Account No ">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank IFSC Code</label>
                                                    <input   tabindex="1" type="text" name="bankIfscCode" id="ifsccode"  value="${checkProfile.bankIfscCode}" class="form-control" placeholder="IFSC Code">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Pan Card No</label>
                                                    <input  tabindex="1" type="text" name="pancardNo" id="PancardNo" value="${checkProfile.pancardNo}" class="form-control" placeholder="Pancard No">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        
                                        <!--/row-->
                                        <h3 class="box-title m-t-40">Address</h3>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Address<span style="color: red;">*</span></label>
                                                	 <textarea required="required"  tabindex="1" name="profileAddress"  rows="3" class="form-control">${checkProfile.profileAddress}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                         <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State<span style="color: red;">*</span></label>
                                                    <select required="required" tabindex="1" name="stateId" id="stateId" onchange="ajax()" class="form-control custom-select">
                                                        <c:forEach items="${listState}" var="listState">
                                                   			<c:if test="${listState.stateId == checkProfile.stateId.stateId }">
                                                        		<option selected="selected" value="${listState.stateId}">${listState.stateName } </option>
                                                     		</c:if>
                                                     		<c:if test="${listState.stateId != checkProfile.stateId.stateId }">
                                                    	 		<option  value="${listState.stateId}">${listState.stateName } </option>
                                                     		</c:if>
                                                     	</c:forEach>
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City<span style="color: red;">*</span></label>
                                                   <select required="required"  tabindex="1" name="cityId" id="cityId"  class="form-control custom-select">
                                                       	<c:forEach items="${listCity}" var="listCity">
                                                    		<c:if test="${listCity.cityId == checkProfile.cityId.cityId }">
                                                        		<option selected="selected" value="${listCity.cityId}">${listCity.cityName } </option>
                                                    		 </c:if>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                           <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Pin Code<span style="color: red;">*</span></label>
                                                    <input maxlength="6" pattern="[0-9]{6}" tabindex="1" type="text" name="profilePincode" value="${checkProfile.profilePincode}" class="form-control" placeholder="Pincode">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>
                                        </c:forEach>
                                        </c:when> 
                                        
                                        
                                       <c:when test="${listSize==0}">
                                         <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Age<span style="color: red;">*</span></label>
                                                    <input required="required" type="number" name="profileAge" id="age" class="form-control" placeholder="Age">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Date of Birth<span style="color: red;">*</span></label>
                                                    <input required="required" type="date" name="profileDateOfBirth" class="form-control" placeholder="dd/mm/yyyy">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Gender<span style="color: red;">*</span></label>
                                                    <div class="m-b-10">
                                                        <label class="custom-control custom-radio">
                                                            <input  id="male" name="profileGender" value="male" type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Male</span>
                                                        </label>
                                                        <label class="custom-control custom-radio">
                                                            <input id="female" name="profileGender" value="female" type="radio" class="custom-control-input">
                                                            <span class="custom-control-label">Female</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
												<div class="form-group">
													<label>Profile Image</label><br/>
													<input type="file" name="fileName"
														id="file-with-multi-file" class="input-default-js"
														data-multiple-target="{target} files selected" multiple>
													<label class="label-for-default-js rounded-right mb-3"
														for="file-with-multi-file"> </label>
												</div>
											</div>
                                            <!--/span-->
                                        </div>
                                    
                                        <h3 class="card-title">Bank Info</h3>
                                        <hr>
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Name</label>
                                                    <input type="text" name="bankName" id="bankName" class="form-control" placeholder="Bank Name">
                                                    
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank Account No</label>
                                                    <input type="text" name="bankAccountNo" id="accountno" class="form-control" placeholder="Account No ">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Bank IFSC Code</label>
                                                    <input type="text" name="bankIfscCode" id="ifsccode" class="form-control" placeholder="IFSC Code">
                                              </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Pan card No</label>
                                                    <input type="text" name="pancardNo" id="PancardNo" class="form-control" placeholder="Pancard No">
                                              </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        
                                        <!--/row-->
                                        <h3 class="box-title m-t-40">Address</h3>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Address<span style="color: red;">*</span></label>
                                                	 <textarea required="required" name="profileAddress" rows="3" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                         <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State<span style="color: red;">*</span></label>
                                                    <select required="required" name="stateId" id="stateId"onchange="ajax()" class="form-control custom-select">
                                                       <option value="" disabled selected>Select State</option>
                                                        <c:forEach items="${listState}" var="listState">
                                                   			 <option value="${listState.stateId}">${listState.stateName } </option>
                                                    	</c:forEach>
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City<span style="color: red;">*</span></label>
                                                   <select required="required" name="cityId" id="cityId"  class="form-control custom-select">
                                                      <option value="" disabled selected>Select City</option>
                                                    </select>
                                                </div>
                                            </div>
                                           <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Pin Code<span style="color: red;">*</span></label>
                                                    <input required="required" maxlength="6" pattern="[0-9]{6}" type="text" name="profilePincode" class="form-control" placeholder="Pincode">
                                                </div>
                                            </div>
                                          </div>
                                       </c:when>
                                      </c:choose>
                                      
                                   
                                    </div>
                                    <div class="form-actions">
                                        <button  tabindex="1" type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
                                        <button  tabindex="1" type="reset" class="btn btn-inverse">Reset</button>
                                    </div>
                                </form>
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
    </div>
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