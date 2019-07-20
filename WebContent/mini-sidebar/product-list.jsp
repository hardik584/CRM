<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="headercss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script type="text/javascript">
		 
		function editProduct(id)
		{
			var productName=document.getElementById("productName"+id).innerHTML;
			var categoryName=document.getElementById("categoryName"+id).innerHTML;
			var categoryId=document.getElementById("categoryId"+id).innerHTML;
			 
			var productPrice=document.getElementById("productPrice"+id).innerHTML;
			var productDesc=document.getElementById("productDesc"+id).innerHTML;
			var userId=document.getElementById("userId"+id).innerHTML;
			 
			/*  var option1="";
			<c:set var="categoryId1" value="" scope="application"></c:set>
			<c:set var="categoryId2" value="'+categoryId+'" scope="page"></c:set>
			
			 
			<c:forEach items="${listCategory}" var="listCategory">
			 
          		<c:if test="${'listCategory.categoryId == categoryId1'}">
	        	 
          			 alert("<option selected value='${listCategory.categoryId }'>${listCategory.categoryName}</option>");
          			 alert("${listCategory.categoryName}");
				</c:if>
				 alert("${listCategory.categoryName}");
				 
	          	<c:if test="${'listCategory.categoryId != categoryId1'}">
	          		option1+="<option value='${listCategory.categoryId }'>${listCategory.categoryName}</option>";
	          	</c:if>
	           
	      	</c:forEach>   */ 
	      	 
			  
			document.getElementById("productName").value=productName;
			/* document.getElementById("categoryId").innerHTML=a; */
			document.getElementById("option1").innerHTML=categoryName;
			document.getElementById("option1").value=categoryId; 
			document.getElementById("productPricee").value=productPrice;
			 
			document.getElementById("productDesc").value=productDesc;
			document.getElementById("productId").value=id;
			document.getElementById("userId").value=userId;
			 
			
			 
			
		}
		function ajaxEdit(id)
		{
			var xmlhttp;
		 	var productId=id
			var urls="../ProductMasterController?flag=editProduct&productId="+productId;
		
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
			
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{	
				var dashboard=xmlhttp.responseXML.documentElement;
				document.getElementById("option1").value=dashboard.getElementsByTagName("categoryId")[0].childNodes[0].nodeValue;
				document.getElementById("productName").value=dashboard.getElementsByTagName("productName")[0].childNodes[0].nodeValue;
				document.getElementById("productPrice").value=dashboard.getElementsByTagName("productPrice")[0].childNodes[0].nodeValue;
				document.getElementById("productDesc").value=dashboard.getElementsByTagName("productDesc")[0].childNodes[0].nodeValue;
				document.getElementById("option1").innerHTML=dashboard.getElementsByTagName("categoryName")[0].childNodes[0].nodeValue;
				//document.getElementById("tblproduct").innerHTML=xmlhttp.responseText;
				/* var some=xmlhttp.responseXML.documentElement;
				document.getElementById("fun").append(some.getElementsByTagName("product")[0].childNodes[0].nodeValue);
				alert("Product.."+some.getElementsByTagName("product")[0].childNodes[0].nodeValue);
				alert("Customer.."+some.getElementsByTagName("customer")[0].childNodes[0].nodeValue);
				alert("inv.."+some.getElementsByTagName("inquiry")[0].childNodes[0].nodeValue); */
					
			}
		}
		xmlhttp.open("GET",urls,true);
		xmlhttp.send();
	} 
</script>
	
<script type="text/javascript">	
function checkActive()
{
	var element = document.getElementById("product");
	var element1 = document.getElementById("listproduct");
	element.classList.add("active");
	element1.classList.add("active");
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('product','listproduct')">
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
				<a class="breadcrumb-item" href="javascript:void(0);">Product</a> 
				<span class="breadcrumb-item active">Product List</span>
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
							data-toggle="modal" data-target="#addProduct"
							class="model_img img-responsive">+Add Product</button>
					</div>
				</div>
				<br>
				<%
					 
					int roleId1= Integer.parseInt(session.getAttribute("loginRoleId").toString());
				%>
				<c:set value="<%=roleId1%>" scope="session" var="roleId"></c:set>

				<c:choose>
				<c:when test="${roleId == 2 || roleId==3}">
			
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h2 class="card-title">Product List</h2>
								 
								<div class="table-responsive m-t-40">
									<table id="example23"
										class="display nowrap table table-hover table-striped table-bordered"
										cellspacing="0" width="100%">
										<thead align="left">
											<tr>

												<th align="center">Sr. No</th>
												<th>Product Name</th>
												<th>Category Name</th>
												<th>Price</th>
												<th>Description</th>
												<th>Action</th>


											</tr>
										</thead>
										<tfoot align="left">
											<tr>

												<th align="center">Sr. No</th>
												<th>Product Name</th>
												<th>Category Name</th>
												<th>Price</th>
												<th>Description</th>
												<th>Action</th>


											</tr>
										</tfoot>
										<tbody align="left">
										<c:set value="1" var="count"></c:set>
										<c:forEach items="${listProduct}" var="listProduct">
											<tr id="tbl${listProduct.productId}">

												<td align="center">${count }</td>
												<td id="productName${listProduct.productId}">${listProduct.productName } </td>
												<td id="categoryName${listProduct.productId}">${listProduct.categoryId.categoryName}</td>
												<td id="productPrice${listProduct.productId}">${listProduct.productPrice }</td>
												<td id="productDesc${listProduct.productId}">${listProduct.productDesc}</td>
												<td class="text-nowrap" align="left"><a  onclick="editProduct(${listProduct.productId})"
													  data-toggle="modal" data-target="#updateProduct"
													data-original-title="Edit"> <i
														class="fa fa-pencil text-inverse m-r-10"></i>
												</a> <a href="<%=request.getContextPath() %>/ProductMasterController?flag=deleteProduct&productId=${listProduct.productId}" data-toggle="tooltip"
													data-original-title="Delete"> <i
														class="mdi mdi-delete text-danger"></i>
												</a></td>
												<td id="categoryId${listProduct.productId}" style="display:none;">${listProduct.categoryId.categoryId}</td>
												<td id="userId${listProduct.productId}" style="display:none;">${listProduct.userId.userId}</td>
												

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
								<h2 class="card-title">Product List</h2>
								 
								<div class="table-responsive m-t-40">
									<table id="example23"
										class="display nowrap table table-hover table-striped table-bordered"
										cellspacing="0" width="100%">
										<thead align="left">
											<tr>

												<th align="center">Sr. No</th>
												<th>Product Name</th>
												<th>Category Name</th>
												<th>Price</th>
												<th>User Name</th>
											 
												<th>Action</th>


											</tr>
										</thead>
										<tfoot align="left">
											<tr>

												<th align="center">Sr. No</th>
												<th>Product Name</th>
												<th>Category Name</th>
												<th>Price</th>
												<th>User Name</th>
										 
												<th>Action</th>


											</tr>
										</tfoot>
										<tbody align="left">
											<c:set value="1" var="count"></c:set>
										<c:forEach items="${listProduct}" var="listProduct">
											<tr>

												<td align="center">${count }</td>
												<td>${listProduct.productName} </td>
												<td>${listProduct.categoryId.categoryName}</td>
												<td>${listProduct.productPrice }</td>
												<td>${listProduct.userId.userName }
											 
												<td class="text-nowrap" align="center"><a  onclick="editProduct(${listProduct.productId})"
													  data-toggle="modal" data-target="#updateProduct"
													data-original-title="Edit"> <i
														class="fa fa-pencil text-inverse m-r-10"></i>
												</a> <a href="<%=request.getContextPath() %>/ProductMasterController?flag=deleteProduct&productId=${listProduct.productId}" data-toggle="tooltip"
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
	<div id="addProduct" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <form name="ProductMasterVo" action="<%=request.getContextPath()%>/ProductMasterController?flag=addProduct" method="post"  >
                    <div class="modal-body">
                     <div class="row p-t-20">
                    <div class="col-md-6">
                        <div class="form-group">
                         
                            <label class="control-label">Category<span style="color: red;">*</span> </label>
                            <select  required="required" name="categoryId" class="form-control custom-select">
                            <option   value="" disabled selected="selected">Select Category</option>
                             
                            	
                            <c:forEach items="${listCategory}" var="listCategory">
                                 <option value="${listCategory.categoryId }">${listCategory.categoryName}</option>
                             </c:forEach>
                            </select>
                            
                         </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                        <div class="form-group ">
          	                  <label class="control-label">Product Name<span style="color: red;">*</span></label>
                            <input name="productName"  required="required" type="text"  class="form-control " placeholder="Product Name">
                        </div>
                    </div>
                    <!--/span-->
                </div>
                <!--/row-->
                
                <!--/row-->
                <div class="row">
                	<div class="col-md-6">
                        <div class="form-group ">
          	                  <label class="control-label">Product Price<span style="color: red;">*</span></label>
                            <input name="productPrice"   required="required" type='number' step=".01" pattern='[0-9]+(\\.[0-9][0-9]?)?'   class="form-control " placeholder="Product Price">
                        </div>
                    </div>
                 
                    <div class="col-md-6 nopadding">
                		<div class="form-group">
                			<label class="control-label">Description</label>
                    		<div class="input-group">
                   				 <textarea name="productDesc" rows="3"  class="form-control " placeholder="Description"></textarea>
                       </div>
                    	</div>
                		 
           			 </div>
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
	<div id="updateProduct" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
       <div class="modal-dialog modal-lg">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title">Edit Product</h4>
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
               </div>
               <form name="ProductMasterVo" action="<%=request.getContextPath()%>/ProductMasterController?flag=updateProduct" method="post"  >
                <input type="hidden" id="userId" name="userId" value="<%=session.getAttribute("loginId") %>" >
          		 		<input type="hidden" id="productId" name="productId" >	
          				<input type="hidden" id="userId" name="userId">
          			   <input type="hidden" id="productId" name="productId" >
          			   <input type="hidden" id="jugad" name="jugad">
               <div class="modal-body">
                  
               <div class="row p-t-20">
               	<div class="col-md-6">
                   <div class="form-group">
                       <label class="control-label">Category<span style="color: red;">*</span></label>
                       <select  required="required" id="categoryId" name="categoryId" class="form-control custom-select">
                        <option   value="" disabled  >Select Category</option>
                        <option id="option1"></option>
                      		<c:forEach items="${listCategory}" var="listCategory">
                                 <option value="${listCategory.categoryId }">${listCategory.categoryName}</option>
                             </c:forEach>
                       </select>
                    </div>
               </div>
               <!--/span-->
               <div class="col-md-6">
                   <div class="form-group ">
     	                  <label class="control-label">Product Name<span style="color: red;">*</span></label>
                       <input name="productName"  required="required" type="text" id="productName" class="form-control " placeholder="Product Name">
                   </div>
               </div>
               <!--/span-->
           </div>
           <!--/row-->
           
           <!--/row-->
           <div class="row">
           	<div class="col-md-6">
                   <div class="form-group ">
     	                  <label class="control-label">Product Price<span style="color: red;">*</span></label>
                       <input name="productPrice" required="required" type='number' step=".01" pattern='[0-9]+(\\.[0-9][0-9]?)?'   id="productPricee" class="form-control " placeholder="Product Price">
                   </div>
               </div>
            
               <div class="col-md-6 nopadding">
           		<div class="form-group">
           			<label class="control-label">Description</label>
               		<div class="input-group">
              				 <textarea name="productDesc" rows="5" id="productDesc" class="form-control " placeholder="Description"></textarea>
                  	</div>
               	</div>
           		 
      			 </div>
      		 </div>
                   
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Close</button>
                   <button type="submit" class="btn btn-success waves-effect waves-light">Edit</button>
               </div>
               </form>
           </div>
       </div>
   </div>
			<%@ include file="footerjs.jsp"%>
	</body>
</html>