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

public class RemoveDetail extends HttpServlet {

	public Connection con;
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
		String userId =   request.getParameter("userId");
		String bride_id = request.getParameter("bride_id");
		String groom_id = request.getParameter("groom_id");
		String venue_id = request.getParameter("venue_id");
		
		//tables 
		String user_info = "user_info";
		String bride_info = "bride_info";
		String groom_info = "groom_info";
		String bride_relative_info = "bride_relative_info";
		String groom_relative_info = "groom_relative_info";
		String wedding_info = "wedding_info";
		String venue = "venue";
		String template_language = "template_language";
		String attendee_info = "attendee_info";
		
		boolean success = false;
		try {
			    String deleteParent1 = "DELETE FROM user_info WHERE userId = ?";
			    String deleteParent2 = "DELETE FROM bride_info WHERE bride_id = ?";
	            String deleteParent3 = "DELETE FROM groom_info WHERE groom_id = ?";
	            String deleteParent4 = "DELETE FROM venue WHERE venue_id = ?";
	            try {
	            	PreparedStatement stmt1 = con.prepareStatement(deleteParent1);
	            	PreparedStatement stmt2 = con.prepareStatement(deleteParent2);
	            	PreparedStatement stmt3 = con.prepareStatement(deleteParent3);
	            	PreparedStatement stmt4 = con.prepareStatement(deleteParent4);
	            	 
	            	if (userId != null) {
	                    stmt1.setInt(1,Integer.parseInt(userId));
	                    stmt1.executeUpdate();
	                }
	                if (bride_id != null) {
	                    stmt2.setInt(1,Integer.parseInt(bride_id));
	                    stmt2.executeUpdate();
	                }
	                if (groom_id != null) {
	                    stmt3.setInt(1,Integer.parseInt(groom_id));
	                    stmt3.executeUpdate();
	                }
	                if (venue_id != null) {
	                    stmt4.setInt(1, Integer.parseInt(venue_id));
	                    stmt4.executeUpdate();
	                }
	                success = true;
	                resetAutoIncrement(con,user_info);
	                resetAutoIncrement(con,bride_info);
	                resetAutoIncrement(con,groom_info);
	                resetAutoIncrement(con,bride_relative_info);
	                resetAutoIncrement(con,groom_relative_info);
	                resetAutoIncrement(con,bride_info);
	                resetAutoIncrement(con,wedding_info);
	                resetAutoIncrement(con,venue);
	                resetAutoIncrement(con,template_language);
	                resetAutoIncrement(con,attendee_info);
	                
	            }
	            
	            catch(Exception e) {
	            	e.printStackTrace();
	            }

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(success) {
		    request.getSession(false); 
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('record deleted successfully..!');"); 
		    pw.println("location='dashboard.jsp';"); 
		    pw.println("</script>"); 
		}else {
		    request.getSession(false); 
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='view_records.jsp';"); 
		    pw.println("</script>"); 
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
    private void resetAutoIncrement(Connection conn, String tableName) throws SQLException {
        String resetAutoIncrementSQL = "ALTER TABLE " + tableName + " AUTO_INCREMENT = 1";
        try {
        	PreparedStatement ps2 = con.prepareStatement(resetAutoIncrementSQL);
        	ps2.executeUpdate();
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
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
