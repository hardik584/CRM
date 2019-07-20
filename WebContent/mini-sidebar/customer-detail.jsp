<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/crm.png">
    <title>CRM Customer Details</title>
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
	var element = document.getElementById("customer");
	element.classList.add("active");
 
}
</script>
<body class="fix-header fix-sidebar card-no-border" onload="getNotify('customer','')">
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
				<span class="breadcrumb-item active">Customer Detail</span>
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
                <!-- Row -->
                
                <!-- Row -->
                
                <!-- Row -->
                <!-- Row -->
                
                <!-- Row -->
                
                <!-- Row -->
                
                <!-- Row -->
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    
                    <div class="col-lg-12 col-xlg-12">
                        <!-- Column -->
                        <div class="card">
                         <div class="card-body bg-inverse" style="background: url(../assets/images/users/images.png) / cover;">
                                <h4 class="text-white card-title">Customer Detail</h4>
                                <!-- <h6 class="card-subtitle text-white m-0 op-5">Checkout employee list here</h6> -->
                            </div>
                            <c:set value="1" var="count"></c:set>
							<c:forEach items="${profileCustomer}" var="profileCustomer">
                            <div class="card-body little-profile text-center">
                                <div class="pro-img"><img src="../assets/images/users/images.png" alt="user" /></div>
                                <h3 class="m-b-0">${profileCustomer.customerName}</h3>
                                <h2 class="m-b-0">${profileCustomer.designation}</h2>
                                <p>${profileCustomer.companyName}</p>
                                <a href="<%=request.getContextPath()%>/CustomerMasterController?flag=listCustomer">
                                <button href="customer-list.jsp" class="m-t-10 waves-effect waves-dark btn btn-info btn-md btn-rounded">Customer List</button></a>
                                <div class="row text-center m-t-20">
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                       				 <% 	
                                        				String[] email=new String[4];
		                                                int count=0;
		                                                int in=20;
                                                        HttpSession httpSession=request.getSession();
                                                        List<CustomerMasterVo> listEmail = (List<CustomerMasterVo>)httpSession.getAttribute("profileCustomer");
                                                        
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
                                                          			 %>  
                                                          			  <%=email[i] %><br>
                                                          			 <% 
                                                          		}
                                                            }
                                                            }
                                                        %>
										<small>Email</small></div>
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light"> 
                                        	 <% 	
                                        	 String[] contact=new String[4];
                                             int count1=0;
                                             int in1=20;
                                             List<CustomerMasterVo> listContact= (List<CustomerMasterVo>)httpSession.getAttribute("profileCustomer");
                                                        
                                             for(int i=0;i<listContact.size();i++)
                                           	{
                                           		CustomerMasterVo customerMasterVo= listContact.get(i);
                                           		String temp=customerMasterVo.getMobileNumber();
                                           		StringTokenizer st1 =   new StringTokenizer(temp, ","); 
                                                 while (st1.hasMoreTokens()) 
                                                 {
                                                     contact[i]=st1.nextToken(); 
                                                      
                                                         if(contact[i]!=null)
                                                   		{
                                                        			 %>  
                                                          			  <%=contact[i] %><br>
                                                          			 <% 
                                                        }
                                                    }
                                           		} %>
                                              </h3><small>Contact</small></div>
                                               <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.address}</h3><small>Address</small></div>
                                   
                                </div>
                                <div class="row text-center m-t-20">
                                <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.pincode}</h3><small>Pin Code</small></div>
                                      <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.cityId.cityName}</h3><small>City</small></div>
                                      <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.stateId.stateName}</h3><small>State</small></div>
                                        
                                </div>
                                <div class="row text-center m-t-20">
                                <c:if test="${ profileCustomer.gstNo!=''}">
                                 <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.gstNo}</h3><small>GSTIN</small></div>
                                </c:if>
                                  <c:if test="${profileCustomer.telephone!=''}">
                                  <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">${profileCustomer.telephone}</h3><small>Telephone</small></div>
                                   </c:if>
                                    
                                     
                                </div>
                                 
                            </div>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-5"></div>
									<div class="col-md-3">
										<div class="row">
											<div class="col-md-offset-3 col-md-9">
											<a href="<%=request.getContextPath() %>/CustomerMasterController?flag=editCustomer&customerId=${profileCustomer.customerId}"> 
												<button type="submit" class="btn btn-info">
													<i class="fa fa-pencil"></i>Edit
												</button>
											</a>
											 <a href="<%=request.getContextPath()%>/CustomerMasterController?flag=listCustomer">
												<button type="button" class="btn btn-inverse">Cancel</button></a>
											</div>
										</div>
									</div>
									<div class="col-md-4"></div>
								</div>
								
							</div><br>
							<c:set value="${count+1}" var="count"></c:set>
							</c:forEach>
						</div>
                        <!-- Column -->
                        
                    </div>
                </div>
                <!-- <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Customer Detail</h4>
                            </div>
                            <div class="card-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-body">
                                        <h3 class="box-title">Customer Info</h3>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Customer Name:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> John </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Company Name:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Amazon Inc. </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                        </div>
                                        /row
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Gender:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Male </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Date of Birth:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> 11/06/1987 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                        </div>
                                        /row
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Category:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Category1 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Membership:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Free </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                        </div>
                                        /row
                                        <h3 class="box-title">Address</h3>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Address:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> E104, Dharti-2, Near silverstar mall </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">City:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Bhavnagar </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">State:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> Gujarat </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                        </div>
                                        /row
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Post Code:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> 457890 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-4">Country:</label>
                                                    <div class="col-md-8">
                                                        <p class="form-control-static"> India </p>
                                                    </div>
                                                </div>
                                            </div>
                                            /span
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-info"> <i class="fa fa-pencil"></i> Edit</button>
                                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"> </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div> -->
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
            <footer class="footer">  CRM © Admin by anonymous :) </footer>
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
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!--sparkline JavaScript -->
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--morris JavaScript -->
    <script src="../assets/plugins/raphael/raphael-min.js"></script>
    <script src="../assets/plugins/morrisjs/morris.min.js"></script>
    <!-- Chart JS -->
    <script src="js/dashboard1.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>