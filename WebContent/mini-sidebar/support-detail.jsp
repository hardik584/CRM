<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	var element = document.getElementById("support");
	element.classList.add("active");
	 
}

</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('support','')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Support</a> 
				<span class="breadcrumb-item active">Support Details</span>
			</nav><br>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
			<c:forEach items="${supportDetail}" var="listdetail">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">

					<div class="col-lg-2"  >
						<button  type="button" class="btn btn-success"
							data-toggle="modal" data-target="#responsive-modal"
							class="model_img img-responsive">+Add Activity</button>
					</div>
				</div>
				<br>
				
				 <div class="row">
				 <%-- <input type="hidden" name="supportDateTime" id="supportDateTime" value="${listdetail.supportDateTime}">
				 <input type="hidden" name="categoryId" id="categoryId" value="${listdetail.categoryId}">
				 <input type="hidden" name="supportSource" id="supportSource" value="${listdetail.supportSource}"> --%>
				 
					<!-- Column -->
					<div class="col-lg-12 col-xlg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">SUP0000${listdetail.supportId}</h4>
								<h6 class="card-subtitle">${listdetail.supportName}</h6>
								<div class="profiletimeline m-t-40">
									 <div class="sl-item">
										<div class="sl-left">
										<button type="button" class="btn btn-info btn-circle btn-lg"><i class="mdi mdi-account"></i> </button>
										</div>
										<div class="sl-right">
											<div>
												<!-- <a href="#" class="link">Inquiry Title</a>  --> 
												<!-- <div class="m-t-20 row"> -->
												<br>
												<div class="cbp_tmlabel empty">
 													<div class="body">
 													<div class="row"></div><br>
														<div class="row">
															<div class="col-md-4 col-sm-4">
																<strong>Support ID:</strong><br>
																<address style="color:	rgb(0,128,0);">
																	 SUP0000${listdetail.supportId}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Customer Name/Company Name </strong><br>
																	${listdetail.customerId.customerName}(${listdetail.customerId.companyName})
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Service Title:</strong><br>
																	${listdetail.supportName}
																</address>
															</div>
														</div>

														<div class="row">
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Product Name :</strong><br> 
																	${listdetail.productId.productName}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Status</strong><br>
																	<c:if test='${listdetail.supportStatus=="Pending"}'>
																	<address style="color:rgb(255, 153, 0);">
																		 ${listdetail.supportStatus}
																	</address>
																	</c:if>
																	
																	<c:if test='${listdetail.supportStatus=="Solved"}'>
																	<address style="color: rgb(0, 204, 153);">
																	 	 ${listdetail.supportStatus}
																	</address>
																	</c:if>
																	<c:if test='${listdetail.supportStatus=="Cancle"}'>
																	<address style="color: red">
																		 ${listdetail.supportStatus}
																	</address>
																	</c:if>
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Desc</strong><br>${listdetail.remark}
																</address>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									 
									<hr>
									
									<c:forEach items="${listdetail.supportActivityMasterVos}" var="listsupportActivity">
									<div class="sl-item">
									<c:if test="${listsupportActivity.supportActivityType=='meeting'}">
										<div class="sl-left">
											<button type="button" class="btn btn-success btn-circle btn-lg"><i class="fa fa-link"></i> </button>
										</div>
									</c:if>
									<c:if test="${listsupportActivity.supportActivityType=='callafter'}">
									 	<div class="sl-left">
											<button type="button" class="btn btn-danger btn-circle btn-lg"><i class="mdi mdi-phone-missed"></i> </button>
										</div>
									</c:if>
									<c:if test="${listsupportActivity.supportActivityType=='pending'}">
										<div class="sl-left">
											<button type="button" class="btn btn-warning btn-circle btn-lg"><i class="mdi mdi-clock-alert"></i> </button>
										</div>
									</c:if>
									<c:if test="${listsupportActivity.supportActivityType=='notinterested'}">
									  <div class="sl-left">
											<button type="button" class="btn btn-primary btn-circle btn-lg"><i class="mdi mdi-thumb-down"></i> </button>
										</div>
									</c:if>
										<div class="sl-right">
										  <div align="right"><a href="<%=request.getContextPath()%>/SupportMasterActivityController?flag=deletesupact&supportActivityId=${listsupportActivity.supportActivityId}&supportId=${listsupportActivity.supportId.supportId}" > <button type="button" class="btn btn-danger btn-circle"><i class="mdi mdi-delete"></i> </button></a></div> 
											<div>
												<div class="cbp_tmlabel empty">
 													<div class="body">
														<div class="row">
															<div class="col-md-4 col-sm-4">
															<strong>Activity Title :</strong><br>
																<address  >
																	 ${listsupportActivity.supportActivityName}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Type </strong><br>
																	 ${listsupportActivity.supportActivityType}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity DateTime:</strong><br>
																	  ${listsupportActivity.supportActivityDateTime}
																</address>
															</div>
														</div>

														<div class="row">
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Outcome :</strong><br>${listsupportActivity.supportActivityOutcome}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Activity Remark:</strong><br>${listsupportActivity.supportActivityDescription }
																</address>
															</div>
														</div>
														<div class="row">
															<c:if test="${listsupportActivity.supportActivityReminderDate!=''}">
														 	<div class="col-md-4 col-sm-4">
														 		<address>
																	<strong>Remainder Date:</strong><br>${listsupportActivity.supportActivityReminderDate}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Remainder Time:</strong><br>${listsupportActivity.supportActivityReminderTime}
																</address>
															</div>
															<div class="col-md-4 col-sm-4">
																<address>
																	<strong>Remainder Remark:</strong><br> ${listsupportActivity.supportActivityReminderRemark}
																</address>
															</div>
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
				</c:forEach>
				</div>
				
				</div>
				 
		
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
					<form name="SupportActivityMasterVo"  method="post" action="<%=request.getContextPath()%>/SupportMasterActivityController">
					<input type="hidden" name="flag" value="addSupportActivity">
						<div class="modal-body">
								<c:forEach items="${supportDetail}" var="listdetails">
								<input type="hidden" name="supportId" value="${listdetails.supportId}" >
								</c:forEach>
								<%-- <c:forEach items="${listsupportActivity }" var="activitylist">
								<input type="hidden" name="supportActivityDateTime" value="${activitylist.supportActivityDateTime}">
								</c:forEach> --%>
								 <input type="hidden" name="userId" value="<%=session.getAttribute("loginId") %>">
								
								<div class="form-body"  >
									<div class="row p-t-20">
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label">Support Title</label>
												<div class="form-group">
													<select name="supportActivityType" class="form-control show-tick"
														data-placeholder="Choose a Category" tabindex="1">
														<option value="">-- Select Activity Type--</option>
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
												<label class="control-label">Support Activity Title</label>
												<input name="supportActivityName" type="text" id="activity" class="form-control"
													placeholder="Inquiry activity">
												<!--  <small class="form-control-feedback"> This is inline help </small> -->
											</div>
										</div>
									</div>
									
									<!--/row-->
									<div class="row">
										<div class="col-sm-6">
											<label>Outcome</label>
											<div class="form-group">
												<select name="supportActivityOutcome" class="form-control show-tick"
													data-placeholder="Choose a Category" tabindex="1">
													<option value="">-- Status --</option>
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
												<textarea name="supportActivityDescription" class="form-control" rows="2"
													placeholder="Description"></textarea>
											</div>
										</div>
									</div>
									<!--/span-->
									
									<div class="row">
									<div class="col-lg-2 col-md-2 col-sm-2">
                                    <button class="btn btn-success btn-sm pull-right collapsed" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Remainder <i class="ti-angle-down"></i></button>
									</div>
									</div>
									<div class="collapse" id="collapseExample"
										aria-expanded="false">
										<div class="row form-material">
											<div class="col-md-6">
												<label class="m-t-20">Reminder Date</label> <input type="text"
												name="supportActivityReminderDate"	class="form-control" placeholder="2017-06-04" id="mdate">

											</div>
											<div class="col-md-6">
												<label class="m-t-20 from-label">Reminder Time</label> <input type="text"
													name="supportActivityReminderTime" class="form-control" placeholder="52:20" id="timepicker">
											</div>
										</div><br>
										<div class="row">
											<div class="col-sm-12">
												<label>Reminder Description</label>
												<div class="form-group">
													<textarea name="supportActivityReminderRemark" rows="4"
														name="inquiryActivityRemainderDescription"
														class="form-control no-resize"
														placeholder="Reminder Description"></textarea>
												</div>
											</div>

										</div>
									</div>
									</div>
								</div>
							
					
						<div class="modal-footer">
							<button type="button" class="btn btn-danger waves-effect"
								data-dismiss="modal">Close</button>
							<button type="submit" 
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
		
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	<!-- </div> -->

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
