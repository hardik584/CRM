<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="headercss.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script type="text/javascript">	
function checkActive()
{
	var element = document.getElementById("product");
	var element1 = document.getElementById("addproduct");
	element.classList.add("active");
	element1.classList.add("active");
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('product','addproduct')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Product</a> 
				<span class="breadcrumb-item active">New Product</span>
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
                                <h4 class="m-b-0 text-white">Add Product</h4>
                            </div>
                            <div class="card-body">
                                <form name="ProductMasterVo" action="<%=request.getContextPath()%>/ProductMasterController?flag=addProduct" method="post">
                                    <div class="form-body">
                                         
                                        <div class="row p-t-20">
                                        
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Category<span style="color: red;">*</span></label>
                                                    <div class="input-group">
                                                    <select name="categoryId" class="form-control custom-select" required="required">
                                                    	<option value="" disabled selected>Select Category</option>
                                                    <c:forEach items="${listCategory}" var="listCategory">
                                                         <option value="${listCategory.categoryId }">${listCategory.categoryName}</option>
                                                     </c:forEach>
                                                    </select>
                                                    <div class="input-group-append">

															  <tr>
																<td colspan="2">
																	<button class="btn btn-success" type="button"
																		tabindex="1"class="fa fa-plus" data-toggle="modal"
																		data-target="#add-category">+</button>
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
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                  	                  <label class="control-label">Product Name<span style="color: red;">*</span> </label>
                                                    <input name="productName" type="text" required="required" id="companyName" class="form-control " placeholder="Product Name">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        
                                        <!--/row-->
                                        <div class="row">
                                        	<div class="col-md-6">
                                                <div class="form-group ">
                                  	                  <label class="control-label">Product Price<span style="color: red;">*</span> </label>
                                                    <input name="productPrice" required="required" type='number' step=".01" pattern='[0-9]+(\\.[0-9][0-9]?)?' id="companyName" class="form-control " placeholder="Product Price">
                                                </div>
                                            </div>
                                         
                                            <div class="col-md-6 nopadding">
                                        		<div class="form-group">
                                        			<label class="control-label">Description</label>
                                            		<div class="input-group">
                                           				 <textarea name="productDesc" rows="3" id="Description" class="form-control " placeholder="Description"></textarea>
		                                             </div>
                                            	</div>
                                        		 
                                   			 </div>
                                   			
                                            
                                        </div>
                                         
                                      </div>
                                        
                                    
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                    </div>
                                </form>
                                </div>
                            </div>
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
    <!-- </div> -->
    <!-- ============================================================== -->
 <div id="add-category" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Add Category</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <form name="CategoryMasterVo" action="<%=request.getContextPath()%>/CategoryMasterController?flag=addCategoryThrowProduct" method="post"  >
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
    <%@ include file="footerjs.jsp" %>
</body>

</html>