<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="headercss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("target");
	 
	element.classList.add("active");
	 
}

</script>
<body class="fix-header fix-sidebar card-no-border"  onload="getNotify('target','')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Target</a> 
				<span class="breadcrumb-item active">Target List</span>
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

				<c:choose>
				<c:when test="${roleId == 2 || roleId==3}">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Target List</h4>
								<div class="table-responsive m-t-40">
									  <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead align="center">
                                            <tr>
                                            	
                                            	<th>Sr. No</th>
                                                <th>Target Size</th>
                                                <th>From Date</th>
                                                <th>To Date</th>
                                                 
                                                
                                                
                                             </tr>
                                        </thead>
                                        <tfoot  align="center">
                                            <tr>
                                            	
                                            	<th>Sr. No</th>
                                                <th>Target Size</th>
                                                <th>From Date</th>
                                                <th>To Date</th>
                                                 
                                                 
                                               	 
                                            </tr>
                                        </tfoot>
                                        <tbody  align="center">
                                        <c:set value="1" var="count"></c:set>
                                        <c:forEach items="${listTarget}" var="listTarget">
                                            <tr>
                                            	 
                                             	<td>${count}</td>
                                                 
                                                <td>${listTarget.targetsize }</td>
                                                <td>${listTarget.targetFromDate }</td>
                                                <td>${listTarget.targetToDate }</td>
                                                
                                                
                                                 
                                            </tr>
                                            <c:set value="${count+1}" var="count"></c:set>
                                            </c:forEach>
                                          
                                             
                                        </tbody>
                                    </table>
									
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
					<footer class="footer"> CRM © Admin by anonymous :) </footer>
					<!-- ============================================================== -->
					<!-- End footer -->
					<!-- ============================================================== -->
				</div>
				<!-- ============================================================== -->
				<!-- End Page wrapper  -->
				<!-- ============================================================== -->
				
				</c:when>
				<c:when test="${roleId == 1}">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Target List</h4>
								<div class="table-responsive m-t-40">
									  <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead align="center">
                                            <tr>
                                            	
                                            	<th>Sr. No</th>
                                            	<th>User Name</th>
                                                <th>Target Size</th>
                                                <th>From Date</th>
                                                <th>To Date</th>
                                                <th>Role</th>
                                             
                                                <th>Action</th>
                                                
                                                
                                             </tr>
                                        </thead>
                                        <tfoot  align="center">
                                            <tr>
                                            	
                                            	<th>Sr. No</th>
                                                <th>User Name</th>
                                                <th>Target Size</th>
                                                <th>From Date</th>
                                                <th>To Date</th>
                                                <th>Role</th>
                                              
                                                <th>Action</th>
                                                 
                                               	 
                                            </tr>
                                        </tfoot>
                                        <tbody  align="center">
                                        <c:set value="1" var="count"></c:set>
                                        <c:forEach items="${listTarget}" var="listTarget">
                                            <tr>
                                            	 
                                             	<td>${count}</td>
                                                <td>${listTarget.userId.userName} </td>
                                                <td>${listTarget.targetsize }</td>
                                                <td>${listTarget.targetFromDate }</td>
                                                <td>${listTarget.targetToDate }</td>
                                                <c:if test="${listTarget.userId.roleId.roleId==2 }">
                                                <td ><span class="label label-info">${listTarget.userId.roleId.roleName}</span></td>
                                                </c:if>
                                                <c:if test="${listTarget.userId.roleId.roleId==3 }">
                                                <td><span class="label label-warning">${listTarget.userId.roleId.roleName}</span></td>
                                                </c:if>
                                                
                                                <td class="text-nowrap" align="center">
                                                    <a href="target-edit.jsp" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
                                                    <a href="#" data-toggle="tooltip" data-original-title="Delete"> <i class="mdi mdi-delete text-danger"></i> </a>
                                                </td>
                                                
                                                 
                                            </tr>
                                            <c:set value="${count+1 }" var="count"></c:set>
                                            </c:forEach>
                                           
                                        </tbody>
                                    </table>
									
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
					<footer class="footer"> CRM © Admin by anonymous :) </footer>
					<!-- ============================================================== -->
					<!-- End footer -->
					<!-- ============================================================== -->
				</div>
				<!-- ============================================================== -->
				<!-- End Page wrapper  -->
				<!-- ============================================================== -->
				
				</c:when>
				</c:choose>
			</div>
			</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Wrapper -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- All Jquery -->
			<!-- ============================================================== -->
			<%@ include file="footerjs.jsp"%>
			<!-- This is data table -->
	
			
</body>

</html>