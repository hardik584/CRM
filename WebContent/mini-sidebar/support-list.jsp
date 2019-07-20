<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="headercss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("support");
	var element1 = document.getElementById("listsupport");
	element.classList.add("active");
	element1.classList.add("active");
}

</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('support','listsupport')">
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
				<span class="breadcrumb-item active">Support List</span>
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
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h2 class="card-title">Support List</h2>
								<div class="table-responsive m-t-40">
									  <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead align="left">
                                           <tr>
                                        		
                                        	     
                                        		<th>Sr.No</th>
                                        		<th>Support ID</th>
                                        	    <th>Support Title</th>
                                                <th>Customer Name</th>
                                                 <th>Product Name</th>
                                              	<c:if test="${roleId==1}">
												<th>UserName</th>
												</c:if>
                                              
                                                <th>Status</th>
                                                 
                                                <th class="text-nowrap">Action</th>
                                                
                                        </tr>
                                        </thead>
                                        <tfoot align="left">
                                            <tr>
                                            	 
                                        		<th>Sr.No</th>
                                        		<th>Support ID</th>
                                        	    <th>Support Title</th>
                                                <th>Customer Name</th>
                                                  <th>Product Name</th>
                                                <c:if test="${roleId==1}">
												<th>UserName</th>
												</c:if>
                                              
                                              	<th>Status</th>
                                               
                                               <th class="text-nowrap">Action</th>
                                               	 
                                            </tr>
                                        </tfoot>
                                        <tbody align="left">
                                           <c:set value="1" var="count"></c:set>
                                           <c:forEach items="${listSupport}" var="listsupport">
                              				<tr>
                                      
                                            	<td>${count}</td>
                                            	<td><a href="<%=request.getContextPath()%>/SupportMasterController?flag=supportDetail&supportId=${listsupport.supportId}">SUP000${listsupport.supportId}</a></td>
                                             	<td>${listsupport.supportName}</td>
                                             	<td>${listsupport.customerId.customerName}</td>
                                             	   <td>${listsupport.productId.productName}</td>
                                               <c:if test="${roleId==1}">
												<td>${listsupport.userId.userName}</td>
												</c:if>
                                              
                                                 
                                                 <c:if test='${listsupport.supportStatus=="Pending"}'>
                                               	<td> <span class="label label-warning" >${listsupport.supportStatus}</span></td>
											   </c:if>
											   <c:if test='${listsupport.supportStatus=="Solved"}'>
                                               	 <td><span class="label label-success" >${listsupport.supportStatus}</span></td>
                                                </c:if>
											   <c:if test='${listsupport.supportStatus=="Cancle"}'>
                                               	 <td><span class="label label-danger" >${listsupport.supportStatus}</span></td>
                                               
                                               </c:if>
                                                 
                                               
                                              
                                                 <td class="text-nowrap" align="center">
                                                    <a href="<%=request.getContextPath()%>/SupportMasterController?flag=editSupport&supportId=${listsupport.supportId}" data-toggle="tooltip" data-original-title="Edit"> <i class="fa fa-pencil text-inverse m-r-10"></i> </a>
       											     		
                                                    <a href="<%=request.getContextPath()%>/SupportMasterController?flag=deleteSupport&supportId=${listsupport.supportId}" data-toggle="tooltip" data-original-title="Delete"> <i class="mdi mdi-delete text-danger"></i> </a>
                                                </td>
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