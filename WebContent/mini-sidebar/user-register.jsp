<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/crm.png">
    <title>CRM Sign Up</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
        	document.getElementById("errorPassword").innerHTML="Both Passwords must be same!";
             
            return false;
        }
        else
       {
        document.getElementById("errorPassword").innerHTML="";
        return true;
       }
    }
    function checkEmail()
    {
        
        var email=document.getElementById("userEmail").value;
        var xmlhttp;
		var url=String("../UserMasterController?userEmail="+email+"&flag=checkEmail");
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
					var msg=xmlhttp.responseText;
					if(msg == 'Email Id already exists!')
					{
						var btn = document.getElementById("register");
		           		btn.disabled = true;
						document.getElementById("errorEmail").innerHTML=msg;
					}
					else
					{
						checkMobile();
						var btn = document.getElementById("register");
			            btn.disabled = false;	
			            document.getElementById("errorEmail").innerHTML="";
					}
			}
					 
		}
		xmlhttp.open("POST",url,true);
		xmlhttp.send();
    }
    function checkMobile()
    {
        
        var mobile=document.getElementById("userMobile").value;
        var xmlhttp;
		var url=String("../UserMasterController?userMobile="+mobile+"&flag=checkMobileReg");
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
					var msg=xmlhttp.responseText;
					if(msg == 'Mobile number already exists!')
					{
						var btn = document.getElementById("register");
		           		btn.disabled = true;
						document.getElementById("errorMobile").innerHTML=msg;
					}
					else
					{
						checkEmail();
						var btn = document.getElementById("register");
			            btn.disabled = false;	
			            document.getElementById("errorMobile").innerHTML="";
					}
			}
			
				 
		}
		xmlhttp.open("POST",url,true);
		xmlhttp.send();
    }
</script>
<body>
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
    <section id="wrapper">
        <div class="login-register" style="background-color: threedlightshadow;">
            <div class="login-box card">
                <div class="card-body">
                    <form name="UserMasterVo" class="form-horizontal form-material" id="loginform" method="post" action="<%=request.getContextPath()%>/UserMasterController">
                        <p align="center">
                        <img src="../assets/images/1.png">
                         </p>
                        <h3 class="box-title m-b-20">Sign Up</h3>
                        <div class="form-group">
                            <div class="col-xs-12">
                            	<input type="hidden" name="flag" value="registerUser">
                                <input name="userName" class="form-control" type="text" required="required" placeholder="Name">
                            </div>
                         </div>
                         <div class="form-group">
                            <div class="col-xs-12">
                                <input name="userEmail" class="form-control" id="userEmail" type="email" onchange="checkEmail()" required="required" placeholder="Email">
                            	<span id="errorEmail" style="color: red;"></span>
                            </div>
                      	 </div>
                      	 
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input name="userMobile" class="form-control" id="userMobile" type="text" onchange="checkMobile()" maxlength="10" pattern="[0-9]{10}" required="required" placeholder="Contact">
                            	<span id="errorMobile" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <select class="form-control" name="roleId" required="required">
                                	<option value="" disabled selected>Select Role</option>
                                	<option value="2">Sales Executives</option>
                                	<option value="3">BDA</option>
                                	
                                </select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input name="userPassword" id="txtPassword" class="form-control" type="password" required="required" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" id="txtConfirmPassword"  type="password" onchange="return Validate()" required="required" placeholder="Confirm Password">
                            	<span id="errorPassword" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="checkbox checkbox-success">
                                    <input id="checkbox-signup" type="checkbox" required="required">
                                    <label for="checkbox-signup"> I agree to all <a href="#">Terms</a></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button id="register" disabled="disabled" class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit" onclick="return Validate()">Sign Up</button>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                <div>Already have an account? <a href="user-login.jsp" class="text-info m-l-5"><b>Sign In</b></a></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
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
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>