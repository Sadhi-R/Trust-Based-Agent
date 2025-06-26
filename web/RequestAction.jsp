<%-- 
    Document   : RequestAction
    Created on : Aug 6, 2019, 2:08:09 PM
    Author     : Acer
--%>

<%@page import="com.dbcon.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String username=(String)session.getAttribute("username");

String fname=request.getParameter("fname");
String owner=request.getParameter("owner");
try{
    String query="insert into request values(null,'"+username+"','"+fname+"','"+owner+"',now(),'waiting','waiting','waiting','waiting')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Request Sent Successfully");
            window.location="RequestSecretKey.jsp";
            </script>
        <%
    }else{
%>
        <script type="text/javascript">
            window.alert("Request Sent Successfully");
            window.location="RequestSecretKey.jsp";
            </script>
        <%
}
}catch(Exception e){
  out.println(e);  
}

%>