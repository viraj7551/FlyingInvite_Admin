<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flying Invite | Bride Relative Information</title>
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
			<h1>Edit Bride Relative <br> Information</h1>
			<span><a href="bride_relative_info.jsp" style="color:blue; margin-left:120px;"> Back</a></span>
		</div>
		<div class="section-filter-container">
			<div class="add_credentials_container">
				<form class="f1" autocomplete="off" action="/Application2/EditBrideRelativeInfo" method="post">
					<div class="input-field">
						<label class="lblbrf">R1 Firstname</label>
						<label class="lblbrl">R1 Lastname</label>
					</div>
					<div class="inputfield">
						<input style="width:60%" type="text" placeholder="First name* " name="relative1_firstname"/>
						<input style="width:60%" type="text" placeholder="Last name* " name="relative1_lastname" />
					</div>
					<div class="input-field">
						<label class="lblbrf">Relation 1 Type</label>
					</div>
				    <div class="input-field">
                         <input style="width:90%; padding:7px; margin:20px 0px" type="text" placeholder="Relation type* " name="relative1_relation_type"/>
					</div>
				     <div class="input-field">
						<label class="lblbrf">R2 Firstname</label>
						<label class="lblbrl">R2 Lastname</label>
					</div>
					<div class="inputfield">
						<input style="width:60%" type="text" placeholder="First name* " name="relative2_firstname"/>
						<input style="width:60%" type="text" placeholder="Last name* " name="relative2_lastname" />
					</div>
					<div class="input-field">
						<label class="lblbrf">Relation 2 Type</label>
					</div>
				    <div class="input-field">
                         <input style="width:90%; padding:7px; margin:20px 0px" type="text" placeholder="Relation type* " name="relative2_relation_type"/>
					</div>
					
					<div class="input-field">
						<label class="lblbrf">Select Bride</label>
					</div>
					
					
					<div class="inputfield">
					  <%
					  try{
			             Connection con = DriverManager.getConnection(url,username,password);
			             PreparedStatement ps = con.prepareStatement("select bride_id from bride_info ORDER BY bride_id DESC");
			             ResultSet rs = ps.executeQuery();
					  %>
						<select style="width:100%; padding: 10px;" name="bride_id">
						    <% while(rs.next()){ %>
							<option><%= rs.getInt("bride_id")%></option>
							<% } %>
		          <%
                       }
                       catch(Exception e){
        	             e.printStackTrace();
                       }
		        %>
						</select>
					</div>
					
					
					<div class="input-field">
						<label class="lblbrf">Select Bride Relative</label>
					</div>
					
				<div class="inputfield">
					  <%
					  try{
			             Connection con = DriverManager.getConnection(url,username,password);
			             PreparedStatement ps = con.prepareStatement("select bride_relative_id from bride_relative_info ORDER BY bride_relative_id DESC");
			             ResultSet rs = ps.executeQuery();
					  %>
						<select style="width:100%; padding: 10px;" name="bride_relative_id">
						    <% while(rs.next()){ %>
							<option value="<%= rs.getInt("bride_relative_id")%>"><%= rs.getInt("bride_relative_id")%></option>
							<% } %>
		          <%
                       }
                       catch(Exception e){
        	             e.printStackTrace();
                       }
		        %>
						</select>
					</div>

					<div class="formSubmit">
						<input type="submit" value="EDIT BRIDE RELATIVE">
					</div>
				</form>
			</div>
		</div>
    </section>
	<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>