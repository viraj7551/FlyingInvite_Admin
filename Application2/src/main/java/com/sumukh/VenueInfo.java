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

public class VenueInfo extends HttpServlet {
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
		String venue_address = request.getParameter("venue_info");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		try {
			PreparedStatement ps = con.prepareStatement("insert into venue(venue_address, userId) values(?,?)");
			ps.setString(1, venue_address);
			ps.setInt(2, user_id);
			ps.executeUpdate();
			success= true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(success) {
			response.sendRedirect("bride_relative_info.jsp");
		}else {
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='venue_info.jsp';"); 
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
