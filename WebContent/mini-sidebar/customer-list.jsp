<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="headercss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <%@ page language="java" import="java.util.StringTokenizer" %>
  <%@ page language="java" import="java.util.List" %>
  <%@ page language="java" import="com.vo.CustomerMasterVo" %>
</head>
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("listCustomer");
	var element1 = document.getElementById("customer");
	
	element.classList.add("active");
	element1.classList.add("active");
	
}
</script>
<body class="fix-header fix-sidebar card-no-border"  onload="getNotify('customer','listCustomer')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Customer</a> 
				<span class="breadcrumb-item active">Customer List</span>
			</nav><br>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
			<div class="row">
					<!-- <div class="col-lg-10"></div> -->
					<div class="col-lg-2">
						<button align="right" type="button" class="btn btn-success"
							data-toggle="modal" data-target="#add-contact"
							class="model_img img-responsive">+Add Customer</button>
					</div>
				</div><br>
				<%
					 
					int roleId1 = Integer.parseInt(session.getAttribute("loginRoleId").toString());
				%>
				<c:set value="<%=roleId1%>" scope="session" var="roleId"></c:set>

				<c:choose>
				<c:when test="${roleId == 2 || roleId == 3}">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								 <h4 class="card-title">Customer List</h4>
								<div class="table-responsive m-t-40">
									<table id="example23"
										class="display nowrap table table-hover table-striped table-bordered"
										cellspacing="0" width="100%">
										 
										<thead align="left">
											<tr>
												
												<th align="center">Sr. No</th>
												<th>Customer Name(Company Name)</th>
												<th>Email</th>
												<th>Contact</th>
												<th>Address</th>
												<th>Action</th>

											</tr>
										</thead>
										<tfoot align="left">
											<tr>
												
												<th align="center">Sr. No</th>
												<th>Customer Name(Company Name)</th>
												<th>Email</th>
												<th>Contact</th>
												<th>Address</th>
												<th>Action</th>


											</tr>
										</tfoot>
										
										<tbody align="left">
										<c:set value="1" var="count"></c:set>
										<c:forEach items="${listCustomer}" var="userCustomer" >
											<tr>
												
												<td align="center">${count}</td>
												<td><a href="<%=request.getContextPath()%>/CustomerMasterController?flag=profileCustomer&customerId=${userCustomer.customerId}">${userCustomer.customerName}<c:if test="${userCustomer.companyName!='' }">(${userCustomer.companyName })</c:if></a></td>
												 
												<td>
												 
												<c:set var="emailIdCust" value="${userCustomer.emailId.toString()}"></c:set>
												<c:set var="emailsplit" value="${fn:split(emailIdCust,',')}" />
    											<c:forEach items="${emailsplit }" var="emailId">
    												${emailId} <br>
    											</c:forEach>
    											
    											<%--  <c:set var="emailName" value="${fn:join(emailsplit,' ')}" />
    												 <c:forTokens items="${emailName}" delims=" " var="emailId"> 
														${emailId} <br> 
													</c:forTokens>  --%>
												 </td>
												
												<td>
											 	<c:set var="mobileNumberCust" value="${userCustomer.mobileNumber }"></c:set>
												<c:set var="mobilesplit" value="${fn:split(mobileNumberCust,',')}" />
    											 <c:forEach items="${mobilesplit }" var="mobile">
    												${mobile} <br>
    											</c:forEach>
												</td>
												
												<td>${userCustomer.address} </td>
												 
												<td class="text-nowrap" align="center"><a
													href="<%=request.getContextPath() %>/CustomerMasterController?flag=editCustomer&customerId=${userCustomer.customerId}" data-toggle="tooltip"
													data-original-title="Edit"> <i
														class="fa fa-pencil text-inverse m-r-10"></i>
												</a> <a href="<%=request.getContextPath() %>/CustomerMasterController?flag=deleteCustomer&customerId=${userCustomer.customerId}" data-toggle="tooltip"
													data-original-title="Delete"> <i
														class="mdi mdi-delete text-danger"></i>
												</a></td>


											</tr>
											<c:set value="${count+1}" var="count"></c:set>
										</c:forEach>
											
											 

										</tbody>
									</table>

								</div>
							</div>
						</div>


					</div>
				 
					<footer class="footer"> CRM © Admin by anonymous :) </footer>
			 
				</div>
				</c:when>
				<c:when test="${roleId == 1}">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								 <h4 class="card-title">Customer List</h4>
								<div class="table-responsive m-t-40">
									<table id="example23"
										class="display nowrap table table-hover table-striped table-bordered"
										cellspacing="0" width="100%">
										 
										<thead align="left">
											<tr>
												
												<th align="center">Sr. No</th>
												<th>Customer Name</th>
												<th>Company Name</th>
												<th>Contact</th>
											 	<th>User Name</th>
												<th>Action</th>

											</tr>
										</thead>
										<tfoot align="left">
											<tr>
												
												<th align="center">Sr. No</th>
												<th>Customer Name</th>
												<th>Company Name</th>
												<th>Contact</th>
												<th>User Name</th>
												<th>Action</th>


											</tr>
										</tfoot>
										
										<tbody align="left">
										<c:set value="1" var="count"></c:set>
										<c:forEach items="${listCustomer}" var="userCustomer">
											<tr>
												
												<td align="center">${count}</td>
												<td><a href="<%=request.getContextPath()%>/CustomerMasterController?flag=profileCustomer&customerId=${userCustomer.customerId}">${userCustomer.customerName}</a></td>
												<td>${userCustomer.companyName }</td>
										 
												<td>
											 	<c:set var="mobileNumberCust" value="${userCustomer.mobileNumber }"></c:set>
												<c:set var="mobilesplit" value="${fn:split(mobileNumberCust,',')}" />
    											 <c:forEach items="${mobilesplit }" var="mobile">
    												${mobile} <br>
    											</c:forEach>
												</td>
										 		<td>${userCustomer.userId.userName }
												 
												<td class="text-nowrap" align="center"><a
													href="<%=request.getContextPath() %>/CustomerMasterController?flag=editCustomer&customerId=${userCustomer.customerId}" data-toggle="tooltip"
													data-original-title="Edit"> <i
														class="fa fa-pencil text-inverse m-r-10"></i>
												</a> <a href="<%=request.getContextPath() %>/CustomerMasterController?flag=deleteCustomer&customerId=${userCustomer.customerId}" data-toggle="tooltip"
													data-original-title="Delete"> <i
														class="mdi mdi-delete text-danger"></i>
												</a></td>


											</tr>
											<c:set value="${count+1}" var="count"></c:set>
										</c:forEach>
											
											 

										</tbody>
									</table>

								</div>
							</div>
						</div>


					</div>
				 
					<footer class="footer"> CRM © Admin by anonymous :) </footer>
			 
				</div>
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
			<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	

    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
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
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <script src="../assets/plugins/dff/dff.js" type="text/javascript"></script>
    <!-- ============================================================== -->
   <!--  <script src="../assets/plugins/session-timeout/jquery.sessionTimeout.min.js"></script>
    <script src="../assets/plugins/session-timeout/session-timeout-init.js"></script> -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!--sparkline JavaScript -->
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--morris JavaScript -->
    <script src="../assets/plugins/raphael/raphael-min.js"></script>
   <!-- <script src="../assets/plugins/morrisjs/morris.min.js"></script> -->
    
 
    <!-- ============================================================== -->
    <!-- Footable -->
    <script src="../assets/plugins/footable/js/footable.all.min.js"></script>
    <script src="../assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <!--FooTable init-->
    <script src="js/footable-init.js"></script>
    <!-- ============================================================== -->
     
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
<script src="../assets/plugins/datatables/jquery.dataTables.min.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="js/dataTables.buttons.min.js"></script>
	<script
		src="js/buttons.flash.min.js"></script>
	<script
		src="js/jszip.min.js"></script>
	<script
		src="js/pdfmake.min.js"></script>
	<script
		src="js/vfs_fonts.js"></script>
	<script
		src="js/buttons.html5.min.js"></script>
	<script
		src="js/buttons.print.min.js"></script>
		
	<!-- end - This is for export functionality only -->
	<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
        $(document).ready(function() {
            var table = $('#example').DataTable({
                "columnDefs": [{
                    "visible": false,
                    "targets": 2
                }],
                "order": [
                    [2, 'asc']
                ],
                "displayLength": 25,
                "drawCallback": function(settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;
                    api.column(2, {
                        page: 'current'
                    }).data().each(function(group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                            last = group;
                        }
                    });
                }
            });
            // Order by the grouping
            $('#example tbody').on('click', 'tr.group', function() {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                    table.order([2, 'desc']).draw();
                } else {
                    table.order([2, 'asc']).draw();
                }
            });
        });
    });
    $('#example23').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
    </script>
   
			<!-- This is data table -->
			 
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
                                        <input type="hidden" name="flag" value="addCustomer">
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