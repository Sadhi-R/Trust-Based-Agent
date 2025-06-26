<%-- 
    Document   : Block
    Created on : Aug 7, 2019, 2:42:39 PM
    Author     : Acer
--%>

<%@page import="com.dbcon.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String username=request.getParameter("username");
try{
    String uwery="update user_agent set status='Blocked' where username='"+username+"'";
    int i=Queries.getExecuteUpdate(uwery);
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("successfully blocked user");
            window.location="ViewAttackers.jsp";
            </script>
        <%
    }else{
%>
        <script type="text/javascript">
            window.alert("failed to blocking user");
            window.location="ViewAttackers.jsp";
            </script>
        <%
}
    
    
}catch(Exception e){
 out.println(e);
}



%>