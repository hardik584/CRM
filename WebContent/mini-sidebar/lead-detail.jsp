<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicon.png">
<title>CRM System</title>
<!-- Bootstrap Core CSS -->
<link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="css/colors/blue.css" id="theme" rel="stylesheet">
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
	element.classList.add("active");
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('inquiry','')">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" >
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
		<%@ include file="menubar.jsp"%>
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
				<span class="breadcrumb-item active">Inquiry Details</span>
			</nav><br>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<%int roleId1 = Integer.parseInt(session.getAttribute("loginRoleId").toString());%>
				<c:set value="<%=roleId1%>" scope="session" var="roleId"></c:set>
			<c:forEach items="${inquiryDetail}" var="listInquiry">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">

					<div class="col-lg-2">
						<button align="right" type="button" class="btn btn-success"
							data-toggle="modal" data-target="#responsive-modal"
							class="model_img img-responsive">+Add Activity</button>
					</div>
				</div>
				<br>
				
				 <div class="row">
				  
			 
				<input type="hidden" name="inquiryStatus" id="inquiryStatus" value="${listInquiry.inquiryStatus}">
					<!-- Column -->
					<div class="col-lg-12 col-xlg-12" >
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">INQ0000${ listInquiry.inquiryId}</h4>
								<h6 class="card-subtitle"> ${listInquiry.inquiryTitle}</h6>
								<div class="profiletimeline m-t-40">
									 
 									 <div class="sl-item">
										<div class="sl-left">
										<button type="button" class="btn btn-info btn-circle btn-lg"><i class="mdi mdi-account"></i> </button>
										</div><br>
										<div class="sl-right">
											 <br>
												<div>
												<div class="cbp_tmlabel empty">
 													<div class="body">
														<div class="row">
															<div class="col-md-4 col-sm-4">
															<strong>Inquiry No :</strong><br>
																<address style="color:	rgb(0,128,0);">
																	 INQ0000${ listInquiry.inquiryId}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Inquiry Title:</strong><br>
																	 ${listInquiry.inquiryTitle}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Customer Name/Company Name </strong><br>
																	 ${listInquiry.customerId.customerName}(${listInquiry.customerId.companyName })
																</address>
															</div>
															
															
														</div>
														<div class="row">
														 	<div class="col-md-4 col-sm-4">
														 	<address>
																	<strong>Email:</strong><br>
																	 
																	<c:set var="emailIdCust" value="${listInquiry.customerId.emailId.toString()}"></c:set>
																	<c:set var="emailsplit" value="${fn:split(emailIdCust,',')}" />
					    											<c:forEach items="${emailsplit }" var="emailId">
					    												${emailId} <br>
					    											</c:forEach>  
																</address>
														 	</div>
														 	<div class="col-md-4 col-sm-4">
														 	<address>
																	<strong>Contact:</strong><br>
																	<c:set var="mobileNumberCust" value="${listInquiry.customerId.mobileNumber.toString()}"></c:set>
																	<c:set var="mobilesplit" value="${fn:split(mobileNumberCust,',')}" />
    											 					<c:forEach items="${mobilesplit }" var="mobile">
    																	${mobile} <br>
    																</c:forEach>
																	 
																</address>
														 	</div>
														 	<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Inquiry Date :</strong><br>${listInquiry.inquiryDateTime}
																</address>
															</div>
														</div>

														<div class="row">
															
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Category Name:</strong><br>${listInquiry.categoryId.categoryName}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Product Name :</strong><br> ${listInquiry.productId.productName}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Lead Source : </strong><br> ${listInquiry.inquirySource} 
																</address>
															</div>
															

														</div>
														
														<div class="row">
														 	
															
															
															<div class="col-md-4 col-sm-4" id="colorStatus">
																<strong>Inquiry Status :</strong><br>
																
																	<c:if test='${listInquiry.inquiryStatus=="Pending"}'>
																	<address style="color:rgb(255, 153, 0);">
																	 ${listInquiry.inquiryStatus}
																	</address>
																	</c:if>
																	
																	<c:if test='${listInquiry.inquiryStatus=="Converted"}'>
																	<address style="color: rgb(0, 204, 153);">
																	  ${listInquiry.inquiryStatus}
																	</address>
																	</c:if>
																	<c:if test='${listInquiry.inquiryStatus=="Cancle"}'>
																	<address style="color: red">
																	 ${listInquiry.inquiryStatus}
																	</address>
																	</c:if>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																 	<c:if test="${roleId==3}">
	                                                    	 			<strong>Assigned Form:</strong><br> ${listInquiry.userId.userName}
																	</c:if>
																	<c:if test="${roleId==1}">
	                                                    	 			<strong>Assigned Form:To</strong><br> ${listInquiry.userId.userName}-><%=session.getAttribute("assignName").toString() %>
																	</c:if>
																	<c:if test="${roleId==2}">
	                                                    	 			<strong>Assigned To:</strong><br>
																		<%=session.getAttribute("assignName").toString() %>
																	</c:if>
																</address>
															</div>
															
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Remark :</strong><br> ${listInquiry.inquiryRemark}
																</address>
															</div>
														 </div>
														  
														<c:if test="${listInquiry.visitingCard!=null}">
														<div class="row">
															 
														 	<img  src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/customerImage/${listInquiry.visitingCard}" height="200" width="200"   draggable="true" data-bukket-ext-bukket-draggable="true"/> 
														 
														</div>
														</c:if>
 													</div>
												</div>
											  </div>
											</div>
									   <hr>
									<c:forEach items="${listInquiry.inquiryActivityMasterVos}" var="listInquiryActivity">
									 
								
									<div class="sl-item">
										<c:if test="${listInquiryActivity.inquiryActivityType=='meeting'}">
										<div class="sl-left">
											<button type="button" class="btn btn-success btn-circle btn-lg"><i class="fa fa-link"></i> </button>
										</div>
										</c:if>
										<c:if test="${listInquiryActivity.inquiryActivityType=='callafter'}">
										<div class="sl-left">
											<button type="button" class="btn btn-danger btn-circle btn-lg"><i class="mdi mdi-phone-missed"></i> </button>
										</div>
										</c:if>
										<c:if test="${listInquiryActivity.inquiryActivityType=='pending'}">
									 	<div class="sl-left">
											<button type="button" class="btn btn-warning btn-circle btn-lg"><i class="mdi mdi-clock-alert"></i> </button>
										</div>
										</c:if>
										<c:if test="${listInquiryActivity.inquiryActivityType=='notinterested'}">
									 	<div class="sl-left">
											<button type="button" class="btn btn-primary btn-circle btn-lg"><i class="mdi mdi-thumb-down"></i> </button>
										</div>
										</c:if>
										
										
										<div class="sl-right">
										<div align="right"><a href="<%=request.getContextPath()%>/InquiryActivityMasterController?flag=deleteinqact&inquiryActivityId=${listInquiryActivity.inquiryActivityId}&inquiryId=${listInquiryActivity.inquiryId.inquiryId}" > <button type="button" class="btn btn-danger btn-circle"><i class="mdi mdi-delete"></i> </button></a></div>
											<div>
												<div class="cbp_tmlabel empty">
 													<div class="body">
														<div class="row">
															<div class="col-md-4 col-sm-4">
															<strong>Activity Title :</strong><br>
																<address  >
																	 ${listInquiryActivity.inquiryActivityName}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Type </strong><br>
																	 ${listInquiryActivity.inquiryActivityType}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity DateTime:</strong><br>
																	  ${listInquiryActivity.inquiryActivityDateTime}
																</address>
															</div>
														</div>

														<div class="row">
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Outcome :</strong><br>${listInquiryActivity.inquiryActivityOutcome }
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Remark:</strong><br>${listInquiryActivity.inquiryActivityRemark }
																</address>
															</div>
															 
															

														</div>
														<div class="row">
															<c:if test="${listInquiryActivity.remainderDate!='' }">
														 	<div class="col-md-4 col-sm-4">
														 		 
																<address>
																	<strong>Remainder Date:</strong><br>${listInquiryActivity.remainderDate }
																</address>
																 
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Remainder Time:</strong><br>${listInquiryActivity.remainderTime }
																</address>
															</div>
															<c:if test="${ listInquiryActivity.remainderRemark  != ''  }">
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Remainder Remark:</strong><br> ${listInquiryActivity.remainderRemark}
																</address>
															</div>
															</c:if>
															</c:if>
														 </div>
 													</div>
												</div>
											  </div>
										 </div>
									</div>
								<hr>
							</c:forEach>
									
									
								</div>
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






			<div id="responsive-modal" class="modal fade" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				style="display: none;">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Add Activity</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<form name="InquiryActivityMasterVo" action="<%=request.getContextPath()%>/InquiryActivityMasterController">
						<div class="modal-body">
								<input type="hidden" name="flag" value="addInquiryActivity">
								<input type="hidden" name="inquiryId" value="${listInquiry.inquiryId}">
								<input type="hidden" name="userId" value="<%=session.getAttribute("loginId") %>">
								<div class="form-body">

									<div class="row p-t-20">

										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label">Activity Type<span style="color: red;">*</span></label>
												<div class="form-group">
													<select required="required" class="form-control show-tick"   name="inquiryActivityType" tabindex="1">
														<option value="" disabled selected>Select Activity Type</option>
														<option value="callafter">Call After</option>
														<option value="meeting">Meeting</option>
														<option value="pending">Pending</option>
														<option value="notinterested">Not Interested</option>
													</select>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label">Inquiry Activity Title<span style="color: red;">*</span></label>
												<input name="inquiryActivityName" type="text" id="activity" class="form-control" required="required" placeholder="Inquiry activity" tabindex="1">
												<!--  <small class="form-control-feedback"> This is inline help </small> -->
											</div>
										</div>
									</div>
								
 									<div class="row">
										<div class="col-sm-6">
											<label>Outcome<span style="color: red;">*</span></label>
											<div class="form-group">
												<select required="required" class="form-control show-tick" name="inquiryActivityOutcome"
													data-placeholder="Choose a Category" tabindex="1">
													<option value="" disabled selected>Select Outcome</option>
													<option value="callafter">Call After</option>
													<option value="meeting">Meeting</option>
													<option value="pending">Pending</option>
													<option value="notinterested">Not Interested</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Remark</label>
												<textarea tabindex="1" name="inquiryActivityRemark"class="form-control" rows="2"
													placeholder="Description"></textarea>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="row">
									<div class="col-lg-2 col-md-2 col-sm-2">
                                    <button class="btn btn-success btn-sm pull-right collapsed" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Remainder <i class="ti-angle-down has-arrow"></i></button>
									</div>
									</div>
									<div class="collapse" id="collapseExample"
										aria-expanded="false">
										<div class="row form-material">
											<div class="col-md-6">
												<label class="m-t-20">Reminder Date </label> <input   name="remainderDate" type="text"
													class="form-control" placeholder="2017-06-04" id="mdate">

											</div>
											<div class="col-md-6">
												<label class="m-t-20 from-label">Reminder Time</label> <input name="remainderTime"type="text"
													class="form-control" placeholder="12:20" id="timepicker">
											</div>
										</div><br>
										<div class="row">
											<div class="col-sm-12">
												<label>Reminder Description</label>
												<div class="form-group">
													<textarea rows="4"
														name="remainderRemark"
														class="form-control no-resize"
														placeholder="Reminder Description"></textarea>
												</div>
											</div>

										</div>
									</div>
 
								</div>
							
						</div>
						<div class="modal-footer">
							<button tabindex="1" type="button" class="btn btn-danger waves-effect"
								data-dismiss="modal">Close</button>
							<button tabindex="1" type="submit" 
								class="btn btn-success waves-effect waves-light">Save</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer"> CRM © Admin by anonymous :) </footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
			</c:forEach>
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	</div>
	
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
     <script src="js/jasny-bootstrap.js"></script>
    <!--stickey kit -->
    <script src="../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Plugins for this page -->
    <!-- ============================================================== -->
    <!-- Plugin JavaScript -->
    <script src="../assets/plugins/moment/moment.js"></script>
    <script src="../assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="../assets/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="../assets/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="../assets/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="../assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="../assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="../assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="../assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script>
    // MAterial Date picker    
    $('#mdate').bootstrapMaterialDatePicker({ weekStart: 0, time: false });
    $('#mdate1').bootstrapMaterialDatePicker({ weekStart: 0, time: false });
    $('#timepicker').bootstrapMaterialDatePicker({ format: 'HH:mm', time: true, date: false });
    $('#date-format').bootstrapMaterialDatePicker({ format: 'dddd DD MMMM YYYY - HH:mm' });

    $('#min-date').bootstrapMaterialDatePicker({ format: 'DD/MM/YYYY HH:mm', minDate: new Date() });
    // Clock pickers
    $('#single-input').clockpicker({
        placement: 'bottom',
        align: 'left',
        autoclose: true,
        'default': 'now'
    });
    $('.clockpicker').clockpicker({
        donetext: 'Done',
    }).find('input').change(function() {
        console.log(this.value);
    });
    $('#check-minutes').click(function(e) {
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show').clockpicker('toggleView', 'minutes');
    });
    if (/mobile/i.test(navigator.userAgent)) {
        $('input').prop('readOnly', true);
    }
    // Colorpicker
    $(".colorpicker").asColorPicker();
    $(".complex-colorpicker").asColorPicker({
        mode: 'complex'
    });
    $(".gradient-colorpicker").asColorPicker({
        mode: 'gradient'
    });
    // Date Picker
    jQuery('.mydatepicker, #datepicker').datepicker();
    jQuery('#datepicker-autoclose').datepicker({
        autoclose: true,
        todayHighlight: true
    });
    jQuery('#date-range').datepicker({
        toggleActive: true
    });
    jQuery('#datepicker-inline').datepicker({
        todayHighlight: true
    });
    // Daterange picker
    $('.input-daterange-datepicker').daterangepicker({
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse'
    });
    $('.input-daterange-timepicker').daterangepicker({
        timePicker: true,
        format: 'MM/DD/YYYY h:mm A',
        timePickerIncrement: 30,
        timePicker12Hour: true,
        timePickerSeconds: false,
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse'
    });
    $('.input-limit-datepicker').daterangepicker({
        format: 'MM/DD/YYYY',
        minDate: '06/01/2015',
        maxDate: '06/30/2015',
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse',
        dateLimit: {
            days: 6
        }
    });
    </script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
