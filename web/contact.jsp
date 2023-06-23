<%-- 
    Document   : contact.jsp
    Created on : Jun 1, 2023, 10:45:49 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/homepage.css" type="text/css">

        <title>JSP Page</title>
    </head>
    <body style="margin:0">
       <div>

            <div class="header-container" style="padding: 8px 0 ">
        <div style=" margin-left: 2%" >
          <NavLink to="/" end class="nav-logo">
            <div class="logo-container">
              <div class="logo-image">
                <img src=img/logo_black.png alt="page logo" />
              </div>
              <div class="logo-text">
                <p style="margin: 0">BIRD</p>
                <p style="margin: 0">TRADING</p>
                <p style="margin: 0" >CENTER</p>
              </div>
            </div>
          </NavLink>
        </div>
        <div class="nav-container">
            <ul class="nav" style="list-style: none ; font-size:20px">
            <li>
                <a href="homepage.jsp"  class="nav-link">
                Home
              </a>
            </li>
            <li>
              <a href="about_us.jsp"  class="nav-link">
                About Us
              </a>
            </li>
            <li>
              <div
                class="nav-link"
                style=" display: flex; alignItems: center" 
              >
                Services
                <RxTriangleDown />
              </div>
              <ul class="subnav" style='list-style: none' >
                <li>
                  <NavLink to="/consultations" class="nav-link">
                    Consultations
                  </NavLink>
                </li>
                <li>
                  <NavLink to="/workshop" class="nav-link">
                    Workshop
                  </NavLink>
                </li>
                <li>
                  <NavLink to="/Bird-course" class="nav-link">
                    Bird Course
                  </NavLink>
                </li>
                 <li>
                <NavLink to="/course-online" class="nav-link">
                    Course Online
                  </NavLink>
                </li>
              </ul>
            </li>
            <li>
              <a href="blog.jsp"  class="nav-link">
                Blog
              </a>
            </li>
            <li>
              <a href="contact.jsp"  class="nav-link">
                Contact
              </a>
            </li>
          </ul>
        </div>

        <button class="signin-button" onClick={toggleSignInForm}>
            <p style="margin: 0">Log In</p>
        </button>

        <button class="signup-button" onClick={toggleSignUpForm}>
          Sign Up
        </button>
      </div>
    </div>
        
        <h1>This is page 'contact'</h1>
        
    </body>
    
</html>
