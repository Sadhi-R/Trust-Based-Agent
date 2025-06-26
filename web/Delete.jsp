<%-- 
    Document   : Delete
    Created on : Aug 6, 2019, 12:23:24 PM
    Author     : Acer
--%>

<%@page import="com.dbcon.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");
try{
    int i=Queries.getExecuteUpdate("delete from file where id='"+id+"'");
    if(i>0){
        %>
                  <script type="text/javascript">
           window.alert("File SuccessFully Deleted");
           window.location="DeleteFiles.jsp";
           
           </script>
                  <%
    }else{
%>
                  <script type="text/javascript">
           window.alert("File failed to Delete");
           window.location="DeleteFiles.jsp";
           
           </script>
                  <%
}
}catch(Exception e){
   out.println(e);
}

%>