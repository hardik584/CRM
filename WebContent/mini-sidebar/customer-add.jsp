<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="headercss.jsp" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
</head>
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("customer");
	var element1 = document.getElementById("addCustomer");
	
	element.classList.add("active");
	element1.classList.add("active");
	
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('customer','addCustomer')" >
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
				<a class="breadcrumb-item" href="javascript:void(0);">Customer</a> 
				<span class="breadcrumb-item active">New Customer</span>
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
                                <h4 class="m-b-0 text-white">Add Customer</h4>
                            </div>
                            <div class="card-body">
                                <form  id="CustomerMasterVo"name="CustomerMasterVo" action="<%=request.getContextPath()%>/CustomerMasterController" method="post">
                                    <div class="form-body">
                                        <input type="hidden" name="flag" value="addCustomer">
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Customer Name<span style="color: red;">*</span></label>
                                                    <input name="customerName" required="required" type="text" id="customerName" class="form-control" placeholder="Customer Name">
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
                                           				 <input name="mobileNumber"  type="text" maxlength="10" pattern="[0-9]{10}" id="Contact"  required class="form-control " placeholder="Contact" >
		                                               
		                                               <div class="input-group-append">
		                                               		<button class="btn btn-success" type="button" onclick="customer_contact();"><i class="fa fa-plus"></i></button>
		                                               </div>
		                                                
                                            		</div>
                                            			<span id="message"></span>
                                            		
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
                                                    <textarea required="required" name="address"  class="form-control" rows="3" placeholder="Address"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State<span style="color: red;">*</span></label>
                                                     <select required="required" name="stateId" id="stateId" onchange="ajax()" class="form-control custom-select">
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
                                                    <input name="pincode" required="required" maxlength="6" pattern="[0-9]{6}" type="text" class="form-control"  placeholder="Pin Code"> 
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">GST No</label>
                                                     <input name="gstNo" type="text" id="gstNo" maxlength="15" pattern="[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}" class="form-control " placeholder="GST No">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>
                                    
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
                                        <button type="button" onclick="formReset()" class="btn btn-inverse">Reset</button>
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
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    	<script>
	   			function ajax() {
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

	   		function formReset() 
	   		{
	   			document.getElementById("CustomerMasterVo").reset();
	   		}
	    </script>
    
    <%@ include file="footerjs.jsp" %>
</body>

</html>