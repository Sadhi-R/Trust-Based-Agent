<%-- 
    Document   : GenerateKey
    Created on : Aug 7, 2019, 11:43:19 AM
    Author     : Acer
--%>

<%@page import="com.dbcon.Queries"%>
<%@page import="com.alphanumeric.Key"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
try{
    String hkey=Key.randomAlphaNumeric(20);
    String skey=Key.randomAlphaNumeric(8); 
    
    String query="update request set hashcode='"+hkey+"',sk='"+skey+"',resdate=now(),status='Generated' where id='"+id+"'";
    
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Generated Successfully");
            window.location="ViewSecretKeyReq.jsp";
        </script>
        <%
    }else{
%>
        <script type="text/javascript">
            window.alert("Generated Failed");
            window.location="ViewSecretKeyReq.jsp";
        </script>
        <%
}
    
    
}catch(Exception e){
   out.println(e); 
}

%>