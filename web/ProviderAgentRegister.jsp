<%-- 
    Document   : RegisterAction
    Created on : 27 Jul, 2019, 5:16:23 PM
    Author     : Sadhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String dob=request.getParameter("dob");
    String gender=request.getParameter("gender");
    String location=request.getParameter("location");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/trust_based", "root", "root");
        Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select count(*) from provider_agent where username='"+username+"'");
      while(rs.next())
      {
          int count=rs.getInt(1);
          if(count==0)
          {
              int i=st.executeUpdate("insert into provider_agent values('"+username+"','"+password+"','"+email+"','"+mobile+"','"+address+"','"+dob+"','"+gender+"','"+location+"','Waiting')");
              if(i>0)
              {
                  %>
                  <script type="text/javascript">
           window.alert("Registration SuccessFully Completed");
           window.location="ProviderAgent.jsp";
           
           </script>
                  <%
              }
else
{
%>
                  <script type="text/javascript">
           window.alert("Registration Fail");
           window.location="ProviderAgent.jsp";
           
           </script>
                  <%
}
          }
%>
                  <script type="text/javascript">
           window.alert("Username Alredy Exist");
           window.location="ProviderAgent.jsp";
           
           </script>
                  <%
      }
%>
                  <script type="text/javascript">
           window.alert("Username Already Exist");
           window.location="ProviderAgent.jsp";
           
           </script>
                  <%
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>