<%-- 
    Document   : UploadEnctyptAc
    Created on : Aug 6, 2019, 11:38:41 AM
    Author     : Acer
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="com.alphanumeric.Key"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbcon.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%



    String username=(String)session.getAttribute("username");
String fsize=(String)session.getAttribute("fsize");

String secret=Key.randomAlphaNumeric(10);

String Filename=request.getParameter("filename");
String content=request.getParameter("content");
String en_content=request.getParameter("en_content");
String trapdoor=request.getParameter("trapdoor");
String server=request.getParameter("server");
try{
    String query="select count(*) from file where fname='"+Filename+"'";
    int c=0;
    ResultSet r=Queries.getExecuteQuery(query);
    while(r.next()){
        c=r.getInt(1);
    }
    long start=System.nanoTime();
    
    if(c==0){
        String que="insert into file values(null,'"+username+"','"+Filename+"','"+fsize+"','"+content+"','"+en_content+"','"+trapdoor+"','"+secret+"','"+server+"','0',now())";
   int i=Queries.getExecuteUpdate(que);
   if(i>0){
      long end=System.nanoTime();  
      
   long utime=TimeUnit.NANOSECONDS.toMillis(end-start);
      
       Queries.getExecuteUpdate("insert into transactions values(null,'"+username+"','"+Filename+"','upload','"+utime+"',now())");
      %>
      <script type="text/javascript">
          window.alert("file uploaded successfully");
         window.location="UploadData.jsp"; 
      </script>
      <%
   }else{
%>
      <script type="text/javascript">
          window.alert("file upload Failed");
         window.location="UploadData.jsp"; 
      </script>
      <%
}
    }
}catch(Exception e){
  out.println(e);  
}

%>