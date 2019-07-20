<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>CRM System</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--   <link href="../assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    Page plugins css
    <link href="../assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    Color picker plugins css
    <link href="../assets/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet"> --> 
     
    <link href="../assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
   
     
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
function abc()
	{
	alert("dd");
	var fromDate=document.getElementById("mdate").value;
	var toDate=document.getElementById("mdate1").value;
	
	alert(fromDate);
	alert(toDate);
	}
 
  
 function checkActive()
 {
 	var element = document.getElementById("target");
 	var element1 = document.getElementById("addtarget");
 	element.classList.add("active");
 	element1.classList.add("active");
 }

 </script>
  
<body class="fix-header card-no-border" onload="getNotify('target','addtarget')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Target</a> 
				<span class="breadcrumb-item active">New Target</span>
			</nav><br>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline-info">
							<div class="card-header">
								<h4 class="m-b-0 text-white">Add Target</h4>
							</div>
							<div class="card-body">
								<form name="TargetMasterVo" method="post" action="<%=request.getContextPath()%>/TargetMasterController?flag=addTarget">
									<div class="form-body">

										<div class="row p-t-20">
											<div class="col-md-6">
												<div class="form-group">
													<label>User Name</label> <select name="userId"
														class="form-control custom-select">
														<option value="" disabled selected>Select User</option>
														<c:forEach items="${ listUser}" var="listUser">
														<option value="${listUser.userId}">${listUser.userName}(${listUser.roleId.roleName})</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<div class="form-group">
													<label>No of Target</label> <input type="text"
														id="numberTarget" name="targetsize" class="form-control"
														placeholder="Target">
												</div>
											</div>

											<!--/span-->
										</div>
										<!--/row-->
										<!-- <div class="row form-material">
											<div class="col-md-6">
												<label class="m-t-20">From Date</label> <input name="targetFormDate" type="text"
													class="form-control" placeholder="2017-06-04" id="mdate">

											</div>
											<div class="col-md-6">
												<label class="m-t-20">To Date</label> <input type="text" onkeyup="abc()" onchange="abc()" name="targetToDate"
													class="form-control" placeholder="2017-06-04" id="mdate1">
											</div>
										</div> -->
										<div class="row form-material">
											<div class="col-md-6">
												<label class="m-t-20">From Date</label>  

											</div>
											<div class="col-md-6">
												<label class="m-t-20">To Date</label>  
											</div>
										</div>
										<div class="example">
                                            
                                            <div class="input-daterange input-group" id="date-range" data-date-format="yyyy-mm-dd">
                                            	 
                                                <input type="text" class="form-control" name="targetFromDate" placeholder="Choose From Date" data-date-format="yyyy-mm-dd">
                                                <div class="input-group-append">
                                                    <span class="input-group-text bg-info b-0 text-white">-</span>
                                                </div>
                                                 
                                                <input type="text" class="form-control" name="targetToDate" placeholder="Choose To Date" data-date-format="yyyy-mm-dd">
                                            </div>
                                        </div>
									</div>

									<br>
									<div class="form-actions">
										<button type="submit" class="btn btn-success">
											<i class="fa fa-check"></i> Save
										</button>
										<button type="button" class="btn btn-inverse">Cancel</button>
									</div>

								</form>
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
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer"> CRM © Admin by anonymous :)  </footer>
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
    <!-- Plugins for this page -->
    <!-- ============================================================== -->
    <!-- Plugin JavaScript -->
    <script src="../assets/plugins/moment/moment.js"></script>
    <!-- <script src="../assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    Clock Plugin JavaScript
    <script src="../assets/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    Color Picker Plugin JavaScript
    <script src="../assets/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="../assets/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="../assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script> -->
    Date Picker Plugin JavaScript
    <script src="../assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    Date range Plugin JavaScript
    <script src="../assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="../assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script>
    /* // MAterial Date picker    
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
 */    /* // Colorpicker
    $(".colorpicker").asColorPicker();
    $(".complex-colorpicker").asColorPicker({
        mode: 'complex'
    });
    $(".gradient-colorpicker").asColorPicker({
        mode: 'gradient'
    });*/
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
        format: 'YYYY-MM-DD h:mm A',
        timePickerIncrement: 30,
        timePicker12Hour: true,
        timePickerSeconds: false,
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse'
    });
    $('.input-limit-datepicker').daterangepicker({
        format: 'YYYY-MM-DD',
        minDate: '2015-06-01',
        maxDate: '2015-06-01',
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