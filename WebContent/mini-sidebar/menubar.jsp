<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- User profile -->
                <div class="user-profile">
                    <!-- User profile image -->
                    <div class="profile-img">
                      <c:set var="profileImage" value="${profileImage}"></c:set>
                     <c:if test="${profileImage!=''}"><img src="https://s3-us-west-2.amazonaws.com/elasticbeanstalk-us-west-2-336521938895/CRM/profileImage/${profileImage}" alt="user" height="50" ></c:if>
                      <c:if test="${profileImage==''}"><img src="../assets/images/users/images.png" alt="user"></c:if>
                        <!-- this is blinking heartbit-->
                       <!--  <div class="notify setpos"> <span class="heartbit"></span> <span class="point"></span> </div> -->
                    </div>
                    <!-- User profile text-->
                    <div class="profile-text">
                   		 	 
                          <h5> <%=session.getAttribute("loginName") %> </h5>
                           <h6>(<%=session.getAttribute("loginRole") %>)</h6>
                       
                        <!-- <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><i class="mdi mdi-settings"></i></a> -->
                       
                        <a href="<%=request.getContextPath()%>/UserMasterController?flag=logoutUser" class="" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
                        
                    </div>
                </div>
                <!-- End User profile text-->
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        
                         
              			<li> <a class=" waves-effect waves-dark" href="index.jsp"  aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">Dashboard</span></a>
                            
                        </li>
                        <li > <a id="customer"  class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-account-plus"></i><span class="hide-menu">Customer</span></a>
                            <ul aria-expanded="false" class="collapse" > 
                                <li  ><a id="addCustomer"  href="customer-add.jsp">Add Customer</a></li>
                                <li  ><a id="listCustomer"  href="<%=request.getContextPath()%>/CustomerMasterController?flag=listCustomer">List Customer</a></li>
                            </ul>
                        </li>
                        <li > <a id="inquiry" class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-pencil-box"></i><span class="hide-menu">Inquiry</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a id="addinquiry" href="<%=request.getContextPath()%>/InquiryMasterController?flag=listProductCustomer">Add Inquiry</a></li>
                                <li><a id="listinquiry" href="<%=request.getContextPath()%>/InquiryMasterController?flag=listInquiry">List Inquiry</a></li>
                            </ul>
                        </li>
                        <li > <a id="product" class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-cart"></i><span class="hide-menu">Product</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a id="addproduct" href="<%=request.getContextPath()%>/ProductMasterController?flag=listCategory">Add Product</a></li>
                                <li><a id="listproduct" href="<%=request.getContextPath()%>/ProductMasterController?flag=listProduct">List Product</a></li>
                            </ul>
                        </li>
                        <li > <a id="category" class=" waves-effect waves-dark" href="<%=request.getContextPath()%>/CategoryMasterController?flag=listCategory" aria-expanded="false"><i class="mdi mdi-svg"></i><span class="hide-menu">Category</span></a>
                            
                        </li>
                        
                        <li > <a id="quotation" class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-file-document-box"></i><span class="hide-menu">Quotation</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a id="addquotation" href="<%=request.getContextPath()%>/QuotationMasterController?flag=listEmail">Add Quotation</a></li>
                                <li><a id="listquotation" href="<%=request.getContextPath()%>/QuotationMasterController?flag=listQuotation">List Quotation</a></li>
                            </ul>
                        </li>
                        <%int roleId = Integer.parseInt(session.getAttribute("loginRoleId").toString());
						%>
						<c:set value="<%=roleId%>" scope="session" var="roleId"></c:set>

						<c:choose>
						<c:when test="${roleId == 2 || roleId == 3}">
                          <li > <a id="target" class=" waves-effect waves-dark" href="<%=request.getContextPath()%>/TargetMasterController?flag=listTargetUser" aria-expanded="false"><i class="mdi  mdi-bullseye"></i><span class="hide-menu">Target</span></a>
                            
                        </li>
                        </c:when>
                        <c:when test="${roleId == 1}">
                         <li > <a id="target" class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-bullseye"></i><span class="hide-menu">Target </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a id="addtarget" href="<%=request.getContextPath()%>/TargetMasterController?flag=listUser">Add Target</a></li>
                                <li><a id="listtarget" href="<%=request.getContextPath()%>/TargetMasterController?flag=listTarget">List Target</a></li>
                            </ul>
                        </li>
                        </c:when>
                        </c:choose>
                        <li > <a id="support" class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-run"></i><span class="hide-menu">Support </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a id="addsupport"  href="<%=request.getContextPath()%>/SupportMasterController?flag=AddSupportCustomer">Add Support</a></li>
                               <li><a id="listsupport" href="<%= request.getContextPath()%>/SupportMasterController?flag=listSupport">List Support</a></li>
                            </ul>
                        </li>
                         
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
</body>
</html>