<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title> CRM System</title>
    <!-- Bootstrap Core CSS -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Page plugins css -->
    <link href="../assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
    <link href="../assets/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="../assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker plugins css -->
    <link href="../assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="../assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
<script type="text/javascript">	
function checkActive()
{
	var element = document.getElementById("inquiry");
	var element1 = document.getElementById("addinquiry");
	element.classList.add("active");
	element1.classList.add("active");
}
</script>
<body class="fix-header card-no-border" onload="getNotify('inquiry','addinquiry')">
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
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <nav class="breadcrumb">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a> 
				<a class="breadcrumb-item" href="javascript:void(0);">Inquiry</a> 
				<span class="breadcrumb-item active">New Inquiry</span>
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
                 
                             
				<c:set var="lastInquiry" value="${lastInquiry }"></c:set>
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline-info">
							<div class="card-header">
								<h4 class="m-b-0 text-white">New Inquiry</h4>
							</div>
							<div class="card-body">
								<form name="InquiryMasterVo" id="InquiryMasterVo"  method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/InquiryMasterController">
									<div class="form-body">
										 <input type="hidden" name="flag" value="addInquiry">
										<div class="row p-t-20">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Customer/Company Name<span style="color: red;">*</span></label>
													<div class="input-group">
														<select  name="customerId" class="form-control custom-select"
														data-placeholder="Choose Customer" tabindex="1" required="required">
															 <option value="" disabled selected>Select Customer</option>
															 <c:forEach items="${listCustomer}" var="listCustomer">
                                                   			 <option  value="${listCustomer.customerId}">${listCustomer.customerName }(${listCustomer.companyName}) </option>
                                                    		</c:forEach>
														</select>
														<div class="input-group-append">

															  <tr>
																<td colspan="2">
																	<button class="btn btn-success" type="button"
																		tabindex="1"class="fa fa-plus" data-toggle="modal"
																		data-target="#add-contact">+</button>
																</td>

																<td colspan="7">
																	<div class="text-right">
																		<ul class="pagination">
																		</ul>
																	</div>
																</td>
									 						</tr> 
														</div>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Inquiry Title<span style="color: red;">*</span></label> <input
														tabindex="1"type="text" name="inquiryTitle" required="required" id="Inquirytitle" class="form-control"
														placeholder="Inquiry title">
													 
												</div>
											</div>
											<!--/span-->
										</div>

										<!-- row -->
										<div class="row">
										<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Category<span style="color: red;">*</span></label> <select
														class="form-control custom-select"
														data-placeholder="Choose a Category" required="required" name="categoryId" id="categoryId" onchange="ajaxProduct()" tabindex="1">
														  <option value="" disabled selected>Select Category</option>
														 <c:forEach items="${listCategory}" var="listCategory">
                                                   			 <option  value="${listCategory.categoryId}">${listCategory.categoryName } </option>
                                                    	</c:forEach>

													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Product<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required"name="productId" id="productId"
														data-placeholder="Choose a Category" tabindex="1">
														 <option value="" disabled selected>Select Product</option>
														 
													</select>
												</div>
											</div>
 	 
										</div>

										<div class="row">
										<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Inquiry Source<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required"name="inquirySource"
														data-placeholder="Choose a Category" tabindex="1">
														 <option value="" disabled selected>Select Inquiry Source</option>
														<option value="Reference">Reference</option>
														<option value="Visiting Card">Visiting Card</option>
														<option value="Social Media">Social Media</option>
														<option value="Marketing Person">Marketing Person</option>
														<option value="Template">Template</option>
														<option value="cold calling">cold calling</option>
														<option value="Email">Email</option>
														<option value="Message">Message</option>

													</select>
												</div>
											</div>
											 <div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Status<span style="color: red;">*</span></label> <select
														class="form-control custom-select"required="required" name="inquiryStatus"
														data-placeholder="Choose a Category" tabindex="1">
														 <option value="" disabled selected>Select your Status</option>
														<option value="Pending">Pending</option>
														<option value="Converted">Converted</option>
														<option value="Cancle">Cancel</option>
													</select>
												</div>
											</div>
											 
										</div>
										<div class="row">
										<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Assign To<span style="color: red;">*</span></label> 
													<select class="form-control custom-select"
														data-placeholder="Assign to." required="required" name="assignId" id="assignId"   tabindex="1">
														  <option value="" disabled selected>Select Assign Person </option>
														 <c:forEach items="${listBDE}" var="listBDE">
                                                   			 <option  value="${listBDE.userId}">${listBDE.userName}(${listBDE.roleId.roleName}) </option>
                                                    	</c:forEach>

													</select>
											</div>
										</div>
										<div class="col-md-6">
												<div class="form-group">
													<label>Visiting Card</label><br/>
													<input type="file" name="fileName"
														id="file-with-multi-file" class="input-default-js"
														data-multiple-target="{target} files selected" tabindex="1" multiple>
													<label class="label-for-default-js rounded-right mb-3"
														for="file-with-multi-file"> </label>
												</div>
										</div>
										
											 
											
										</div>
										<div class="row">
										 
											<div class="col-md-6">
												<div class="form-group">
													<label>Remark</label>
													<textarea class="form-control" name="inquiryRemark" rows="3"
														placeholder="Inquiry Remark" tabindex="1"></textarea>
												</div>
											</div>
										</div>
 									</div>
									<div class="form-actions">
										<button tabindex="1" type="submit" class="btn btn-success">
											<i class="fa fa-check"></i> Save
										</button>
										<button tabindex="1"  type="reset" class="btn btn-inverse">Reset</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

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
            <footer class="footer"> CRM © Admin by anonymous :)</footer>
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
    <!-- Modal -->
    
    <div id="add-contact" class="modal fade in" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Add Customer</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					
				</div>
				<form name="CustomerMasterVo" action="<%=request.getContextPath()%>/CustomerMasterController" method="post">
				<div class="modal-body">

					<!-- <div class="container-fluid"> -->
						<div class="row">
							<div class="col-mg-12">
								<div class="card card-outline-info">
								 
									<div class="card-body">
                                
                                    <div class="form-body">
                                        <input type="hidden" name="flag" value="addCustomerthrowInquiry">
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Customer Name<span style="color: red;">*</span></label>
                                                    <input name="customerName" type="text" required="required" id="customerName" class="form-control" placeholder="Customer Name">
                                                 </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                  	                  <label class="control-label">Company Name<span style="color: red;">*</span></label>
                                                    <input name="companyName" required="required" type="text" id="companyName" class="form-control " placeholder="Company Name">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                        
                                         
                                            <div class="col-md-6 nopadding">
                                        		<div class="form-group">
                                        		<label class="control-label">Email<span style="color: red;">*</span></label>
                                            		<div class="input-group">
                                           				 <input name="emailId" type="email" required="required" id="email" class="form-control " placeholder="Email">
		                                               <div class="input-group-append">
		                                               		<button class="btn btn-success" type="button" onclick="customer_email();"><i class="fa fa-plus"></i></button>
		                                               </div>
		                                                
                                            		</div>
                                            		
                                        		</div>
                                        		<div id="customerEmail"></div>
                                   			 </div>
                                   			
                                            <!--/span-->
                                            <div class="col-md-6 nopadding">
                                        		<div class="form-group">
                                        		<label class="control-label">Contact<span style="color: red;">*</span></label>
                                            		<div class="input-group">
                                           				 <input name="mobileNumber" type="text" maxlength="10" pattern="[0-9]{10}" id="Contact" class="form-control " placeholder="Contact">
		                                               <div class="input-group-append">
		                                               		<button class="btn btn-success" type="button" onclick="customer_contact();"><i class="fa fa-plus"></i></button>
		                                               </div>
		                                                
                                            		</div>
                                            		
                                        		</div>
                                        		<div id="customerContact"></div>
                                   			 </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                       <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Telephone</label>
                                                     <input name="telephone" maxlength="10" pattern="[0-9]{10}" type="text" id="Telephone" class="form-control " placeholder="Telephone">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                              
                                                <div class="form-group ">
                                                    <label class="control-label">Designation</label>
                                                    <input name="designation" type="text" id="customerDesg" class="form-control " placeholder="Designation">
                                                </div>
                                            </div>
                                         </div>
                                         
                                          
                                            <!--/span-->
                                        </div>
                                        
                                        <!--/row-->
                                         
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Address<span style="color: red;">*</span></label>
                                                    <textarea name="address" required="required"  class="form-control" rows="3" placeholder="Address"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State<span style="color: red;">*</span></label>
                                                     <select required="required" name="stateId" id="stateId"onchange="ajaxCity()" class="form-control custom-select">
                                                        <option value="" disabled selected>Select State</option>
                                                        <c:forEach items="${listState}" var="listState">
                                                   			 <option  value="${listState.stateId}">${listState.stateName } </option>
                                                    	</c:forEach>
                                                         
                                                    </select>
                                                </div>
                                            </div>
	                                            
                                            
                                            <div class="col-md-6" >
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
                                                    <input maxlength="6" pattern="[0-9]{6}" name="pincode" required="required" type="text" class="form-control"  placeholder="Pin Code"> 
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">GST No</label>
                                                     <input name="gstNo"  maxlength="15" pattern="[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}" type="text" id="gstNo" class="form-control " placeholder="GST No">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>
                                    
                                     
                                
                                </div>
								</div>
							</div>
						</div>
					<!-- </div> -->
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success"  >
						<i class="fa fa-check"></i>Save
					</button>
					<button type="button"  class="btn btn-inverse" data-dismiss="modal">Cancel</button>
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
       
</body>


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
    <script>
	   			function ajaxCity() {
				var xmlhttp;
				var key=String(document.getElementById("stateId").value);
			 
				var url=String("../CustomerMasterController?stateId="+key+"&flag=listCity");
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
	   			function ajaxProduct() {
					var xmlhttp;
					var key=String(document.getElementById("categoryId").value);
				 
					var url=String("../InquiryMasterController?categoryId="+key+"&flag=listProduct");
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
								document.getElementById("productId").innerHTML=xmlhttp.responseText;
							}
					}
					xmlhttp.open("POST",url,true);
					xmlhttp.send();
				}

		   		 
	 			 
	    </script>
  </html>   
