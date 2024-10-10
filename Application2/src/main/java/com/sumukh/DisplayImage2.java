package com.sumukh;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Blob;

public class DisplayImage2 extends HttpServlet {
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
	    // Set content type to display the image
        response.setContentType("image/jpeg"); // or "image/png" depending on your image type

        // Get the ID parameter from the request
        String id = request.getParameter("groom_id"); 

        if (id != null) {
            try {
                // Prepare SQL statement to retrieve the image data
                String sql = "SELECT groom_image FROM groom_info WHERE groom_id = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, Integer.parseInt(id)); // Set the ID to the prepared statement
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        Blob blob = (Blob) rs.getBlob("groom_image");
                        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
                        // Write the image to the response's output stream
                        OutputStream os = response.getOutputStream();
                        os.write(imageBytes);
                        os.flush();
                        os.close();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().println("No image found for the given ID.");
        }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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