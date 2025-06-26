<%-- 
    Document   : ProviderLogin
    Created on : 28 Jul, 2019, 6:46:58 PM
    Author     : Sadhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String username=request.getParameter("username");
    session.setAttribute("username",username);
    String password=request.getParameter("password");
    try
    {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/trust_based", "root", "root");
        Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select *from user_agent where username='"+username+"' and password='"+password+"'");
      while(rs.next())
      {
          String status=rs.getString("status");
          if(status.equalsIgnoreCase("Waiting"))
          {
              %>
                  <script type="text/javascript">
           window.alert("Your Account Not Yet  Activated By Admin");
           window.location="UserAgent.jsp";
           
           </script>
                  <%
          }
else
if(status.equalsIgnoreCase("Activated"))
{
%>
                  <script type="text/javascript">
           window.alert("User Agent  Login SuccessFully ");
           window.location="UserHome.jsp";
           
           </script>
                  <%
}
%>
                  <script type="text/javascript">
           window.alert("Username Or Password Incorrect");
           window.location="UserAgent.jsp";
           
           </script>
                  <%
      }
%>
                  <script type="text/javascript">
           window.alert("Username Or Password Incorrect");
           window.location="UserAgent.jsp";
           
           </script>
                  <%
    }
    catch(Exception e)
    {
     out.println(e);
    }
    %>
