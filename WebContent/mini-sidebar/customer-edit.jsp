<!DOCTYPE html>
<html lang="en">
 <%@ page language="java" import="java.util.StringTokenizer" %>
  <%@ page language="java" import="java.util.List" %>
  <%@ page language="java" import="com.vo.CustomerMasterVo" %>
<head>
    <%@ include file="headercss.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <link href="../assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
function checkActive()
{
	var element = document.getElementById("customer");
	element.classList.add("active");
 
}
</script>
<body class="fix-header fix-sidebar card-no-border"  onload="getNotify('customer','')">
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
				<span class="breadcrumb-item active">Edit Customer</span>
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
                                <h4 class="m-b-0 text-white">Edit Customer</h4>
                            </div>
                            <div class="card-body">
                                <form action="<%=request.getContextPath() %>/CustomerMasterController" name="CustomerMasterVo" method="post">
                                <c:forEach items="${editCustomer}" var="editCustomer"> 
                                    <div class="form-body">
                                        
										<input type="hidden" name="customerId" value="${editCustomer.customerId}">
										<input type="hidden" name="userId" value="${editCustomer.userId.userId }">
										<input type="hidden" name="flag" value="updateCustomer">
                                        <div class="row p-t-20">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Customer Name<span style="color: red;">*</span></label>
                                                    <input required="required" name="customerName" type="text" id="customerName" class="form-control" value="${editCustomer.customerName}" placeholder="Customer Name">
                                                 
                                                 </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label class="control-label">Company Name<span style="color: red;">*</span></label>
                                                    <input required="required" name="companyName" type="text" id="companyName" class="form-control" value="${editCustomer.companyName}" placeholder="Company Name">
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
                                           				 
		                                                <% 
                                                        String[] email=new String[4];
		                                                int count=0;
		                                                int in=20;
                                                        HttpSession httpSession=request.getSession();
                                                        List<CustomerMasterVo> listEmail = (List<CustomerMasterVo>)httpSession.getAttribute("editCustomer");
                                                        
                                                        for(int i=0;i<listEmail.size();i++)
                                                      	{
                                                      		CustomerMasterVo customerMasterVo= listEmail.get(i);
                                                      		String temp=customerMasterVo.getEmailId();
                                                      		StringTokenizer st1 =   new StringTokenizer(temp, ","); 
                                                            while (st1.hasMoreTokens()) 
                                                            {
                                                            	
                                                                email[i]=st1.nextToken(); 
                                                               if(count==0)
                                                            {
                                                                if(email[i]!=null)
                                                          		{
                                                          			 %>  
                                                          			 <input required="required" name="emailId" type="email" id="email" class="form-control " placeholder="Email" value="<%=email[i] %>">
		                                              				 <div class="input-group-append">
		                                               					<button class="btn btn-success" type="button" onclick="customer_email();"><i class="fa fa-plus"></i></button>
		                                             				 </div>
		                                             				 </div>
		                                             				 </div>
                                            						<div id="customerEmail">
                                                          			 <% 
                                                          		}}
                                                               else { %>
                                                              
                                        					<div class="form-group row removeclassemail<%=in%>"><div class="col-md-12"><div class=""><div class="input-group"> <input class="form-control" type="email" placeholder="Email" id="CustomerEmail" name="emailId" value="<%=email[i] %>" autocomplete="off"><div class="input-group-append"> <button class="btn btn-danger" type="button" onclick="remove_customer_email(<%=in%>);"> <i class="fa fa-minus"></i> </button></div></div></div></div><div class="clear"></div></div> 
                                        						<%
                                                            	  in++; 
                                                               }
                                                            	count++;
                                                            } 
                                                      		
                                                      	}%>
                                        		</div>
                                   			 </div>
                                   			
                                            <!--/span-->
                                            <div class="col-md-6 nopadding">
                                        		<div class="form-group">
                                        		<label class="control-label">Contact<span style="color: red;">*</span></label>
                                            		<div class="input-group">
                                           				
		                                                <% 
                                                        String[] contact=new String[4];
		                                                int count1=0;
		                                                int in1=20;
                                                        List<CustomerMasterVo> listContact= (List<CustomerMasterVo>)httpSession.getAttribute("editCustomer");
                                                        
                                                        for(int i=0;i<listEmail.size();i++)
                                                      	{
                                                      		CustomerMasterVo customerMasterVo= listContact.get(i);
                                                      		String temp=customerMasterVo.getMobileNumber();
                                                      		StringTokenizer st1 =   new StringTokenizer(temp, ","); 
                                                            while (st1.hasMoreTokens()) 
                                                            {
                                                                contact[i]=st1.nextToken(); 
                                                                if(count1==0)
                                                                {
	                                                                if(contact[i]!=null)
	                                                          		{
	                                                          			 %>  
	                                                          			  <input name="mobileNumber" required="required" maxlength="10" pattern="[0-9]{10}" type="text" id="Contact" class="form-control " placeholder="Contact" value="<%=contact[i]%>">
			                                              				 <div class="input-group-append">
			                                               					<button class="btn btn-success" type="button" onclick="customer_contact();"><i class="fa fa-plus"></i></button>
			                                              				 </div>
			                                              				</div> 
			                                              				 </div>
                                        							<div id="customerContact">
			                                              				<%
	                                                          			 
	                                                          		}
                                                                }
                                                                
                                                                else
                                                                {%>
                                                 			
                                        		 			<div class="form-group row removeclasscontact<%=in1%>"><div class="col-md-12"><div class=""><div class="input-group"> <input class="form-control" maxlength="10" pattern="[0-9]{10}" type="text" placeholder="Contact" id="CustomerContact" value="<%=contact[i]%>"  name="mobileNumber"><div class="input-group-append"> <button class="btn btn-danger" type="button" onclick="remove_customer_contact(<%=in1%>);"> <i class="fa fa-minus"></i> </button></div></div></div></div><div class="clear"></div></div> 
                                        						<%}
                                                                count1++;
                                                            	}
                                                          	}%>
                                                 </div>
                                   			 </div>
                                            <!--/span-->
                                         </div>
                                        <!--/row-->
                                       <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Telephone</label>
                                                     <input name="telephone" maxlength="10" pattern="[0-9]{10}" type="text" id="Telephone" class="form-control" value="${editCustomer.telephone}" placeholder="Telephone">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                              
                                                <div class="form-group ">
                                                    <label class="control-label">Designation</label>
                                                    <input name="designation" type="text" id="customerDesg" class="form-control" value="${editCustomer.designation}" placeholder="Designation">
                                                </div>
                                            </div>
                                         </div>
                                         
                                          
                                        </div>
                                        
                                        <!--/row-->
                                         
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Address<span style="color: red;">*</span></label>
                                                    <textarea name="address" rows="3" class="form-control" placeholder="Address">${editCustomer.address}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>State<span style="color: red;">*</span></label>
                                                      
                                                     <select name="stateId" id="stateId" onchange="ajaxCity()" required="required" class="select2 form-control custom-select"  >
                                                        <c:forEach items="${listState}" var="listState">
                                                   			<c:if test="${listState.stateId == editCustomer.stateId.stateId }">
                                                        		<option selected="selected" value="${listState.stateId}">${listState.stateName } </option>
                                                     		</c:if>
                                                     		<c:if test="${listState.stateId != editCustomer.stateId.stateId }">
                                                    	 		<option  value="${listState.stateId}">${listState.stateName} </option>
                                                     		</c:if>
                                                     	</c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City<span style="color: red;">*</span></label>
                                                    <select name="cityId" id="cityId" required="required" class="select2 form-control custom-select">
                                                    <c:forEach items="${listCity}" var="listCity">
                                                    <c:if test="${listCity.cityId == editCustomer.cityId.cityId }">
                                                        <option selected="selected" value="${listCity.cityId}">${listCity.cityName } </option>
                                                     </c:if>
                                                    </c:forEach> 
                                                    </select>
                                                </div>
                                            </div>
                                            
                                        </div>
                                   
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Post Code<span style="color: red;">*</span></label>
                                                    <input name="pincode" required="required" maxlength="6" pattern="[0-9]{6}" type="text" class="form-control" value="${editCustomer.pincode}" placeholder="Post Code">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">GST No</label>
                                                     <input name="gstNo"  type="text" id="gstNo"  maxlength="15" pattern="[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}" class="form-control" value="${editCustomer.gstNo}" placeholder="GST No">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>
                                    
                                    <div class="form-actions"  >
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Edit</button>
                                        <a href="<%=request.getContextPath()%>/CustomerMasterController?flag=listCustomer"><button type="button" class="btn btn-inverse"> Cancel  </button> </a>
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
    
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    
    <script src="../assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
    <script>
    $(".select2").select2();
    $(".ajax").select2({
        ajax: {
            url: "https://api.github.com/search/repositories",
            dataType: 'json',
            delay: 250,
            data: function(params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function(data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;
                return {
                    results: data.items,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function(markup) {
            return markup;
        }, // let our custom formatter work
        minimumInputLength: 1,
        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });
 
   
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
								 			 
</script>
    <%@ include file="footerjs.jsp" %>
</body>

</html>