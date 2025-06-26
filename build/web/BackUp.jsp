<%-- 
    Document   : BackUp
    Created on : Aug 7, 2019, 3:09:28 PM
    Author     : Acer
--%>

<%@page import="com.dbcon.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String fname=request.getParameter("fname");
try{
    ResultSet rs=Queries.getExecuteQuery("select * from attack where fname='"+fname+"'");

                             if(rs.next())
			{
                            String owner=rs.getString("owner");
     int i=Queries.getExecuteUpdate("insert into backup values(null,'"+fname+"','"+owner+"',now())");
     if(i>0){
 Queries.getExecuteUpdate("delete from attack where fname='"+fname+"'");
 %>
 <script type="text/javascript">
     window.alert("File Backup Successfully");
     window.location="Verify.jsp";
 </script>
 <%
}else{%>
<script type="text/javascript">
     window.alert("File Backup Failed");
     window.location="Verify.jsp";
 </script>
<%}
                        }
}catch(Exception e){
   out.println(e);
}

%>