package com.sumukh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Attendees extends HttpServlet {
	Connection con;
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/sumukh";
	private String username = "root";
	private String password = "root";
	
	public void init() {
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
      	String firstname = request.getParameter("firstname");
      	String lastname = request.getParameter("lastname");
      	String count = request.getParameter("guest_count");
      	String userId = request.getParameter("userId");
            boolean success = false;
            try{
              	if((count != null && !count.matches("^\\d+$")) && (userId != null && !userId.matches("^\\d+$")) && (firstname != null && !firstname.matches("^[a-zA-Z\\s]+$")) && (lastname != null && !lastname.matches("^[a-zA-Z\\s]+$"))){
         		    pw.println("<script type=\"text/javascript\">"); 
        		    pw.println("alert('please enter correct input values..');");
        		    pw.println("location='index.jsp';"); 
        		    pw.println("</script>"); 
              	}else {
                   if(firstname.length() > 20 || lastname.length() > 20) {
                	   if(firstname.length() > 20) {
                		pw.println("<script type=\"text/javascript\">"); 
               		    pw.println("alert('firstname length exceeds more than it's limit, should be less than 20 characters');");
               		    pw.println("location='index.jsp';"); 
               		    pw.println("</script>"); 
                	   }else if(lastname.length() > 20) {
                   		pw.println("<script type=\"text/javascript\">"); 
               		    pw.println("alert('lastname length exceeds more than it's limit, should be less than 20 characters');");
               		    pw.println("location='index.jsp';"); 
               		    pw.println("</script>"); 
                	   }else {
                   		pw.println("<script type=\"text/javascript\">"); 
               		    pw.println("alert('firstname and lastname length exceeds more than it's limit, should be less than 20 characters');");
               		    pw.println("location='index.jsp';"); 
               		    pw.println("</script>"); 
                	   }
                	   
                   }else {
                	    int recordCount = totalUserCount();
                         if(recordCount > 1000) {
                 		    pw.println("<script type=\"text/javascript\">"); 
                		    pw.println("alert('reached more than it's limits of 1000 records..!');");
                		    pw.println("location='index.jsp';"); 
                		    pw.println("</script>"); 
                         }else {
                      		boolean flag = isUserExist(firstname, lastname);
                      		if(!flag) {
                          		PreparedStatement ps2 = con.prepareStatement("insert into attendee_info(attendee_firstname,attendee_lastname,attendee_count,userId) values(?,?,?,?)");
                            	ps2.setString(1,firstname);
                                ps2.setString(2,lastname);
                                ps2.setInt(3,Integer.parseInt(count));
                                ps2.setInt(4,Integer.parseInt(userId));
                                ps2.executeUpdate();
                                success = true;	
                      		}else {
                      			success = false;
                      		}
                         }
                   }
              	}
            }
        
            catch(Exception e){
            	e.printStackTrace();
            }
            
            if(success){
            	pw.println("<script type=\"text/javascript\">"); 
      		    pw.println("alert('You record is saved successfully..');"); 
      		    pw.println("location='index.jsp';"); 
      		    pw.println("</script>"); 
            }else{
    		    pw.println("<script type=\"text/javascript\">"); 
    		    pw.println("alert('user record already exists..');");
    		    pw.println("location='index.jsp';"); 
    		    pw.println("</script>"); 
            }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public int totalUserCount() {
		int ans = 0;
		try {
			PreparedStatement ps = con.prepareStatement("select count(userId) as totalUser from user_info");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ans = rs.getInt("totalUser");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return ans;
	}
	
	public boolean isUserExist(String firstname, String lastname) {
		boolean success = false;
		try {
			PreparedStatement ps = con.prepareStatement("select * from user_info where firstname = ? and lastname = ?");
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ResultSet rs2 = ps.executeQuery();
			if(rs2.next()) {
				success = true;
			}else {
				success = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return success;
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
