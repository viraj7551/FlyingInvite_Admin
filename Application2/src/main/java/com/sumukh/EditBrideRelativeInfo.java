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

public class EditBrideRelativeInfo extends HttpServlet {
	
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
		String relative1_firstname = request.getParameter("relative1_firstname");
		String relative1_lastname = request.getParameter("relative1_lastname");
		String relative1_relation_type = request.getParameter("relative1_relation_type");
		String relative2_firstname = request.getParameter("relative2_firstname");
		String relative2_lastname = request.getParameter("relative2_lastname");
		String relative2_relation_type = request.getParameter("relative2_relation_type");
		int bride_id = Integer.parseInt(request.getParameter("bride_id"));
		int bride_relative_id = Integer.parseInt(request.getParameter("bride_relative_id"));
		
		boolean success = false;
		try {
			PreparedStatement ps = con.prepareStatement("update bride_relative_info set bride_relative1_firstname = ?,bride_relative1_lastname=?,bride_relative1_type=?,bride_id=?,bride_relative2_firstname=?,bride_relative2_lastname=?,bride_relative2_type=? where bride_relative_id=?");
			ps.setString(1, relative1_firstname);
			ps.setString(2, relative1_lastname);
			ps.setString(3, relative1_relation_type);
			ps.setInt(4, bride_id);
			ps.setString(5, relative2_firstname);
			ps.setString(6, relative2_lastname);
			ps.setString(7, relative2_relation_type);
			ps.setInt(8, bride_relative_id);
			ps.executeUpdate();
			success=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(success) {
		    request.getSession(true);
			response.sendRedirect("upload_bride_relative_image.jsp");
		}else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='edit_bride_relative_info.jsp';"); 
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
