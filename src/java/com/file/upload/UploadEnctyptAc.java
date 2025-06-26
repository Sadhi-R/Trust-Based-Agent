/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.file.upload;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.alphanumeric.Key;
import com.dbcon.Queries;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.util.concurrent.TimeUnit;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author Acer
 */
  @MultipartConfig(maxFileSize=16*1024*1024)
public class UploadEnctyptAc extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  final String filepath="E://";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
      try{
          
    String username=(String)session.getAttribute("username");
    
    MultipartRequest m=new MultipartRequest(request,filepath);
  

String secret=Key.randomAlphaNumeric(10);

File f=m.getFile("file");


String Filename=m.getParameter("fname");
String content=m.getParameter("content");
String server=m.getParameter("server");
       
           KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
          System.out.println("secret key:"+skey);   
          String cipher=new encryption().encrypt(content,s);




int fsize=content.length();

    String query="select count(*) from file where fname='"+Filename+"'";
    int c=0;
    ResultSet r=Queries.getExecuteQuery(query);
    while(r.next()){
        c=r.getInt(1);
    }
    long start=System.nanoTime();
    
    if(c==0){
        String que="insert into file values(null,'"+username+"','"+Filename+"','"+fsize+"','"+content+"','"+cipher+"','"+skey+"','"+server+"','0',now())";
   int i=Queries.getExecuteUpdate(que);
   if(i>0){
         File f1 = new File("E:\\",Filename);
                                FileWriter fw = new FileWriter(f1);
                                fw.write(cipher);
                                fw.close();
                                Ftpcon ftpcon = new Ftpcon();
                                ftpcon.upload(f1, Filename);
       
      long end=System.nanoTime();  
      
   long utime=TimeUnit.NANOSECONDS.toMillis(end-start);
      
       Queries.getExecuteUpdate("insert into transactions values(null,'"+username+"','"+Filename+"','upload','"+utime+"',now())");
     
          response.sendRedirect("UploadData.jsp?msg=file uploaded successfully");
        
   }else{
response.sendRedirect("UploadData.jsp?msg=file uploaded failed");
}
    }

          
          
        }catch(Exception e){
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
