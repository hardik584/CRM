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
	element.classList.add("active");
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('product','')">
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
				<span class="breadcrumb-item active">Edit Product</span>
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
                                <h4 class="m-b-0 text-white">Edit Product</h4>
                            </div>
                            <div class="card-body">
                                <form name="ProductMasterVo" action="<%=request.getContextPath() %>/ProductMasterController?flag=updateProduct" method="post" >
                                <c:forEach items="${editProduct}" var="editProduct"> 
                                    <div class="form-body">
                                    
                                        <input type="hidden" name="userId" value="${editProduct.userId.userId}">
                                        <input type="hidden" name="productId" value="${editProduct.productId }">
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Category</label>
                                                    <select name="categoryId" class="form-control custom-select">
                                                    <c:forEach items="${listCategory}" var="listCategory">
                                                    <c:if test="${listCategory.categoryId == editProduct.categoryId.categoryId }">
                                                        <option selected="selected" value="${editProduct.categoryId.categoryId }">${editProduct.categoryId.categoryName } </option>
                                                     </c:if>
                                                     <c:if test="${listCategory.categoryId != editProduct.categoryId.categoryId }">
                                                     <option value="${listCategory.categoryId }">${listCategory.categoryName } </option>
                                                     </c:if>
                                                     </c:forEach>   
                                                    </select>
                                                 </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                  	                  <label class="control-label">Product Name</label>
                                                    <input name="productName" type="text" id="companyName" class="form-control" value="${editProduct.productName}" placeholder="Product Name">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        
                                        <!--/row-->
                                        <div class="row">
                                        
                                         
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                  	                  <label class="control-label">Product Price</label>
                                                    <input name="productPrice" type="text" id="companyName" class="form-control" value="${editProduct.productPrice}" placeholder="Product Price">
                                                </div>
                                            </div>
                                         
                                            <div class="col-md-6 nopadding">
                                        		<div class="form-group">
                                        			<label class="control-label">Description</label>
                                            		<div class="input-group">
                                           				 <textarea name="productDesc" rows="5" id="Description" class="form-control"   placeholder="Description">${editProduct.productDesc }</textarea>
		                                             </div>
                                            	</div>
                                        		 
                                   			 </div>
                                   			
                                   			
                                            
                                        </div>
                                         
                                      </div>
                                        
                                    
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Edit</button>
                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                    </div>
                                   </c:forEach>
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
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <%@ include file="footerjs.jsp" %>
</body>

</html>