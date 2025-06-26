<%-- 
    Document   : activate
    Created on : 28 Jul, 2019, 6:39:20 PM
    Author     : Sadhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String username=request.getParameter("username");
    try
    {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/trust_based", "root", "root");
        Statement st= con.createStatement();
        int i=st.executeUpdate("update provider_agent set status='Activated' where username='"+username+"'");
        if(i>0)
        {
             %>
                  <script type="text/javascript">
           window.alert("Provider Agent Activated SuccessFully ");
           window.location="BrokerHome.jsp";
           
           </script>
                  <%
        }
else
{
 %>
                  <script type="text/javascript">
           window.alert("Provider Agent Activation Fail");
           window.location="BrokerHome.jsp";
           
           </script>
                  <%
}
    }
    catch(Exception e)
    {
        out.print(e);
    }
    %>
