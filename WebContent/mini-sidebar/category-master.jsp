<!DOCTYPE html>
<%@page import="org.apache.http.protocol.HTTP"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/crm.png">
    <title>CRM Category Master</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
<script type="text/javascript">
	 
function checkActive()
{
	var element = document.getElementById("category");
	element.classList.add("active");
}
</script>

</head>

<body class="fix-header card-no-border" onload="getNotify('category','')">
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
          	<nav class="breadcrumb  ">
				<a class="breadcrumb-item" href="index.jsp"><i class="mdi mdi-home"></i>Home</a>  
				<span class="breadcrumb-item active">Category Master</span>
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


				<div class="row">
					<!-- <div class="col-lg-10"></div> -->
					<div class="col-lg-2">
						<button align="left" type="button" class="btn btn-success"
							data-toggle="modal" data-target="#add-category"
							class="model_img img-responsive">+Add Category</button>
					</div>
				</div><br>
				 



				<%
					 
					int roleId1 = Integer.parseInt(session.getAttribute("loginRoleId").toString());
				%>
				<c:set value="<%=roleId1%>" scope="session" var="roleId"></c:set>

				<c:choose>
					<c:when test="${roleId == 2 || roleId==3}">

						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Category List</h4>


										<div class="table-responsive">
											<table class="table color-table info-table">
												<thead align="left">
													<tr>
														<th>Sr.No</th>
														<th>Category Name</th>
														<th>Action</th>

													</tr>
												</thead>
												<tbody align="left">
													<c:set value="1" var="count"></c:set>
													<c:forEach items="${listCategory}" var="listCategory">
														<tr>
															<td  >${count}</td>
															<td>${listCategory.categoryName}</td>
															<td><a
																href="<%=request.getContextPath() %>/CategoryMasterController?flag=deleteCategory&categoryId=${listCategory.categoryId}"><button
																		type="button" class="btn btn-danger"
																		aria-haspopup="true">
																		<i class="ti-trash"></i>
																	</button></a></td>


														</tr>
														<c:set value="${count+1}" var="count"></c:set>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:when>
					<c:when test="${roleId == 1}">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Category List</h4>

										<div class="table-responsive">
											<table class="table color-table info-table">
												<thead align="left">
													<tr>
														<th align="center">Sr.No</th>
														<th>Category Name</th>
														<th>User Name</th>
														<th>Action</th>

													</tr>
												</thead>
												<tbody align="left">
													<c:set value="1" var="count"></c:set>
													<c:forEach items="${listCategory}" var="listCategory">
														<tr>
															<td >${count}</td>
															<td>${listCategory.categoryName}</td>
															<td>${listCategory.userId.userName }</td>
															<td><a
																href="<%=request.getContextPath() %>/CategoryMasterController?flag=deleteCategory&categoryId=${listCategory.categoryId}"><button
																		type="button" class="btn btn-danger"
																		aria-haspopup="true">
																		<i class="ti-trash"></i>
																	</button></a></td>


														</tr>
														<c:set value="${count+1}" var="count"></c:set>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:when>
				</c:choose>



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

			<div id="add-category" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Add Category</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <form name="CategoryMasterVo" action="<%=request.getContextPath()%>/CategoryMasterController?flag=addCategory" method="post"  >
                                            <div class="modal-body">
                                               
                                                    <div class="form-group">
                                                        <label for="CategoryName" class="control-label">Category Name<span style="color: red;">*</span></label>
                                                        <input name="categoryName" required="required" type="text" class="form-control" id="categoryName" placeholder="Enter Category Name">
                                                    </div>
                                                     
                                                
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-success waves-effect waves-light">Save</button>
                                            </div>
                                            </form>
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
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
