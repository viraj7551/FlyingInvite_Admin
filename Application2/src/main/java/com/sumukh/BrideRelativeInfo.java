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

public class BrideRelativeInfo extends HttpServlet {

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
        PrintWriter pw = response.getWriter(); 
		response.setContentType("text/html");
        boolean success = false;
		String bride_relative1_firstname = request.getParameter("relative1_firstname");
        String bride_relative1_lastname = request.getParameter("relative1_lastname");
        String bride_relative1_type = request.getParameter("relative1_relation_type");
        String bride_relative2_firstname = request.getParameter("relative2_firstname");
        String bride_relative2_lastname = request.getParameter("relative2_lastname");
        String bride_relative2_type = request.getParameter("relative2_relation_type");
        int bride_id = Integer.parseInt(request.getParameter("brideId"));
		try {
          PreparedStatement ps = con.prepareStatement("insert into bride_relative_info(bride_relative1_firstname, bride_relative1_lastname, bride_relative1_type, bride_id, bride_relative2_firstname, bride_relative2_lastname, bride_relative2_type) values(?,?,?,?,?,?,?)");
          ps.setString(1, bride_relative1_firstname);
          ps.setString(2, bride_relative1_lastname);
          ps.setString(3, bride_relative1_type);
          ps.setInt(4, bride_id);
          ps.setString(5, bride_relative2_firstname);
          ps.setString(6, bride_relative2_lastname);
          ps.setString(7, bride_relative2_type);
          ps.executeUpdate();
          success = true;
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
		    pw.println("location='bride_relative_info.jsp';"); 
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
			e.printStackTrace();
		}
	}
}
