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

public class EditWeddingInfo extends HttpServlet {

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
	
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		boolean success = false;
		String wedding_date = request.getParameter("date");
	    int venue_id = Integer.parseInt(request.getParameter("venue_id"));
	    String time_from = request.getParameter("timefrom");
	    String time_to = request.getParameter("timeto");
	    int wedding_id = Integer.parseInt(request.getParameter("wedding_id"));
	    
	    try {
	    	PreparedStatement ps = con.prepareStatement("update wedding_info set wedding_date=?,wedding_from=?,wedding_to=?,venue_id=? where wedding_id=?");
	    	ps.setString(1, wedding_date);
	    	ps.setString(2, time_from);
	    	ps.setString(3, time_to);
	    	ps.setInt(4, venue_id);
	    	ps.setInt(5, wedding_id);
	    	ps.executeUpdate();
	    	success=true;
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    if(success) {
	    	 request.getSession(true);
	    	 response.sendRedirect("content_language.jsp");
	    }else {
    	    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='edit_wedding_info.jsp';"); 
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
