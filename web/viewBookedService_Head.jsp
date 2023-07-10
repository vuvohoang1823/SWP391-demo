<%--
    Document   : viewBookedService_onlineCourse
    Created on : Jul 6, 2023, 3:20:01 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/viewBookedService_Head.css">
    </head>
    <body>
        <div class="row tab-title">
            <p>Booked Services</p>
        </div>
        <div class="row tab-nav">
            <ul class="service-nav">
                <li class="
                    <%= isPageActive(currentPage, "viewBookedService_BirdCourse.jsp")%>
                    <%= isPageActive(currentPage, "viewBookedService_BirdCourse_complete.jsp")%>
                    ">
                    <a href="Customer_Tracking">Bird Courses</a>
                </li>
                <li class="
                    <%= isPageActive(currentPage, "viewBookedService_onlineCourse.jsp")%>
                    <%= isPageActive(currentPage, "viewBookedService_onlineCourse_complete.jsp")%>
                    ">
                    <a href="viewBookedService_onlineCourse.jsp">Online Courses</a>
                </li>
                <li class="
                    <%= isPageActive(currentPage, "Customer_Workshop_In-progress.jsp")%>
                    <%= isPageActive(currentPage, "Customer_Workshop_Complete.jsp")%>
                    ">
                    <a href="Customer_Workshop_In-progress.jsp">Workshops</a>
                </li>
                <li class="
                    <%= isPageActive(currentPage, "viewBookedService_PrivateConsult.jsp")%>
                    <%= isPageActive(currentPage, "viewBookedService_PrivateConsult_complete.jsp")%>
                    ">
                    <a href="viewBookedService_PrivateConsult.jsp">Private Consultant</a>
                </li>
            </ul>
        </div>
    </body>
</html>
