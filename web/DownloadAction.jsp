<%-- 
    Document   : DownloadAction
    Created on : Aug 7, 2019, 12:22:25 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="com.dbcon.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%long start=System.nanoTime();
String username=(String)session.getAttribute("username");
String fname=request.getParameter("fname");
String owner=request.getParameter("owner");
String hashkey=request.getParameter("hashkey");
String sk=request.getParameter("sk");
try{
    
    String query="select * from request where uname='"+username+"' and fname='"+fname+"'and owner='"+owner+"'and hashcode='"+hashkey+"'and sk='"+sk+"'and status='Generated'";
    ResultSet r=Queries.getExecuteQuery(query);
    if(r.next()){
        long end=System.nanoTime();
      long dtime=TimeUnit.NANOSECONDS.toMillis(end-start);
        Queries.getExecuteUpdate("insert into transactions values(null,'"+username+"','"+fname+"','download','"+dtime+"',now())");
       response.sendRedirect("Download?"+fname);                                            
    
    }else{
        int ii=Queries.getExecuteUpdate("insert into attack values(null,'"+username+"','"+fname+"','"+owner+"',now())");
      if(ii>0){
          response.sendRedirect("GetKeyAction.jsp?msg=yes");
      }else{
      response.sendRedirect("GetKeyAction.jsp?msg=no");
      
      }  
    }
    
    
}catch(Exception e){
    out.println(e);
}
%>