
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flying Invite | Upload Bride Relative Image</title>
<link rel="stylesheet" href="./css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<head>
    <link rel="stylesheet" href=
"https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href=
"https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">


</head>
<link
	href="https://fonts.googleapis.com/css2?family=Grey+Qo&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
</head>
<body>
<%
   if(session.getAttribute("username") == null){
	   response.sendRedirect("administrator.jsp");
   }
%>

	<nav class="navbar">
		<div class="brand-loggo">
			<h3 class="brand-name grey-qo-regular">
				<a href="dashboard.jsp">F I</a>
			</h3>
		</div>

		<div class="menu-items">
			<ul>
				<li><a id="myaccount" class="menu-disable" href="javascript:submenu();">
						<h3><%= session.getAttribute("username") %></h3>
				</a></li>
			</ul>
		</div>	
		<div id="submenu_list_option" class="nav-sub-list">
			<ul>
				<li><a href="administrator.jsp">Log Out</a></li>
			</ul>
		</div>
	</nav>	
	<section>
	
	
	
	<div class="input-field form_heading">
				<h1>Bride Relative Image</h1>
				<span><a href="dashboard.jsp"> Back</a></span>
			</div>
			<div class="section-filter-container">
				<div class="add_credentials_container">
					<form class="f1" autocomplete="off" action="/Application2/UploadBrideRelativeImage"
						method="post" enctype="multipart/form-data">
						
						
						<div class="input-field">
							<label class="lbl">Select Relative Bride Id</label>
						</div>
						<%
						   String driver = "com.mysql.cj.jdbc.Driver";
						   String url = "jdbc:mysql://localhost:3306/sumukh";
						   String username = "root";
						   String password = "root";
						   try{
							   Class.forName(driver);
							   Connection con = DriverManager.getConnection(url, username, password);
							   PreparedStatement ps = con.prepareStatement("select bride_relative_id from bride_relative_info ORDER BY bride_relative_id DESC LIMIT 1 ");
							   ResultSet rs = ps.executeQuery();
							   while(rs.next()){
						%>
						<div class="inputfield">
							<select style="width:100%; padding: 10px;" name="bride_relative_id">
								<option><%= rs.getInt("bride_relative_id") %></option>
							</select>
						</div>
                        <%
							   }
						     }
	                          catch(Exception e){
	                        	  e.printStackTrace();
	                          }
						 
                        %>

						<div class="input-field">
							<label class="lbl">Relative 1 Image (Max file size: 16 MB)</label>
						</div>
						<div class="input-field">
                           <input style="margin-top:10px" type="file" id="myFile" name="bride_r1_image" required>				
						</div>
						<div class="input-field" style="margin-top: 35px;">
							<label class="lbl">Relative 2 Image (Max file size: 16 MB)</label>
						</div>
						<div class="input-field">
                           <input style="margin-top:10px" type="file" id="myFile" name="bride_r2_image" required>				
						</div>
						<div class="formSubmit" style="margin-top: 20px;">
							<input type="submit" value="Update Bride Relative Image">
						</div>
					</form>
				</div>
			</div>
		</section>
	<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>