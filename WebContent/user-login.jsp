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
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/crm.png">
    <title>CRM Login</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
     <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Custom CSS -->
    <link href="mini-sidebar/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="mini-sidebar/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	 
</script>



</head>

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
        <div class="login-register" style="background-image:url(assets/images/background/login-register.jpg);">
            <div class="login-box card">
                <div class="card-body">
                   <%--  <form name="UserMasterVo" action="<%=request.getContextPath()%>/UserMasterController"  class="form-horizontal form-material" id="loginform" > --%>
                        <input type="hidden" name="flag" value="loginUser">
                        <p align="center">
                        <img src="assets/images/1.png">
                         </p>
                       	 <h3 class="box-title m-b-20"> Sign In</h3>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input onkeyup="blank()" name="userEmail" id="userEmail" class="form-control" type="email" required="required" placeholder="E-Mail"> </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input onkeyup="blank()" name="userPassword" id="userPassword" class="form-control" type="password" required="required"  placeholder="Password"> </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12 font-14">
                                <div class="checkbox checkbox-primary pull-left p-t-0">
                                    <input id="checkbox-signup" type="checkbox">
                                    <label for="checkbox-signup"> Remember me </label>
                                </div> <b><a href="mini-sidebar/user-recover-password.jsp"  class="pull-right">  Forgot pwd?</a></b> </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button id="login" onclick="ajaxLogin()" class="btn btn-info btn-lg btn-block   waves-effect waves-light"  >Log In</button>
                            	 
                             </div>
                        </div>
                          <div class="form-group text-center m-t-20">
                            <div class="col-xs-12" id="error" style="color: red;">
                                
                            </div>
                        </div>
                        <!-- <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                                <div class="social">
                                     
                                </div>
                            </div>
                        </div> -->
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                <div>Don't have an account? <a href="mini-sidebar/user-register.jsp" class="text-info m-l-5"><b>Sign Up</b></a><br><a href="javascript:void(0)" id="try"  onclick="tryLogin()">Try Demo</a></div>
                            </div>
                        </div>
                  <!--   </form> -->
                    <form class="form-horizontal" id="recoverform" action="index.html">
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <h3>Recover Password</h3>
                                <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" required="" placeholder="Email"> </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
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
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="mini-sidebar/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="mini-sidebar/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="mini-sidebar/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="mini-sidebar/js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    <script>
	   			function ajaxLogin() {
		   		document.getElementById("login").innerHTML="Please Wait...."
		   		var btn = document.getElementById("login");
           		btn.disabled = true;
		   			 
				var xmlhttp;
				var key=String(document.getElementById("userEmail").value);
				var key2=String(document.getElementById("userPassword").value);
				var url=String("UserMasterController?userEmail="+key+"&userPassword="+key2+"&flag=ajaxLogin");
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
						if( xmlhttp.responseText == "login Success")
							location.href="mini-sidebar/index.jsp";
						else
							document.getElementById("error").innerHTML=xmlhttp.responseText;
							btn.disabled = false;
							document.getElementById("login").innerHTML="Log In";
						}
				}
				xmlhttp.open("POST",url,true);
				xmlhttp.send();
			}

	   			function tryLogin() {
	   				var btn = document.getElementById("login");
	           		btn.disabled = true;
	   				document.getElementById("login").innerHTML="Please Wait...."
	   				var elem = document.getElementById("try");
	   				elem.parentNode.removeChild(elem);
					var xmlhttp;
					 
					var url=String("UserMasterController?userEmail=akashkarli@gmail.com&userPassword=123456&flag=ajaxLogin");
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
							if( xmlhttp.responseText == "login Success")
								location.href="mini-sidebar/index.jsp";
							else
								document.getElementById("error").innerHTML=xmlhttp.responseText;
							document.getElementById("login").innerHTML="Log In";
							
							}
					}
					xmlhttp.open("POST",url,true);
					xmlhttp.send();
				}
				function blank()
				{
					document.getElementById("error").innerHTML="";
				}
	 			 
	    </script>

</body>

</html>