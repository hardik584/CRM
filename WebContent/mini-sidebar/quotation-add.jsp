<!DOCTYPE html>
<html lang="en">
 <%@ page language="java" import="java.util.StringTokenizer" %>
  <%@ page language="java" import="java.util.List" %>
  <%@ page language="java" import="com.vo.CustomerMasterVo" %>
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
	var element = document.getElementById("quotation");
	var element1 = document.getElementById("addquotation");
	element.classList.add("active");
	element1.classList.add("active");
}

</script>
<body class="fix-header card-no-border" onload="getNotify('quotation','addquotation')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Quotation</a> 
				<span class="breadcrumb-item active">New Quotation</span>
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
								<h4 class="m-b-0 text-white">Add Quotation</h4>
							</div>
							<div class="card-body">
								<!-- <form action="#">
									<div class="form-body">

										<div class="row p-t-20">
											<div class="col-md-6">
												<div class="form-group">
													<label>Inquiry Name</label> <select
														class="form-control custom-select">
														<option>Select User</option>
														<option>Hardik</option>
														<option>Jay</option>
														<option>RB</option>
													</select>
												</div>
											</div>
											/span
											<div class="col-md-6">
												<div class="form-group">
													<label>Quotation</label> <input type="text"
														id="numberTarget" class="form-control"
														placeholder="Target">
												</div>
											</div>

											/span
										</div>
										/row
										<div class="row form-material">
											<div class="col-md-6">
												<label class="m-t-20">Quotation Date</label> <input type="text"
													class="form-control" placeholder="2017-06-04" id="mdate">

											</div>
											<div class="col-md-6">
												<label class="m-t-20 from-label">Quotation Time</label> <input type="text"
													class="form-control" placeholder="52:20" id="timepicker">
											</div>
										</div>
										<div class="row p-t-20">
											<div class="col-md-6">
												<div class="form-group">
													 
													<label>Description</label> <input type="text"
														id="quotationDesc" class="form-control"
														placeholder="Description ">
												 
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Custom File upload</label>
													<div class="fileinput fileinput-new input-group"
														data-provides="fileinput">
														<div class="form-control" data-trigger="fileinput">
															<i class="fa fa-file fileinput-exists"></i> <span
																class="fileinput-filename"></span>
														</div>
														<span class="input-group-addon btn btn-secondary btn-file">
															<span class="fileinput-new">Select file</span> <span
															class="fileinput-exists">Change</span> <input type="file"
															name="...">
														</span> <a href="#"
															class="input-group-addon btn btn-secondary fileinput-exists"
															data-dismiss="fileinput">Remove</a>
													</div>
												</div>
											</div>
										 
											 

											/span
										</div>
										
							
										
									</div>

									<br>
									<div class="form-actions">
										<button type="submit" class="btn btn-success">
											<i class="fa fa-check"></i> Save
										</button>
										<button type="button" class="btn btn-inverse">Cancel</button>
									</div>

								</form> -->
								<%-- <form action="<%=request.getContextPath() %>/QuotationMasterController" method="post" enctype="multipart/form-data">
								        <table border="0" width="60%" align="center">
								            <caption><h2>Send New E-mail</h2></caption>
								            <tr>
								                <td width="50%">Recipient address </td>
								                <td><input type="text" name="recipient" size="50"/></td>
								            </tr>
								            <tr>
								                <td>Subject </td>
								                <td><input type="text" name="subject" size="50"/></td>
								            </tr>
								            <tr>
								                <td>Content </td>
								                <td><textarea rows="10" cols="39" name="content"></textarea> </td>
								            </tr>
								            <tr>
								                <td>Attach file </td>
								                <td><input type="file" name="file" size="50" /></td>
								            </tr>
								            <tr>
								                <td colspan="2" align="center"><input type="submit" value="Send"/></td>
								            </tr>
								        </table> 
  								  </form> --%>
  								   <h3 class="card-title">Compose New Quotation</h3>
                                    <form action="<%=request.getContextPath() %>/QuotationMasterController"  method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="flag" value="sendEmail">
                                        <input type="hidden" name="userId" value="<%=session.getAttribute("loginId")%>">
                                         
                                            <div class="form-group"> 
                                            <label>To:<span style="color: red;">*</span></label>
                                            <select name='quotationEmail' required="required" class='form-control custom-select'> 
                                            <option value="" disabled selected>Select Email</option>
                                                         
                                                        
                                                        <% 
                                                        String[] email=new String[256];
                                                        HttpSession httpSession=request.getSession();
                                                        List<CustomerMasterVo> listEmail = (List<CustomerMasterVo>)httpSession.getAttribute("listEmail");
                                                        
                                                        for(int i=0;i<listEmail.size();i++)
                                                      	{
                                                      		CustomerMasterVo customerMasterVo= listEmail.get(i);
                                                      		String temp=customerMasterVo.getEmailId();
                                                      		StringTokenizer st1 =   new StringTokenizer(temp, ","); 
                                                            while (st1.hasMoreTokens()) 
                                                            {
                                                                email[i]=st1.nextToken(); 
                                                               
                                                                if(email[i]!=null)
                                                          		{
                                                          			 %><option  value="<%=email[i] %>"><%=email[i] %>  </option><% 
                                                          		}
                                                            	
                                                            } 
                                                      		
                                                      	}
                                                      
                                                      	%>
                                                   		 
                                                    	 
                                              </select></div>           
                                              
                                        <div class="form-group">
                                        	<label>Subject:<span style="color: red;">*</span></label>
                                            <input name="quotationSubject" required="required" class="form-control" placeholder="Enter Subject:">
                                        </div>
                                        <div class="form-group">
                                       		 <label>Content:</label>
                                            <textarea name="quotationContent" class="form-control" rows="8" placeholder="Enter text ..."></textarea>
                                        </div>
                                        <h4><i class="ti-link"></i> Attachment</h4>
                                      
                                            <div class="fallback">
                                                <input name="file" type="file" multiple />
                                            </div>
                                        
                                        <button type="submit" class="btn btn-success m-t-20"><i class="fa fa-envelope-o"></i> Send</button>
                                        <button type="reset"  class="btn btn-inverse m-t-20"><i class="fa fa-times"></i>Reset</button>
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