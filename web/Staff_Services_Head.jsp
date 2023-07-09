<%--
    Document   : Staff_Services_Head
    Created on : Jul 7, 2023, 11:54:52 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- boostrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_Head.css" />
    </head>
    <body>
        <section class="form-head">
            <div class="heading d-flex align-items-center">
                <svg width="40" height="40" viewBox="0 0 19 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6 10H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M1 5.22222C1 3.23185 1 2.23666 1.6224 1.61833C2.24479 1 3.24653 1 5.25 1H13.75C15.7534 1 16.7552 1 17.3776 1.61833C18 2.23666 18 3.23185 18 5.22222V13.6667C18 16.6522 18 18.145 17.0664 19.0725C16.1328 20 14.6302 20 11.625 20H7.375C4.36979 20 2.8672 20 1.9336 19.0725C1 18.145 1 16.6522 1 13.6667V5.22222Z" stroke="#33363F" stroke-width="2"/>
                                        <path d="M13 17V20M6 17V20" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M6 6H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        </svg>
                <span style="padding-left: 2rem">Services</span>
            </div>
            <div class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <div class="" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item <%= isPageActive(currentPage, "Staff_Services_BirdCourse.jsp")%>">
                                <a class="nav-link" href="Staff_Services_BirdCourse.jsp">Bird Course</a>
                            </li>
                            <li class="nav-item <%= isPageActive(currentPage, "Staff_Services_Workshop.jsp")%>">
                                <a class="nav-link" href="Staff_Services_Workshop.jsp">Workshop</a>
                            </li>
                            <li class="nav-item <%= isPageActive(currentPage, "Staff_Services_OnlineCourse.jsp")%>">
                                <a class="nav-link" href="Staff_Services_OnlineCourse.jsp">Online Course</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
