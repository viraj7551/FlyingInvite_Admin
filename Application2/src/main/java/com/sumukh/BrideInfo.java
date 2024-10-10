package com.sumukh;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class BrideInfo extends HttpServlet {
    Connection con;
    
    private PreparedStatement ps;
    
	public void init(ServletConfig config) {
	  String driver = config.getInitParameter("driver");
	  String url = config.getInitParameter("url");
	  String username = config.getInitParameter("username");
	  String password = config.getInitParameter("password");
	  try {
		  Class.forName(driver);
		  con = DriverManager.getConnection(url,username,password);
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean success = false;
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String bride_firstname = request.getParameter("bride_firstname");
		String bride_lastname  = request.getParameter("bride_lastname");
		String bride_proffession = request.getParameter("bride_proffession");
		int age = Integer.parseInt(request.getParameter("bride_age"));
		int user_info = Integer.parseInt(request.getParameter("user_info"));
		
		try {
			ps = con.prepareStatement("insert into bride_info(bride_firstname, bride_lastname, bride_proffession, bride_age, userId)values(?,?,?,?,?)");
			ps.setString(1,bride_firstname);
			ps.setString(2, bride_lastname);
			ps.setString(3, bride_proffession);
			ps.setInt(4, age);
			ps.setInt(5,user_info);
			ps.executeUpdate();
			success=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	  if(success) {
		  request.getSession(true);
		  response.sendRedirect("upload_bride_image.jsp");
	  }else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='bride_info.jsp';"); 
		    pw.println("</script>"); 
	  }
	  
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public void destroy() {
		try {
			con.close();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
