<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%
    String username=request.getParameter("servername");
    session.setAttribute("username",username);
    String password=request.getParameter("password");
    String server=request.getParameter("server");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
         Connection    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust_based", "root", "root");
     
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select * from cloudserver where servername='"+username+"' and password='"+password+"' and server='"+server+"'");
      if(rs.next())
      {
       %>
       <script type="text/javascript">
           window.alert("Cloud Server Login SuccessFully");
           window.location="CloudHome.jsp";
           
           </script>
        <%
      }
else
{
%>
       <script type="text/javascript">
           window.alert("Cloud Server Login Fail");
           window.location="CloudServers.jsp";
           
           </script>
        <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>


