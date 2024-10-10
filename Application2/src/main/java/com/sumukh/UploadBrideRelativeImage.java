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
		
		)  // Max file size: ~16MB

public class UploadBrideRelativeImage extends HttpServlet {
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
		 // Handle file upload
		boolean success = false;
		  Part filePart = request.getPart("bride_r1_image"); // Retrieves <input type="file" name="bride_image">
		  Part filePart2 = request.getPart("bride_r2_image");
	        String bride_relative_id= request.getParameter("bride_relative_id");
	        if ((filePart != null && filePart2 != null) && bride_relative_id != null) {
	        	InputStream inputStream1 = filePart.getInputStream();
	        	InputStream inputStream2 = filePart2.getInputStream();
	            try {
	                // Prepare SQL statement to insert binary data
	                String sql = "UPDATE bride_relative_info SET bride_relative1_image = ?, bride_relative2_image = ? WHERE bride_relative_id = ?";
	                try (PreparedStatement ps = con.prepareStatement(sql)) {
	                    ps.setBlob(1, inputStream1); // Set the binary stream
	                    ps.setBlob(2, inputStream2);
	                    ps.setInt(3, Integer.parseInt(bride_relative_id)); // Set the ID
	                    int row = ps.executeUpdate();
	                    if (row > 0) {
	                    	success=true;
	                        response.getWriter().println("Image uploaded and saved in the database successfully!");
	                    }
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	                response.getWriter().println("Error: " + e.getMessage());
	            }
	        } else {
	            response.getWriter().println("No file or ID provided!");
	        }
        
			PrintWriter pw = response.getWriter();
		if(success) {
		    request.getSession(true);
		    response.sendRedirect("groom_relative_info.jsp");	
		}else {
		    request.getSession(true);
		    pw.println("<script type=\"text/javascript\">"); 
		    pw.println("alert('Something went wrong');"); 
		    pw.println("location='upload_bride_relative_image.jsp';"); 
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