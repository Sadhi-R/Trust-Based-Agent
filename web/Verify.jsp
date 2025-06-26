<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbcon.Queries"%>
<%@page import="java.sql.Connection"%>
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
    <link href="table.css" rel="stylesheet">
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
						
                     
						<div class="mu-featured-content" style="width:1200px;">
                                                    <img src="images/upload.jpg" width="300px" height="300px" align="right">
                                                    <p></p>
                                                    <h2>View All Files</h2>	
                         <table cellspacing="30" border="2" width="800px;" align="left">
			 <tr><th><font color="red">ID</font></th>
                             <th><font color="red">FileName</font></th>
                          <th><font color="red">File Size</font></th>
                           <th><font color="red">Rank</font></th>
                            <th><font color="red">Date</font></th>
                           <th><font color="red">DisHonest Server</font></th>
                             <th><font color="red">Verify</font></th>
                             
                           
                             
                         
                         </tr>
			 <%
	try
	{
	
            ResultSet rs=Queries.getExecuteQuery("select * from file where owner='"+username+"'");

                             while(rs.next())
			{
				%>
			 <tr>
			 <td><font color="green"><%=rs.getString("id")%></font></td>
			   <td><font color="green"><%=rs.getString("fname")%></font></td>
			 <td><font color="green"><%=rs.getString("fsize")%>KB</font></td>
                         <td><font color="green"><%=rs.getString("status")%></font></td>
                         <td><font color="green"><%=rs.getString("date")%></font></td>
                         <td><font color="green"><%=rs.getString("server")%></font></td>
                         <td><a href="VerifyAction.jsp?id=<%=rs.getString("id")%>&fname=<%=rs.getString("fname")%>"><input type="button" value="Verify"></a></td>
                        
                      
                         </tr>
			 <%}
	}
			catch(Exception e)
			{
			out.println(e);
			}
			 %>
			 </table>
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