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

public class EditGroomInfo extends HttpServlet {

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
	  PrintWriter pw = response.getWriter();
	  response.setContentType("text/html");
	  boolean success = false;
	  
	  String groom_firstname = request.getParameter("groom_firstname");
	  String groom_lastname = request.getParameter("groom_lastname");
	  String groom_proffession = request.getParameter("groom_profession");
	  int groom_age = Integer.parseInt(request.getParameter("groom_age"));
	  int userId = Integer.parseInt(request.getParameter("userId"));
	  int groom_id = Integer.parseInt(request.getParameter("groom_id"));
	  
	  try {
		  PreparedStatement ps = con.prepareStatement("update groom_info set groom_firstname=?,groom_lastname=?,groom_proffession=?,groom_age=?,userId=? where groom_id=?");
		  ps.setString(1,groom_firstname);
		  ps.setString(2,groom_lastname);
		  ps.setString(3, groom_proffession);
		  ps.setInt(4,groom_age);
		  ps.setInt(5,userId);
		  ps.setInt(6,groom_id);
		  ps.executeUpdate();
		  success = true;
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	  if(success) {
		  request.getSession(true);
		  response.sendRedirect("upload_groom_image.jsp");
	  }else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='edit_groom_info.jsp';"); 
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
