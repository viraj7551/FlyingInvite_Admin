<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Flying Invite | Special Invitation</title>

        <!-- CSS FILES -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@400;700&family=Playfair+Display&display=swap" rel="stylesheet">

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap-icons.css" rel="stylesheet">

        <link href="css/magnific-popup.css" rel="stylesheet">

        <link href="css/tooplate-wedding-lite.css" rel="stylesheet">
        
    </head>
    
    <body>
    
    <%
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/sumukh";
        String username = "root";
        String password = "root";
        ResultSet rs = null;
        Connection con = null;
        PreparedStatement ps = null;
        try{
        	Class.forName(driver);
        	con = DriverManager.getConnection(url,username,password);
        	ps= con.prepareStatement("select * from user_info Inner Join bride_info using(userId) Inner Join groom_info using(userId) Inner Join venue using(userId) Inner Join bride_relative_info using(bride_id) Inner Join groom_relative_info using(groom_id) Inner Join wedding_info using(venue_id) Inner Join template_language using(userId) Where userId = ?;");
        	ps.setInt(1, 2);
            rs = ps.executeQuery();
            if(rs.next()){
    %>

  <% 
     String template_title = rs.getString("template_language_title");
     if(template_title.equals("Hindi")){
    	 
  %>


        <section class="preloader">
            <div class="spinner">
                <span class="spinner-rotate">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                    </svg>
                </span>    
            </div>
        </section>

        <nav class="navbar navbar-expand-lg">
            <div class="container">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a href="#" class="navbar-brand mx-auto mx-lg-0">

                    <span><%= rs.getString("groom_firstname") %></span>
                    
                    <i class="bi-heart brand-icon"></i>
                    <span><%= rs.getString("bride_firstname") %></span>
                </a>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_1">मुख्यपृष्ठ
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_2">वर-वधू </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_3">विवाह स्थल</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_4">माता - पिता</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_5">रिश्तेदार उपलब्ध संख्या
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_6">आमंत्रण</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link click-scroll" href="#section_7">संपर्क</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>

        <main>

<section class="hero-section d-flex" id="section_1">
                     <!-- Hero -->
<div class="p-5 text-center bg-image rounded-3" style="
    background-image: url('./images/test4.png');
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    width: 100%;
    height: 670px;
  ">
    <div class="d-flex justify-content-center align-items-center h-100">
        <div class="col-lg-3 col-12 save-the-date-wrap mt-auto ms-lg-auto">
            <div class="save-the-date-thumb">
                <h4 class="save-the-date-title">Save the date</h4>

                <div class="save-the-date-body">
                    <span class="date"><%= rs.getString("wedding_date") %></span>
                </div>
            </div>
        </div>
  </div>
</div>
<!-- Hero -->
            </section>


            <section class="about-section section-padding" id="section_2">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12">
                            <div class="section-title-wrap mb-5">
                                <h2 class="section-title">वर-वधू</h2>

                                <div class="section-title-bottom">
                                    <span class="section-title-line"></span>
                                    <i class="section-title-icon bi-heart-fill"></i>
                                    <span class="section-title-line"></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-12">
                            <div class="image-hover-thumb">
                                <img src="DisplayImage2?groom_id=2" class="about-image img-fluid" alt="groom image">
                            </div>
                        </div>

                        <div class="col-lg-3 col-12">
                            <div class="about-info-wrap d-flex flex-column">
                                <div class="about-info-title d-flex align-items-center my-3">
                                    <h4><%= rs.getString("groom_firstname")+" "+rs.getString("groom_lastname") %></h4>

                                    <span class="about-tag ms-2">वर</span>
                                </div>

                                <p> उम्र : <span><%=rs.getString("groom_age") %></span></p>
                                <p> पेशा : <span><%=rs.getString("groom_proffession") %></span></p>
                                <!-- <div class="social-icon-wrap mt-auto">
                                    <ul class="social-icon ms-auto">
                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                    </ul>
                                </div> -->
                            </div>
                        </div>

                        <div class="col-lg-3 col-12">
                            <div class="image-hover-thumb">
                                <img src="DisplayImage?bride_id=2" class="about-image img-fluid" alt="bride image">
                            </div>
                        </div>

                        <div class="col-lg-3 col-12">
                            <div class="about-info-wrap d-flex flex-column">
                                <div class="about-info-title d-flex align-items-center my-3">
                                    <h4><%=rs.getString("bride_firstname")+" "+rs.getString("bride_lastname") %></h4>

                                    <span class="about-tag ms-2">वधू</span>
                                </div>

                                <p> उम्र : <span><%= rs.getString("bride_age") %></span></p>
                                <p> पेशा : <span><%=rs.getString("bride_proffession") %></span></p>

                                <!-- <div class="social-icon-wrap mt-auto">
                                    <ul class="social-icon ms-auto">
                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                        <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                    </ul>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="the-wedding-section section-bg section-padding" id="section_3">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12">
                            <div class="section-title-wrap mb-5">
                                <h2 class="section-title">विवाह स्थल</h2>

                                <div class="section-title-bottom">
                                    <span class="section-title-line"></span>
                                    <i class="section-title-icon bi-heart-fill"></i>
                                    <span class="section-title-line"></span>
                                </div>
                            </div>
                        </div>

                        <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column mb-4 mb-lg-0 mb-md-0">
                            <div class="image-hover-thumb">
                                <img src="images/decorated-table-setting-wedding-celebration.jpg" class="img-fluid" alt="">
                            </div>

                            <div class="section-block">
                                <h3 class="my-3">The Reception</h3>

                                <p class="mb-2">
                                    <i class="bi-geo-alt me-1"></i>
                                    5th Avenue at, Central Park S
                                </p>

                                <p>
                                    <i class="bi-clock me-1"></i>
                                    5:00 PM
                                </p>
                            </div>
                        </div> -->

                        <div class="flex-column justify-content-center">
                            <div class="image-hover-thumb">
                                <img src="images/test3.jpg" class="img-fluid" alt="">
                            </div>

                            <div class="section-block text-center">
                                <h3 class="my-3">विवाह समारोह</h3>

                                <p class="mb-2">
                                    <i class="bi-geo-alt me-1"></i>
                                    <%= rs.getString("venue_address") %>
                                </p>

                                <p>
                                    <i class="bi-clock me-1"></i>
                                    <%=rs.getString("wedding_from") %> to <%= rs.getString("wedding_to") %>
                                </p>
                            </div>
                        </div>

                        <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column">
                            <iframe class="google-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8046.475092226252!2d-73.9752829999323!3d40.766655075110314!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c258f07d5da561%3A0x61f6aa300ba8339d!2sThe%20Plaza!5e1!3m2!1sen!2ssg!4v1662129560604!5m2!1sen!2ssg" width="100%" height="310" allowfullscreen="" loading="lazy"></iframe>

                            <div class="section-block">
                                <h3 class="my-3">Location</h3>

                                <p class="mb-2">
                                    <i class="bi-geo-alt me-1"></i>
                                    5th Avenue at, Central Park S, New York, NY 10019, United States
                                </p>
                            </div>
                        </div> -->

                    </div>
                </div>
            </section>

            <section class="people-section section-padding" id="section_4">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12">
                            <div class="section-title-wrap mb-5">
                                <h2 class="section-title">माता - पिता</h2>

                                <div class="section-title-bottom">
                                    <span class="section-title-line"></span>
                                    <i class="section-title-icon bi-heart-fill"></i>
                                    <span class="section-title-line"></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-5 col-12 me-auto">
                            <nav>
                                <div class="nav nav-tabs flex-lg-column align-items-baseline" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-groomsmen-tab" data-bs-toggle="tab" data-bs-target="#nav-groomsmen" type="button" role="tab" aria-controls="nav-groomsmen" aria-selected="true">
                                        <h3>वरपक्ष</h3>
                                    </button>

                                    <button class="nav-link" id="nav-bridesmaid-tab" data-bs-toggle="tab" data-bs-target="#nav-bridesmaid" type="button" role="tab" aria-controls="nav-bridesmaid" aria-selected="false">
                                        <h3>वधुपक्ष</h3>
                                    </button>
                                </div>
                            </nav>
                        </div>

                        <div class="col-lg-8 col-md-6 col-12">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-groomsmen" role="tabpanel" aria-labelledby="nav-groomsmen-tab">
                                    <div class="row">
                                       <div class="col-lg-6 col-12">
                                            <div class="people-thumb image-hover-thumb">
                                                <img src="GR1DisplayImage?groom_relative_id=2" class="people-image img-fluid" alt="groom relative 1 image">
                                            </div>
                                       </div> 

                                       <div class="col-lg-6 col-12">
                                            <div class="section-block">
                                                <div class="d-flex align-items-center my-3">
                                                    <h4 class="mb-0"><%= rs.getString("groom_relative1_firstname")+" "+rs.getString("groom_relative1_lastname") %></h4>
                                                    <span class="about-tag ms-2"><%= rs.getString("groom_relative1_type") %></span>
                                                </div>
                                            </div>
                                       </div>

                                       <div class="col-lg-6 col-12">
                                            <div class="people-thumb image-hover-thumb">
                                                <img src="GR2DisplayImage?groom_relative_id=2" class="people-image img-fluid" alt="groom relative 2 image">
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-12">
                                            <div class="section-block">
                                                <div class="d-flex align-items-center my-3">
                                                    <h4 class="mb-0"><%= rs.getString("groom_relative2_firstname")+" "+rs.getString("groom_relative2_lastname") %></h4>
                                                    <span class="about-tag ms-2"><%= rs.getString("groom_relative2_type") %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade show" id="nav-bridesmaid" role="tabpanel" aria-labelledby="nav-bridesmaid-tab">
                                    <div class="row">
                                       <div class="col-lg-6 col-12">
                                            <div class="people-thumb image-hover-thumb">
                                                <img src="BR1DisplayImage?bride_relative_id=2" class="people-image img-fluid" alt="bride relative1 image">
                                            </div>
                                       </div> 

                                       <div class="col-lg-6 col-12">
                                            <div class="section-block">
                                                <div class="d-flex align-items-center my-3">
                                                    <h4 class="mb-0"><%= rs.getString("bride_relative1_firstname")+" "+rs.getString("bride_relative1_lastname") %></h4>
                                                    <span class="about-tag ms-2"><%= rs.getString("bride_relative1_type") %></span>
                                                </div>
                                            </div>
                                       </div>
                                       <div class="col-lg-6 col-12">
                                        <div class="people-thumb image-hover-thumb">
                                            <img src="BR2DisplayImage?bride_relative_id=2" class="people-image img-fluid" alt="bride relative2 image">
                                        </div>
                                   </div> 
                                        <div class="col-lg-6 col-12">
                                            <div class="section-block">
                                                <div class="d-flex align-items-center my-3">
                                                    <h4 class="mb-0"><%= rs.getString("bride_relative2_firstname")+" "+rs.getString("bride_relative2_lastname") %></h4>

                                                    <span class="about-tag ms-2"><%= rs.getString("bride_relative2_type") %></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
            </section>
            

            <section class="gallery-section section-bg section-padding" id="section_5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12">
                            <div class="section-title-wrap mb-5">
                                <h2 class="section-title">रिश्तेदार उपलब्ध संख्या
                               </h2>

                                <div class="section-title-bottom">
                                    <span class="section-title-line"></span>
                                    <i class="section-title-icon bi-heart-fill"></i>
                                    <span class="section-title-line"></span>
                                </div>
                            </div>
                        </div>
                        
                        <%
                    	PreparedStatement ps2 = null;  
                        ResultSet rs2 = null;
                        try {

                        	ps2 = con.prepareStatement("select Sum(attendee_count) as totalAttendee from attendee_info where userId=?");
                        	ps2.setInt(1,2);
                        	rs2 = ps2.executeQuery();
                        	if(rs2.next()) {
                        
                        %>
                        <div class="col-lg-12 col-12 text-center f-6">
                          <p class="fs-1"><%=rs2.getInt("totalAttendee") %></p>
                        </div>
                        <%
                        
                        	}
                        	
                        }
                        catch(Exception e) {
                        	e.printStackTrace();
                        }
                        finally {
                            // Close resources
                            try { 
                            	if (rs2 != null) 
                            		rs2.close(); 
                            	
                            	if (ps2 != null) 
                            		ps2.close();
                            }
                            catch (SQLException e) { 
                            	e.printStackTrace();
                            }
                        }
                        %>                    
                    </div>
                </div>
            </section>


            <section class="rsvp-section section-padding" id="section_6">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 col-12 mx-auto">
                            <div class="rsvp-form-wrap">
                                <div class="section-title-wrap mb-5">
                                    <h2 class="section-title">आमंत्रण <p class="fs-4">You are Invited</p></h2>

                                    <div class="section-title-bottom">
                                        <span class="section-title-line"></span>
                                        <i class="section-title-icon bi-heart-fill"></i>
                                        <span class="section-title-line"></span>
                                    </div>
                                </div>
                                
                                 <div class="alert alert-danger" id="errorMsg" role="alert" style="display:none;">
                                      
                                 </div>

                                <h5 class="mb-4">Will you attend? <span class="text-muted">Please reserve before <span><%= rs.getString("wedding_date") %> </span></span></h5>

                                <form class="custom-form rsvp-form" role="form" name="f1" action="/Application2/Attendees" method="post" onSubmit="return attendee_detail();">
                                    <div class="row">
                                           <div class="col-lg-3 col-md-6 col-12">
                                            <input type="text" name="userId" id="userId" class="form-control" placeholder="First Name*" value="<%=rs.getString("userId") %>" readonly>
                                        </div>
                                        
                                        <div class="col-lg-3 col-md-6 col-12">
                                            <input type="text" name="firstname" id="firstname" class="form-control" placeholder="First Name*" required>
                                        </div>

                                        <div class="col-lg-3 col-md-6 col-12"> 
                                            <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Last Name*" required>
                                        </div>

                                        <div class="col-lg-3 col-12"> 
                                            <select name="guest_count" class="form-select" id="guests" aria-label="Guests">
                                                <option selected>Number of Attendees</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="6">7</option>
                                                <option value="6">8</option>
                                            </select>
                                        </div>

                                        <div class="col-lg-3 col-5 mx-auto">
                                            <button type="submit" class="form-control">Accept Invitation</button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            
            

            <section class="contact-section section-bg section-padding" id="section_7">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-12">
                            <div class="section-title-wrap mb-5">
                                <h2 class="section-title">संपर्क</h2>

                                <div class="section-title-bottom">
                                    <span class="section-title-line"></span>
                                    <i class="section-title-icon bi-heart-fill"></i>
                                    <span class="section-title-line"></span>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 text-center">
                            <h4 class="mb-4">Contact Information</h4>
                            <p class="mb-2">
                                <a href="tel: 090-080-0760">
                                    <%= rs.getString("phone") %>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12 mx-auto">
                        <a href="index.jsp" class="navbar-brand mx-auto mx-lg-0">
                            <span><%= rs.getString("groom_firstname") %></span>
                            <i class="bi-heart brand-icon"></i>
                            <span><%= rs.getString("bride_firstname") %></span>
                        </a>
                    </div>

                </div>
            </div>
        </footer>
<%
     }
     else if(template_title.equals("Marathi")){
 %>
    	   <section class="preloader">
           <div class="spinner">
               <span class="spinner-rotate">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                     <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                   </svg>
               </span>    
           </div>
       </section>

       <nav class="navbar navbar-expand-lg">
           <div class="container">

               <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
               </button>

               <a href="#" class="navbar-brand mx-auto mx-lg-0">

                   <span><%= rs.getString("groom_firstname") %></span>
                   
                   <i class="bi-heart brand-icon"></i>
                   <span><%= rs.getString("bride_firstname") %></span>
               </a>

               <div class="collapse navbar-collapse" id="navbarNav">
                   <ul class="navbar-nav ms-auto">
                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_1">मुख्यपृष्ठ
                           </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_2">वर-वधू </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_3">लग्नाचे ठिकाण</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_4">आई -वडील</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_5">अतिथी उपस्थिती
                           </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_6">आमंत्रण</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_7">संपर्क</a>
                       </li>
                   </ul>
               </div>

           </div>
       </nav>

       <main>

<section class="hero-section d-flex" id="section_1">
                    <!-- Hero -->
<div class="p-5 text-center bg-image rounded-3" style="
   background-image: url('./images/test4.png');
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 100%;
   height: 670px;
 ">
   <div class="d-flex justify-content-center align-items-center h-100">
       <div class="col-lg-3 col-12 save-the-date-wrap mt-auto ms-lg-auto">
           <div class="save-the-date-thumb">
               <h4 class="save-the-date-title">Save the date</h4>

               <div class="save-the-date-body">
                   <span class="date"><%= rs.getString("wedding_date") %></span>
               </div>
           </div>
       </div>
 </div>
</div>
<!-- Hero -->
           </section>


           <section class="about-section section-padding" id="section_2">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">वर-वधू</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="image-hover-thumb">
                               <img src="DisplayImage2?groom_id=5" class="about-image img-fluid" alt="groom image">
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="about-info-wrap d-flex flex-column">
                               <div class="about-info-title d-flex align-items-center my-3">
                                   <h4><%= rs.getString("groom_firstname")+" "+rs.getString("groom_lastname") %></h4>

                                   <span class="about-tag ms-2">वर</span>
                               </div>

                               <p> उम्र : <span><%=rs.getString("groom_age") %></span></p>
                               <p> पेशा : <span><%=rs.getString("groom_proffession") %></span></p>
                               <!-- <div class="social-icon-wrap mt-auto">
                                   <ul class="social-icon ms-auto">
                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                   </ul>
                               </div> -->
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="image-hover-thumb">
                               <img src="DisplayImage?bride_id=7" class="about-image img-fluid" alt="bride image">
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="about-info-wrap d-flex flex-column">
                               <div class="about-info-title d-flex align-items-center my-3">
                                   <h4><%=rs.getString("bride_firstname")+" "+rs.getString("bride_lastname") %></h4>

                                   <span class="about-tag ms-2">वधू</span>
                               </div>

                               <p> उम्र : <span><%= rs.getString("bride_age") %></span></p>
                               <p> पेशा : <span><%=rs.getString("bride_proffession") %></span></p>

                               <!-- <div class="social-icon-wrap mt-auto">
                                   <ul class="social-icon ms-auto">
                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                   </ul>
                               </div> -->
                           </div>
                       </div>
                   </div>
               </div>
           </section>

           <section class="the-wedding-section section-bg section-padding" id="section_3">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">लग्नाचे ठिकाण</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column mb-4 mb-lg-0 mb-md-0">
                           <div class="image-hover-thumb">
                               <img src="images/decorated-table-setting-wedding-celebration.jpg" class="img-fluid" alt="">
                           </div>

                           <div class="section-block">
                               <h3 class="my-3">The Reception</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   5th Avenue at, Central Park S
                               </p>

                               <p>
                                   <i class="bi-clock me-1"></i>
                                   5:00 PM
                               </p>
                           </div>
                       </div> -->

                       <div class="flex-column justify-content-center">
                           <div class="image-hover-thumb">
                               <img src="images/test3.jpg" class="img-fluid" alt="">
                           </div>

                           <div class="section-block text-center">
                               <h3 class="my-3">लग्न समारंभ</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   <%= rs.getString("venue_address") %>
                               </p>

                               <p>
                                   <i class="bi-clock me-1"></i>
                                   <%=rs.getString("wedding_from") %> to <%= rs.getString("wedding_to") %>
                               </p>
                           </div>
                       </div>

                       <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column">
                           <iframe class="google-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8046.475092226252!2d-73.9752829999323!3d40.766655075110314!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c258f07d5da561%3A0x61f6aa300ba8339d!2sThe%20Plaza!5e1!3m2!1sen!2ssg!4v1662129560604!5m2!1sen!2ssg" width="100%" height="310" allowfullscreen="" loading="lazy"></iframe>

                           <div class="section-block">
                               <h3 class="my-3">Location</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   5th Avenue at, Central Park S, New York, NY 10019, United States
                               </p>
                           </div>
                       </div> -->

                   </div>
               </div>
           </section>

           <section class="people-section section-padding" id="section_4">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">आई -वडील</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-lg-3 col-md-5 col-12 me-auto">
                           <nav>
                               <div class="nav nav-tabs flex-lg-column align-items-baseline" id="nav-tab" role="tablist">
                                   <button class="nav-link active" id="nav-groomsmen-tab" data-bs-toggle="tab" data-bs-target="#nav-groomsmen" type="button" role="tab" aria-controls="nav-groomsmen" aria-selected="true">
                                       <h3>वरपक्ष</h3>
                                   </button>

                                   <button class="nav-link" id="nav-bridesmaid-tab" data-bs-toggle="tab" data-bs-target="#nav-bridesmaid" type="button" role="tab" aria-controls="nav-bridesmaid" aria-selected="false">
                                       <h3>वधुपक्ष</h3>
                                   </button>
                               </div>
                           </nav>
                       </div>

                       <div class="col-lg-8 col-md-6 col-12">
                           <div class="tab-content" id="nav-tabContent">
                               <div class="tab-pane fade show active" id="nav-groomsmen" role="tabpanel" aria-labelledby="nav-groomsmen-tab">
                                   <div class="row">
                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="GR1DisplayImage?groom_relative_id=5" class="people-image img-fluid" alt="groom relative 1 image">
                                           </div>
                                      </div> 

                                      <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("groom_relative1_firstname")+" "+rs.getString("groom_relative1_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("groom_relative1_type") %></span>
                                               </div>
                                           </div>
                                      </div>

                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="GR2DisplayImage?groom_relative_id=5" class="people-image img-fluid" alt="groom relative 2 image">
                                           </div>
                                       </div>

                                       <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("groom_relative2_firstname")+" "+rs.getString("groom_relative2_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("groom_relative2_type") %></span>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="tab-pane fade show" id="nav-bridesmaid" role="tabpanel" aria-labelledby="nav-bridesmaid-tab">
                                   <div class="row">
                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="BR1DisplayImage?bride_relative_id=5" class="people-image img-fluid" alt="bride relative1 image">
                                           </div>
                                      </div> 

                                      <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("bride_relative1_firstname")+" "+rs.getString("bride_relative1_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("bride_relative1_type") %></span>
                                               </div>
                                           </div>
                                      </div>
                                      <div class="col-lg-6 col-12">
                                       <div class="people-thumb image-hover-thumb">
                                           <img src="BR2DisplayImage?bride_relative_id=5" class="people-image img-fluid" alt="bride relative2 image">
                                       </div>
                                  </div> 
                                       <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("bride_relative2_firstname")+" "+rs.getString("bride_relative2_lastname") %></h4>

                                                   <span class="about-tag ms-2"><%= rs.getString("bride_relative2_type") %></span>
                                               </div>

                                           </div>
                                       </div>
                                   </div>
                               </div>

                           </div>
                       </div>


                   </div>
               </div>
           </section>
           

           <section class="gallery-section section-bg section-padding" id="section_5">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">अतिथी उपस्थिती संख्या
                              </h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>
                       
                       <%
                   	PreparedStatement ps2 = null;  
                       ResultSet rs2 = null;
                       try {

                       	ps2 = con.prepareStatement("select Sum(attendee_count) as totalAttendee from attendee_info where userId=?");
                       	ps2.setInt(1,2);
                       	rs2 = ps2.executeQuery();
                       	if(rs2.next()) {
                       
                       %>
                       <div class="col-lg-12 col-12 text-center f-6">
                         <p class="fs-1"><%=rs2.getInt("totalAttendee") %></p>
                       </div>
                       <%
                       
                       	}
                       	
                       }
                       catch(Exception e) {
                       	e.printStackTrace();
                       }
                       finally {
                           // Close resources
                           try { 
                           	if (rs2 != null) 
                           		rs2.close(); 
                           	
                           	if (ps2 != null) 
                           		ps2.close();
                           }
                           catch (SQLException e) { 
                           	e.printStackTrace();
                           }
                       }
                       %>                    
                   </div>
               </div>
           </section>


           <section class="rsvp-section section-padding" id="section_6">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-8 col-12 mx-auto">
                           <div class="rsvp-form-wrap">
                               <div class="section-title-wrap mb-5">
                                   <h2 class="section-title">आमंत्रण <p class="fs-4">You are Invited</p></h2>

                                   <div class="section-title-bottom">
                                       <span class="section-title-line"></span>
                                       <i class="section-title-icon bi-heart-fill"></i>
                                       <span class="section-title-line"></span>
                                   </div>
                               </div>
                               
                                <div class="alert alert-danger" id="errorMsg" role="alert" style="display:none;">
                                     
                                </div>

                               <h5 class="mb-4">Will you attend? <span class="text-muted">Please reserve before <span><%= rs.getString("wedding_date") %> </span></span></h5>

                               <form class="custom-form rsvp-form" role="form" name="f1" action="/Application2/Attendees" method="post" onSubmit="return attendee_detail();">
                                   <div class="row">
                                          <div class="col-lg-3 col-md-6 col-12">
                                           <input type="text" name="userId" id="userId" class="form-control" placeholder="First Name*" value="<%=rs.getString("userId") %>" readonly>
                                       </div>
                                       
                                       <div class="col-lg-3 col-md-6 col-12">
                                           <input type="text" name="firstname" id="firstname" class="form-control" placeholder="First Name*" required>
                                       </div>

                                       <div class="col-lg-3 col-md-6 col-12"> 
                                           <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Last Name*" required>
                                       </div>

                                       <div class="col-lg-3 col-12"> 
                                           <select name="guest_count" class="form-select" id="guests" aria-label="Guests">
                                               <option selected>Number of Attendees</option>
                                               <option value="1">1</option>
                                               <option value="2">2</option>
                                               <option value="3">3</option>
                                               <option value="4">4</option>
                                               <option value="5">5</option>
                                               <option value="6">6</option>
                                               <option value="6">7</option>
                                               <option value="6">8</option>
                                           </select>
                                       </div>

                                       <div class="col-lg-3 col-5 mx-auto">
                                           <button type="submit" class="form-control">Accept Invitation</button>
                                       </div>

                                   </div>
                               </form>
                           </div>
                       </div>

                   </div>
               </div>
           </section>
           
           

           <section class="contact-section section-bg section-padding" id="section_7">
               <div class="container">
                   <div class="row">
                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">संपर्क</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-12 text-center">
                           <h4 class="mb-4">Contact Information</h4>
                           <p class="mb-2">
                               <a href="tel: 090-080-0760">
                                   <%= rs.getString("phone") %>
                               </a>
                           </p>
                       </div>
                   </div>
               </div>
           </section>

       </main>

       <footer class="site-footer">
           <div class="container">
               <div class="row">
                   <div class="col-lg-3 col-12 mx-auto">
                       <a href="index.jsp" class="navbar-brand mx-auto mx-lg-0">
                           <span><%= rs.getString("groom_firstname") %></span>
                           <i class="bi-heart brand-icon"></i>
                           <span><%= rs.getString("bride_firstname") %></span>
                       </a>
                   </div>

               </div>
           </div>
       </footer>
       
 <%
     } else{
 %>	 
    	    <section class="preloader">
           <div class="spinner">
               <span class="spinner-rotate">
                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                     <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                   </svg>
               </span>    
           </div>
       </section>

       <nav class="navbar navbar-expand-lg">
           <div class="container">

               <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
               </button>

               <a href="#" class="navbar-brand mx-auto mx-lg-0">

                   <span><%= rs.getString("groom_firstname") %></span>
                   
                   <i class="bi-heart brand-icon"></i>
                   <span><%= rs.getString("bride_firstname") %></span>
               </a>

               <div class="collapse navbar-collapse" id="navbarNav">
                   <ul class="navbar-nav ms-auto">
                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_1">HomePage
                           </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_2">Groom-Bride </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_3">WeddingPlace</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_4">Mother-Father</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_5">Attendees
                           </a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_6">Invitation</a>
                       </li>

                       <li class="nav-item">
                           <a class="nav-link click-scroll" href="#section_7">Contact</a>
                       </li>
                   </ul>
               </div>

           </div>
       </nav>

       <main>

<section class="hero-section d-flex" id="section_1">
                    <!-- Hero -->
<div class="p-5 text-center bg-image rounded-3" style="
   background-image: url('./images/test4.png');
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 100%;
   height: 670px;
 ">
   <div class="d-flex justify-content-center align-items-center h-100">
       <div class="col-lg-3 col-12 save-the-date-wrap mt-auto ms-lg-auto">
           <div class="save-the-date-thumb">
               <h4 class="save-the-date-title">Save the date</h4>

               <div class="save-the-date-body">
                   <span class="date"><%= rs.getString("wedding_date") %></span>
               </div>
           </div>
       </div>
 </div>
</div>
<!-- Hero -->
           </section>


           <section class="about-section section-padding" id="section_2">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">Groom-Bride </h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="image-hover-thumb">
                               <img src="DisplayImage2?groom_id=1" class="about-image img-fluid" alt="groom image">
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="about-info-wrap d-flex flex-column">
                               <div class="about-info-title d-flex align-items-center my-3">
                                   <h4><%= rs.getString("groom_firstname")+" "+rs.getString("groom_lastname") %></h4>

                                   <span class="about-tag ms-2">Groom</span>
                               </div>

                               <p> उम्र : <span><%=rs.getString("groom_age") %></span></p>
                               <p> पेशा : <span><%=rs.getString("groom_proffession") %></span></p>
                               <!-- <div class="social-icon-wrap mt-auto">
                                   <ul class="social-icon ms-auto">
                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                   </ul>
                               </div> -->
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="image-hover-thumb">
                               <img src="DisplayImage?bride_id=1" class="about-image img-fluid" alt="bride image">
                           </div>
                       </div>

                       <div class="col-lg-3 col-12">
                           <div class="about-info-wrap d-flex flex-column">
                               <div class="about-info-title d-flex align-items-center my-3">
                                   <h4><%=rs.getString("bride_firstname")+" "+rs.getString("bride_lastname") %></h4>

                                   <span class="about-tag ms-2">Bride</span>
                               </div>

                               <p> उम्र : <span><%= rs.getString("bride_age") %></span></p>
                               <p> पेशा : <span><%=rs.getString("bride_proffession") %></span></p>

                               <!-- <div class="social-icon-wrap mt-auto">
                                   <ul class="social-icon ms-auto">
                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-facebook"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-twitter"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-instagram"></a></li>

                                       <li class="social-icon-item"><a href="#" class="social-icon-link bi-whatsapp"></a></li>
                                   </ul>
                               </div> -->
                           </div>
                       </div>
                   </div>
               </div>
           </section>

           <section class="the-wedding-section section-bg section-padding" id="section_3">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">WeddingPlace</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column mb-4 mb-lg-0 mb-md-0">
                           <div class="image-hover-thumb">
                               <img src="images/decorated-table-setting-wedding-celebration.jpg" class="img-fluid" alt="">
                           </div>

                           <div class="section-block">
                               <h3 class="my-3">The Reception</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   5th Avenue at, Central Park S
                               </p>

                               <p>
                                   <i class="bi-clock me-1"></i>
                                   5:00 PM
                               </p>
                           </div>
                       </div> -->

                       <div class="flex-column justify-content-center">
                           <div class="image-hover-thumb">
                               <img src="images/test3.jpg" class="img-fluid" alt="">
                           </div>

                           <div class="section-block text-center">
                               <h3 class="my-3">Wedding Celebration</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   <%= rs.getString("venue_address") %>
                               </p>

                               <p>
                                   <i class="bi-clock me-1"></i>
                                   <%=rs.getString("wedding_from") %> to <%= rs.getString("wedding_to") %>
                               </p>
                           </div>
                       </div>

                       <!-- <div class="col-lg-4 col-md-6 col-12 d-flex flex-column">
                           <iframe class="google-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8046.475092226252!2d-73.9752829999323!3d40.766655075110314!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c258f07d5da561%3A0x61f6aa300ba8339d!2sThe%20Plaza!5e1!3m2!1sen!2ssg!4v1662129560604!5m2!1sen!2ssg" width="100%" height="310" allowfullscreen="" loading="lazy"></iframe>

                           <div class="section-block">
                               <h3 class="my-3">Location</h3>

                               <p class="mb-2">
                                   <i class="bi-geo-alt me-1"></i>
                                   5th Avenue at, Central Park S, New York, NY 10019, United States
                               </p>
                           </div>
                       </div> -->

                   </div>
               </div>
           </section>

           <section class="people-section section-padding" id="section_4">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">Mother-Father</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-lg-3 col-md-5 col-12 me-auto">
                           <nav>
                               <div class="nav nav-tabs flex-lg-column align-items-baseline" id="nav-tab" role="tablist">
                                   <button class="nav-link active" id="nav-groomsmen-tab" data-bs-toggle="tab" data-bs-target="#nav-groomsmen" type="button" role="tab" aria-controls="nav-groomsmen" aria-selected="true">
                                       <h3>Groom Side</h3>
                                   </button>

                                   <button class="nav-link" id="nav-bridesmaid-tab" data-bs-toggle="tab" data-bs-target="#nav-bridesmaid" type="button" role="tab" aria-controls="nav-bridesmaid" aria-selected="false">
                                       <h3>Bride Side</h3>
                                   </button>
                               </div>
                           </nav>
                       </div>

                       <div class="col-lg-8 col-md-6 col-12">
                           <div class="tab-content" id="nav-tabContent">
                               <div class="tab-pane fade show active" id="nav-groomsmen" role="tabpanel" aria-labelledby="nav-groomsmen-tab">
                                   <div class="row">
                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="GR1DisplayImage?groom_relative_id=1" class="people-image img-fluid" alt="groom relative 1 image">
                                           </div>
                                      </div> 

                                      <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("groom_relative1_firstname")+" "+rs.getString("groom_relative1_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("groom_relative1_type") %></span>
                                               </div>
                                           </div>
                                      </div>

                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="GR2DisplayImage?groom_relative_id=1" class="people-image img-fluid" alt="groom relative 2 image">
                                           </div>
                                       </div>

                                       <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("groom_relative2_firstname")+" "+rs.getString("groom_relative2_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("groom_relative2_type") %></span>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>

                               <div class="tab-pane fade show" id="nav-bridesmaid" role="tabpanel" aria-labelledby="nav-bridesmaid-tab">
                                   <div class="row">
                                      <div class="col-lg-6 col-12">
                                           <div class="people-thumb image-hover-thumb">
                                               <img src="BR1DisplayImage?bride_relative_id=1" class="people-image img-fluid" alt="bride relative1 image">
                                           </div>
                                      </div> 

                                      <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("bride_relative1_firstname")+" "+rs.getString("bride_relative1_lastname") %></h4>
                                                   <span class="about-tag ms-2"><%= rs.getString("bride_relative1_type") %></span>
                                               </div>
                                           </div>
                                      </div>
                                      <div class="col-lg-6 col-12">
                                       <div class="people-thumb image-hover-thumb">
                                           <img src="BR2DisplayImage?bride_relative_id=1" class="people-image img-fluid" alt="bride relative2 image">
                                       </div>
                                  </div> 
                                       <div class="col-lg-6 col-12">
                                           <div class="section-block">
                                               <div class="d-flex align-items-center my-3">
                                                   <h4 class="mb-0"><%= rs.getString("bride_relative2_firstname")+" "+rs.getString("bride_relative2_lastname") %></h4>

                                                   <span class="about-tag ms-2"><%= rs.getString("bride_relative2_type") %></span>
                                               </div>

                                           </div>
                                       </div>
                                   </div>
                               </div>

                           </div>
                       </div>


                   </div>
               </div>
           </section>
           

           <section class="gallery-section section-bg section-padding" id="section_5">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">Attendees
                              </h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>
                       
                       <%
                   	PreparedStatement ps2 = null;  
                       ResultSet rs2 = null;
                       try {

                       	ps2 = con.prepareStatement("select Sum(attendee_count) as totalAttendee from attendee_info where userId=?");
                       	ps2.setInt(1,2);
                       	rs2 = ps2.executeQuery();
                       	if(rs2.next()) {
                       
                       %>
                       <div class="col-lg-12 col-12 text-center f-6">
                         <p class="fs-1"><%=rs2.getInt("totalAttendee") %></p>
                       </div>
                       <%
                       
                       	}
                       	
                       }
                       catch(Exception e) {
                       	e.printStackTrace();
                       }
                       finally {
                           // Close resources
                           try { 
                           	if (rs2 != null) 
                           		rs2.close(); 
                           	
                           	if (ps2 != null) 
                           		ps2.close();
                           }
                           catch (SQLException e) { 
                           	e.printStackTrace();
                           }
                       }
                       %>                    
                   </div>
               </div>
           </section>


           <section class="rsvp-section section-padding" id="section_6">
               <div class="container">
                   <div class="row">

                       <div class="col-lg-8 col-12 mx-auto">
                           <div class="rsvp-form-wrap">
                               <div class="section-title-wrap mb-5">
                                   <h2 class="section-title">Invitation <p class="fs-4">You are Invited</p></h2>

                                   <div class="section-title-bottom">
                                       <span class="section-title-line"></span>
                                       <i class="section-title-icon bi-heart-fill"></i>
                                       <span class="section-title-line"></span>
                                   </div>
                               </div>
                               
                                <div class="alert alert-danger" id="errorMsg" role="alert" style="display:none;">
                                     
                                </div>

                               <h5 class="mb-4">Will you attend? <span class="text-muted">Please reserve before <span><%= rs.getString("wedding_date") %> </span></span></h5>

                               <form class="custom-form rsvp-form" role="form" name="f1" action="/Application01/Attendees" method="post" onSubmit="return attendee_detail();">
                                   <div class="row">
                                          <div class="col-lg-3 col-md-6 col-12">
                                           <input type="text" name="userId" id="userId" class="form-control" placeholder="First Name*" value="<%=rs.getString("userId") %>" readonly>
                                       </div>
                                       
                                       <div class="col-lg-3 col-md-6 col-12">
                                           <input type="text" name="firstname" id="firstname" class="form-control" placeholder="First Name*" required>
                                       </div>

                                       <div class="col-lg-3 col-md-6 col-12"> 
                                           <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Last Name*" required>
                                       </div>

                                       <div class="col-lg-3 col-12"> 
                                           <select name="guest_count" class="form-select" id="guests" aria-label="Guests">
                                               <option selected>Number of Attendees</option>
                                               <option value="1">1</option>
                                               <option value="2">2</option>
                                               <option value="3">3</option>
                                               <option value="4">4</option>
                                               <option value="5">5</option>
                                               <option value="6">6</option>
                                               <option value="6">7</option>
                                               <option value="6">8</option>
                                           </select>
                                       </div>

                                       <div class="col-lg-3 col-5 mx-auto">
                                           <button type="submit" class="form-control">Accept Invitation</button>
                                       </div>

                                   </div>
                               </form>
                           </div>
                       </div>

                   </div>
               </div>
           </section>
           
           

           <section class="contact-section section-bg section-padding" id="section_7">
               <div class="container">
                   <div class="row">
                       <div class="col-lg-12 col-12">
                           <div class="section-title-wrap mb-5">
                               <h2 class="section-title">Contact</h2>

                               <div class="section-title-bottom">
                                   <span class="section-title-line"></span>
                                   <i class="section-title-icon bi-heart-fill"></i>
                                   <span class="section-title-line"></span>
                               </div>
                           </div>
                       </div>

                       <div class="col-12 text-center">
                           <h4 class="mb-4">Contact Information</h4>
                           <p class="mb-2">
                               <a href="tel: 090-080-0760">
                                   <%= rs.getString("phone") %>
                               </a>
                           </p>
                       </div>
                   </div>
               </div>
           </section>

       </main>

       <footer class="site-footer">
           <div class="container">
               <div class="row">
                   <div class="col-lg-3 col-12 mx-auto">
                       <a href="index.jsp" class="navbar-brand mx-auto mx-lg-0">
                           <span><%= rs.getString("groom_firstname") %></span>
                           <i class="bi-heart brand-icon"></i>
                           <span><%= rs.getString("bride_firstname") %></span>
                       </a>
                   </div>

               </div>
           </div>
       </footer>
    	 
 <%   	 	 
     }

  %>        
        <%
            }
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        finally {
            // Close resources
            try { 
            	if (rs != null) 
            		rs.close(); 
            	if (ps != null) 
            		ps.close(); 
            	if (con != null) 
            		con.close(); 
            	} 
            catch (SQLException e) { 
            	e.printStackTrace();
            }
        }
 
%>

        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/click-scroll.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <script src="js/custom.js"></script>
          <script src="js/index.js"></script>

    </body>
</html>
