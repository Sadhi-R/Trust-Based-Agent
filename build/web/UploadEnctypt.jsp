<%@page import="com.file.upload.encryption"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>A Trust Based Agent Learning Model</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="assets/images/favicon.ico"/>
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Slick slider -->
    <link href="assets/css/slick.css" rel="stylesheet">
    <!-- Gallery Lightbox -->
    <link href="assets/css/magnific-popup.css" rel="stylesheet">
    <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">

    <!-- Main Style -->
    <link href="style.css" rel="stylesheet">

    <!-- Fonts -->

    <!-- Open Sans for body font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">
    <!-- Poppins for Title -->
  	<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
 
 
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        <script>
      var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function(){
          var text = reader.result;
          var node = document.getElementById('output');
          node.innerText = text;
          console.log(reader.result.substring(0, 200));
        };
        reader.readAsText(input.files[0]);
      };
    </script>
        </script>
  </head>
  <body>
  	
  	<!-- Start Header -->
	<header id="mu-header" class="" role="banner">
		<div class="container">
			<nav class="navbar navbar-default mu-navbar">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>

		      <!-- Text Logo -->
                      <a  href="#"><font color="white" size="5">A Trust Based Agent Learning Model for Service Composition in Mobile Cloud Computing</font></a>

		      <!-- Image Logo -->
		      <!-- <a class="navbar-brand" href="#"><img src="assets/images/logo.png"></a> -->


		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav mu-menu navbar-right">
			        <li><a href="ProviderHome.jsp">HOME</a></li>
			        <li><a href="UploadData.jsp">Upload Data</a></li>
			        <li><a href="ViewMyFiles.jsp">View My Files</a></li>
		            <li><a href="ViewMyProfile.jsp">View My Profile</a></li>
		            <li><a href="Verify.jsp">Verify</a></li>
                            <li><a href="DeleteFiles.jsp">Delete File</a></li>
                           
                            <li><a href="index.html">Logout</a></li>
		            
		      	</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		</div>
	</header>
	<!-- End Header -->

	<!-- Start Featured Slider -->

	<section id="mu-featured-slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mu-featured-area">
                                            <% String username=(String)session.getAttribute("username");%>
						<h3>Welcome <%=username%></h3>
                                                <%@page import="javax.crypto.*" %>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64" %>
<%
     KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
        
           
           SecretKey s1=keygen.generateKey();
           //converting secret keyto string
           byte[] b1=s1.getEncoded();//encoding secret key
           String mac1=Base64.encode(b1);
           
               keygen.init(128);
        
           
           SecretKey s3=keygen.generateKey();
         byte[] b3=s3.getEncoded();//encoding secret key
           String mac2=Base64.encode(b3);

String Filename=request.getParameter("fname");
session.setAttribute("Filename",Filename);
String content=request.getParameter("content");
int fs=content.length();
String fsize=""+fs;

session.setAttribute("fsize",fsize);

String en_content1=new encryption().encrypt(content,s1);





%>
                     
						<div class="mu-featured-content">
                                                    <img src="images/upload.jpg" width="300px" height="300px" align="right">
                                                    <p></p>
						
                           <form action="UploadEnctyptAc" method="post">
                                                <table>
                                                  <tr>
                  <th><font color="black"><b>Choose File:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></th>
                  <td><input type="text" name="filename"  value="<%=Filename%>" style="color: red;width:420px;" onchange="setfilename(this.value)"></td>
              </tr>
            <tr>
                  <td></td>
                  <td></td>
              </tr>
            
              <tr>
                  <th><font color="black"></font>Normal Data:</th>
                  <td><textarea rows="10" cols="50"  name="content" style="color: red;" >
                      <%=content%>
                      </textarea></td>
                      </tr>
                       <tr>
                  <th><font color="black"></font>Enc Data:</th>
                  <td><textarea rows="10" cols="50"  name="en_content" style="color: red;" >
                      <%=en_content1%>
                      </textarea></td>
                      </tr>
                       <tr>
                  <th>Trapdoor:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                  <td><input type="text" name="trapdoor" value="<%=mac2%>"  required="" style="width:420px;"></td>
              </tr>
              <tr><th>Select dishonest Server </th><td><select  name="server"  style="width:420px;">
                                                                            <option value="cs1">CS1</option>
                                                                            <option value="cs2">CS2</option>
                                                                            <option value="cs3">CS3</option>
                                                            </select></td></tr>
              <tr>
                  <th></th>
                  <td><input type="submit" value="Encrypt" ></td>
              </tr>

                                                  
                                                </table>
                                                </form>
                                                    </div>
					</div>
				</div>			
			</div>
		</div>
	</section>
	
	<!-- Start Featured Slider -->
	
	<!-- Start main content -->
		
		
	<!-- Start footer -->
	<footer id="mu-footer" role="contentinfo">
			<div class="container">
				<div class="mu-footer-area">
					<p class="mu-copy-right">&copy; Copyright <a rel="nofollow" href="https://srichaitanya.ac.in">Sadhi Java Projects</a>. All right reserved.</p>
				</div>
			</div>

	</footer>
	<!-- End footer -->
        <script>
            var input = document.getElementById("myFile");
var output = document.getElementById("output");

input.addEventListener("change", function () {
  if (this.files && this.files[0]) {
    var myFile = this.files[0];
    var reader = new FileReader();
    
    reader.addEventListener('load', function (e) {
      output.textContent = e.target.result;
    });
    
    reader.readAsBinaryString(myFile);
  }
});    

function setfilename(val)
  {
    filename = val.split('\\').pop().split('/').pop();
    
    document.getElementById('wpName').value = filename;
  }

        </script>
	
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Bootstrap -->
    <script src="assets/js/bootstrap.min.js"></script>
	<!-- Slick slider -->
    <script type="text/javascript" src="assets/js/slick.min.js"></script>
    <!-- Filterable Gallery js -->
    <script type="text/javascript" src="assets/js/jquery.filterizr.min.js"></script>
    <!-- Gallery Lightbox -->
    <script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Ajax contact form  -->
    <script type="text/javascript" src="assets/js/app.js"></script>
	<!-- Featured Slider -->
    <script type="text/javascript" src="assets/js/typed.min.js"></script>
    <!-- On scroll JS  -->
    <script src="assets/js/jquery.appear.js"></script>
	<!-- Progress Bar -->
    <script type="text/javascript" src="assets/js/jquery.lineProgressbar.js"></script>
    
	
    <!-- Custom js -->
	<script type="text/javascript" src="assets/js/custom.js"></script>

	
	
    
  </body>
</html>