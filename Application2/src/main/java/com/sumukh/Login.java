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
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
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
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    try {
	    	PreparedStatement ps = con.prepareStatement("select * from admin where username=? and password=?");
	    	ps.setString(1,username);
	    	ps.setString(2, password);
	    	ResultSet rs = ps.executeQuery();
	    	if(rs.next()) {
	    		success = true;
	    	}else {
	    		success = false;
	    	}
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    if(success) {
	       HttpSession session = request.getSession(true);
	       session.setAttribute("username",username);
		   response.sendRedirect("dashboard.jsp");	
	    }else {
		    request.getSession(false); 
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Invalid Credentials');"); 
		    pw.println("location='administrator.jsp';"); 
		    pw.println("</script>"); 
	    }
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
