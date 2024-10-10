package com.sumukh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class EditBrideInfo extends HttpServlet {
	
	Connection con;
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
       String bride_firstname = request.getParameter("bride_firstname");
       String bride_lastname = request.getParameter("bride_lastname");
       String bride_proffession = request.getParameter("bride_profession");
       int bride_age = Integer.parseInt(request.getParameter("bride_age"));
       int userId = Integer.parseInt(request.getParameter("userId"));
       int bride_id = Integer.parseInt(request.getParameter("bride_id"));
       PrintWriter pw = response.getWriter();
       response.setContentType("text/html");
       boolean success=false;
       try {
    	   PreparedStatement ps = con.prepareStatement("update bride_info set bride_firstname=?,bride_lastname=?,bride_proffession=?,bride_age=?,userId=? where bride_id=?");
    	   ps.setString(1,bride_firstname);
    	   ps.setString(2,bride_lastname);
    	   ps.setString(3, bride_proffession);
    	   ps.setInt(4, bride_age);
    	   ps.setInt(5, userId);
    	   ps.setInt(6, bride_id);
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
		    pw.println("location='edit_bride_info.jsp';"); 
		    pw.println("</script>"); 
       }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
