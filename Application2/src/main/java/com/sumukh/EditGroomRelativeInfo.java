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

public class EditGroomRelativeInfo extends HttpServlet {
	
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
		
		String groom_relative1_firstname = request.getParameter("relative1_firstname");
		String groom_relative1_lastname = request.getParameter("relative1_lastname");
		String groom_relative1_type = request.getParameter("relative1_relation_type");
		int groom_id = Integer.parseInt(request.getParameter("groom_id"));
		String groom_relative2_firstname = request.getParameter("relative2_firstname");
		String groom_relative2_lastname = request.getParameter("relative2_lastname");
		String groom_relative2_type = request.getParameter("relative2_relation_type");
		int groom_relative_id = Integer.parseInt(request.getParameter("groom_relative_id"));
		boolean success = false;
		try {
			PreparedStatement ps = con.prepareStatement("update groom_relative_info set groom_relative1_firstname=?,groom_relative1_lastname=?,groom_relative1_type=?,groom_id=?,groom_relative2_firstname=?,groom_relative2_lastname=?,groom_relative2_type=? where groom_relative_id=?");
			ps.setString(1, groom_relative1_firstname);
			ps.setString(2, groom_relative1_lastname);
			ps.setString(3, groom_relative1_type);
			ps.setInt(4, groom_id);
			ps.setString(5, groom_relative2_firstname);
			ps.setString(6, groom_relative2_lastname);
			ps.setString(7, groom_relative2_type);
			ps.setInt(8, groom_relative_id);
			ps.executeUpdate();
			success = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(success) {
	    	request.getSession(true);
	    	response.sendRedirect("upload_groom_relative_image.jsp");
		}else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='edit_groom_relative_info.jsp';"); 
		    pw.println("</script>"); 
		}
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
