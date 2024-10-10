package com.sumukh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentLanguage extends HttpServlet {

	Connection con;
	public void init(ServletConfig config) {
		String driver = config.getInitParameter("driver");
		String url = config.getInitParameter("url");
		String username = config.getInitParameter("username");
		String password = config.getInitParameter("password");
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,username, password);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String userId = request.getParameter("userId");
	    String template_title = request.getParameter("template_title");
	    PrintWriter pw = response.getWriter();
	    response.setContentType("text/html");
	    boolean success = false;	  
	    
	    boolean isUserExist = read_record(userId);
	    
	    if(isUserExist) {
   	        request.getSession(true);
   		    pw.println("<script type=\"text/javascript\">"); 
   		    pw.println("alert('template is already set for current user, either you can edit or add new user..!');"); 
   		    pw.println("location='content_language.jsp';"); 
   		    pw.println("</script>");  
	    }
	    else {
	    	try {
	    	    if(userId != null &&  template_title != null) {
	    		PreparedStatement ps = con.prepareStatement("insert into template_language(template_language_title, userId)values(?,?)");
	    		ps.setString(1, template_title);
	    		ps.setInt(2,Integer.parseInt(userId));
	    		ps.executeUpdate();
	    		success = true;
	    	   }
	    		else {
	    	    	success = false;
	    	    }
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    }
	    
	    	
	    	if(success) {
	   	        request.getSession(true);
	   		    pw.println("<script type=\"text/javascript\">"); 
	   		    pw.println("alert('Content Language updated successfully');"); 
	   		    pw.println("location='dashboard.jsp';"); 
	   		    pw.println("</script>");  
	    	}else {
	   	        request.getSession(true);
	   		    pw.println("<script type=\"text/javascript\">"); 
	   		    pw.println("alert('something went wrong');"); 
	   		    pw.println("location='content_language.jsp';"); 
	   		    pw.println("</script>");  
	    	}
	}
	
	public boolean read_record(String userId) {
		boolean success=false;
		
		try {
			PreparedStatement ps = con.prepareStatement("select userId from template_language where userId=?");
			ps.setInt(1, Integer.parseInt(userId));
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				success = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void destroy() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
