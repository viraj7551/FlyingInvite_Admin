
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flying Invite | Edit Venue Information</title>
<link rel="stylesheet" href="./css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">

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

<%
     Connection con;
     String driver = "com.mysql.cj.jdbc.Driver";
     String url = "jdbc:mysql://localhost:3306/sumukh";
     String username = "root";
     String password = "root";
     try{
    	 Class.forName(driver);
     }
     catch(Exception e){
    	 e.printStackTrace();
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
			<h1>Edit Venue <br> Information</h1>		
			<a href="venue_info.jsp" style="color:blue; margin-left:180px;">Back</a>
		</div>
		<div class="section-filter-container">
			<div class="add_credentials_container">
				<form class="f1" autocomplete="off" action="/Application2/EditVenueInfo"
					method="post" onSubmit="return validate3();">
					<div class="input-field">
						<label class="lbl">Select User</label>
					</div>
					<div class="inputfield">
					<%
					try{
			    	 con = DriverManager.getConnection(url, username, password);
			         PreparedStatement ps = con.prepareStatement("select * from user_info Order By userId Desc");
			         ResultSet rs = ps.executeQuery();
			         
					%>
						<select style="width:100%; padding: 10px;" name="user_id">
						   <%while(rs.next()){ %>
							<option value="<%= rs.getInt("userId") %>"><%= rs.getInt("userId") %></option>
							<% } %>
						</select>
					</div>
				    <%
                         }
                          catch(Exception e){
    	                    e.printStackTrace();
                         }
                     %>
                     
                    <div class="input-field">
						<label class="lbl">Select Venue</label>
					</div>
					
	             <div class="inputfield">
					<%
					try{
			    	 con = DriverManager.getConnection(url, username, password);
			         PreparedStatement ps = con.prepareStatement("select * from venue Order By venue_id Desc");
			         ResultSet rs = ps.executeQuery();
			         
					%>
						<select style="width:100%; padding: 10px;" name="venue_id">
						   <%while(rs.next()){ %>
							<option value="<%= rs.getInt("venue_id") %>"><%= rs.getInt("venue_id") %></option>
							<% } %>
						</select>
					</div>
				    <%
                         }
                          catch(Exception e){
    	                    e.printStackTrace();
                         }
                     %>
                     
					<div class="input-field">
						<label class="lbl">Enter Venue</label>
					</div>
					<div class="inputfield">
						<textarea style="width:150%; padding: 30px; font-size: 20px;" name="venue_info" id="" placeholder="venue"></textarea>
					</div>
					<div class="formSubmit">
						<input type="submit" value="EDIT VENUE">
					</div>
				</form>
			</div>
		</div>
    </section>
	<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>