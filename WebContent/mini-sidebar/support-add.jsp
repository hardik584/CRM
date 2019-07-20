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
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("support");
	var element1 = document.getElementById("addsupport");
	element.classList.add("active");
	element1.classList.add("active");
}

</script>
<body class="fix-header card-no-border mini-sidebar" onload="getNotify('support','addsupport')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Support</a> 
				<span class="breadcrumb-item active">New Support</span>
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
								<h4 class="m-b-0 text-white">Add Support</h4>
							</div>
							<div class="card-body">
								<form name="SupportMasterVo" method="post" action="<%=request.getContextPath()%>/SupportMasterController">
									
									<div class="form-body">
										<input type="hidden" name="flag" value="addSupportDetail">
										<div class="row p-t-20">

											<!--/span-->
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Support Title<span style="color: red;">*</span></label> <input
														type="text" name="supportName" id="supportName" required="required" class="form-control"
														placeholder="Enter Support Title" tabindex="1">
													<!--  <small class="form-control-feedback"> This is inline help </small> -->
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Customer/Company Name<span style="color: red;">*</span></label>
								
													<select name="customerId" required="required" class="form-control custom-select"
														data-placeholder="Choose a Customer" tabindex="1">
														<option value=""  disabled="disabled" selected="selected">Select Customer</option>
														 <c:forEach items="${listCustomer}" var="listCustomer">
															<option value="${listCustomer.customerId}">${listCustomer.customerName}(${listCustomer.companyName})</option>
														</c:forEach>
 													</select>
												</div>
											</div>
											<!--/span-->
										</div>

										<!-- row -->
										<div class="row">

											<!--/span-->

											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Category<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required"
														data-placeholder="Choose a Category" name="categoryId" id="categoryId" onchange="ajaxProduct()" tabindex="1">
														 <option value="" disabled="disabled" selected="selected">Select Category</option>
														 <c:forEach items="${listCategory}" var="listCategory">
                                                   			 <option value="${listCategory.categoryId}">${listCategory.categoryName }</option>
                                                    	</c:forEach>

													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Product<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required" id="productId" name="productId"
														data-placeholder="Choose a Category" tabindex="1">
														 
														<option value="" disabled="disabled"selected="selected">Select Product</option>
														 
													</select>
												</div>
											</div>
											<!--/span-->
										</div>

									<!--/span-->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Support Status<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required" name="supportStatus"
														data-placeholder="Choose a Category" tabindex="1">
														<option value="" disabled="disabled" selected="selected">Select Status</option>
														<option value="Pending">Pending</option>
														<option value="Solved">Solved</option>
														<option value="Cancel">Cancel</option>

													</select>
												</div>
											</div>
											<div class="col-md-6">
													<div class="form-group">
													<label class="control-label">Support Source<span style="color: red;">*</span></label> <select
														class="form-control custom-select" required="required" name="supportSource"
														data-placeholder="Choose a Category" tabindex="1">
														<option value="" disabled="disabled" selected="selected">Select Support Source</option>
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
										</div>
										<div class="row">
										<div class="col-md-12">
												<div class="form-group">
													<label>Remark</label>
													<textarea name="remark" class="form-control" rows="3"
														placeholder="Description" tabindex="1"></textarea>
												</div>
												</div>

											</div>
										<!--/span-->
 								</div>
									<div class="form-actions">
										<button type="submit" class="btn btn-success" tabindex="1">
											<i class="fa fa-check"></i> Save
										</button>
										<button type="reset" tabindex="1" class="btn btn-inverse">Cancel</button>
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
    <script>

    function ajaxProduct() {
		var xmlhttp;
		var key=String(document.getElementById("categoryId").value);
	 
		var url=String("../SupportMasterController?categoryId="+key+"&flag=listProduct");
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
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

</body>
</html>