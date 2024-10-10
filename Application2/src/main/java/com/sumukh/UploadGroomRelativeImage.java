package com.sumukh;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,  // 2MB: Files above this size are written to disk.
	    maxFileSize = 1024 * 1024 * 16,       // 10MB: Maximum file size allowed.
	    maxRequestSize = 1024 * 1024 * 50
		) 
public class UploadGroomRelativeImage extends HttpServlet {

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
	    Part filepart1 =  request.getPart("groom_r1_image");
	    Part filepart2 = request.getPart("groom_r2_image");
	    String groom_relative_id = request.getParameter("groom_relative_id");
	    if((filepart1 != null && filepart2 != null) && groom_relative_id != null) {
	    	InputStream is1 = filepart1.getInputStream();
	    	InputStream is2 = filepart2.getInputStream();
	    	
	    	try {
	    		PreparedStatement ps = con.prepareStatement("update groom_relative_info set groom_relative1_image=?, groom_relative2_image=? where groom_relative_id = ?");
	    		ps.setBlob(1, is1);
	    		ps.setBlob(2, is2);
	    		ps.setInt(3, Integer.parseInt(groom_relative_id));
	    		ps.executeUpdate();
	    		success = true;
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    }
	    
	    if(success) {
		    request.getSession(true);
            response.sendRedirect("wedding_info.jsp");
	    }else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='upload_groom_relative_image.jsp';"); 
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
