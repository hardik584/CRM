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
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>CRM Recover Password</title>
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
        
         if (password != confirmPassword)
          {
             
            document.getElementById("error").innerHTML="Both Password Must be Same";
            var btn = document.getElementById("recover");
            btn.disabled = true;
            
            return false;
        }
         else
       {
        	 checkMobile();
        	 
             var btn = document.getElementById("recover");
             btn.disabled = false;
              
             return true;
       }
      
       
      	
    }
    function checkMobile()
    {
         
        var contact=document.getElementById("userMobile").value;
        var email=document.getElementById("userEmail").value;
        var xmlhttp;
		var url=String("../UserMasterController?userMobile="+contact+"&userEmail="+email+"&flag=checkContact");
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
					if(msg == 'Contact or Email not correct')
					{
						var btn = document.getElementById("recover");
		           		btn.disabled = true;
						document.getElementById("error").innerHTML=msg;
					}
					else
					{
						var btn = document.getElementById("recover");
			            btn.disabled = false;	
					}
			}
			
				 
		}
		xmlhttp.open("POST",url,true);
		xmlhttp.send();
    }
    function checkNull()
    {
    	document.getElementById("error").innerHTML="";
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
        <div class="login-register" style="background-image:url(../assets/images/background/login-register.jpg);">        
            <div class="login-box card">
            <div class="card-body">
             <p align="center">
                        <img src="../assets/images/1.png">
                         </p>
                <form class="form-horizontal form-material" id="loginform" name="UserMasterController" action="<%=request.getContextPath()%>/UserMasterController">
                    <input type="hidden" name="flag" value="recoverPassword">
                    <h3 class="box-title m-b-20">Recover Password</h3>
                    <div class="form-group ">
                      <div class="col-xs-12">
                        <input class="form-control" id="userMobile" onkeyup="checkNull()"	  name="userMobile" type="text" maxlength="10" pattern="[0-9]{10}" required="" placeholder="Contact">
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class="col-xs-12">
                        <input class="form-control" id="userEmail" onkeyup="checkNull()" onblur="checkMobile()" name="userEmail" type="email" required="" placeholder="Email">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-xs-12">
                        <input class="form-control" onkeyup="checkNull()" onchange="Validate()" name="userPassword" id="txtPassword" type="password" required="" placeholder="New Password">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-xs-12">
                        <input class="form-control" onkeyup="checkNull()" onchange="Validate()" id="txtConfirmPassword" type="password" required="" placeholder="Confirm Password">
                      </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                      <div class="col-xs-12">
                        <button id="recover" class="btn btn-info btn-lg btn-block  waves-effect waves-light" disabled="disabled"  type="submit">Reset</button>
                      </div>
                    </div>
                     <div class="form-group text-center m-t-20">
                            <div class="col-xs-12" id="error" style="color: red;">
                                
                            </div>
                        </div>
                         <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                <div>Return to the<a href="user-login.jsp" class="text-info m-l-5"><b>Sign In</b></a></div>
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