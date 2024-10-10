package com.sumukh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInfo extends HttpServlet {
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
		String user_firstname = request.getParameter("user_firstname");
		String user_lastname = request.getParameter("user_lastname");
		String user_phone = request.getParameter("user_phone");
		String userId = request.getParameter("userId");		
		boolean isUserPresent = read_record(userId);
		boolean success = false;
		if(isUserPresent) {
			success = update_record(user_firstname, user_lastname, user_phone, userId);
		}else {
			success = insert_record(user_firstname, user_lastname, user_phone);
		}
		
		if(success) {
		    request.getSession(true);
			response.sendRedirect("bride_info.jsp");
		}else {
		    request.getSession(true); 
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='user_info.jsp';"); 
		    pw.println("</script>"); 
		}

	}
	
	public boolean read_record(String userId) {
		boolean success =false;
		try {
			PreparedStatement ps = con.prepareStatement("select * from user_info where userId=?");
			   ps.setInt(1, Integer.parseInt(userId));
			   ResultSet rs = ps.executeQuery();
			   if(rs.next()) {
				   success = true;   
			   }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return success;
	}
	
	public boolean update_record(String firstname, String lastname, String phone,String userId) {
		boolean success =false;
		try {
			PreparedStatement ps = con.prepareStatement("update user_info set firstname=?, lastname=?, phone=? where userId=?");
			   ps.setString(1, firstname);
			   ps.setString(2, lastname);
			   ps.setString(3, phone);
			   ps.setInt(4, Integer.parseInt(userId));
			   ps.executeUpdate();
			   success = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return success;
	}
	
	public boolean insert_record(String firstname, String lastname, String phone) {
		boolean success = false;
		try {
		   PreparedStatement ps = con.prepareStatement("insert into user_info(firstname, lastname, phone)values(?,?,?)");
		   ps.setString(1, firstname);
		   ps.setString(2, lastname);
		   ps.setString(3, phone);
		   ps.executeUpdate();
		   success = true;
		}
		catch(Exception e) {
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
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	}
}
