<%--
    Document   : viewBookedService
    Created on : Jul 3, 2023, 1:10:32 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/viewBookedService.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="row body-service">
            <div class="booked-service">
                <p>Booked Service</p>
            </div>
        </div>
        <div class="row body-navigation">
            <ul>
                <li><a href="">Online Courses</a></li>
                <li><a href="">Bird Courses</a></li>
                <li><a href="viewBookedService_ws_inprogress.jsp">Workshops</a></li>
            </ul>
        </div>
        <div class="row body-search">
            <p>Search your item</p>
            <div class="search-bar" style="position: relative;">
                <input type="text" placeholder="Search by item name">
                <a href="" style="position: absolute;">
                    <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M24.0835 24.0835L29.7502 29.7502" stroke="#323232" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round" />
                    <path
                        d="M26.9167 15.5833C26.9167 21.8426 21.8426 26.9167 15.5833 26.9167C9.3241 26.9167 4.25 21.8426 4.25 15.5833C4.25 9.3241 9.3241 4.25 15.5833 4.25C21.8426 4.25 26.9167 9.3241 26.9167 15.5833Z"
                        stroke="#323232" stroke-width="2" />
                    </svg>
                </a>
            </div>
        </div>
        <div class="row body-search-result-counter">
            <p>Currently showing 2 vailable item(s)</p>
        </div>
        <div class="body-search-result">
            <div class="result-content">
                <img src="img/bird.jpg" alt="bird.jpg">
                <div class="result-info">
                    <p>Mastering the Art of Avian Care and Handling</p>
                    <p>Training duration: 10 days</p>
                    <p>Birds name: Simon</p>
                    <p>Type: Mocking Jay</p>
                </div>
                <button><a href="">Track your bird</a></button>
            </div>
            <div class="result-content">
                <img src="img/bird.jpg" alt="bird.jpg">
                <div class="result-info">
                    <p>Mastering the Art of Avian Care and Handling</p>
                    <p>Training duration: 10 days</p>
                    <p>Birds name: Simon</p>
                    <p>Type: Mocking Jay</p>
                </div>
                <button><a href="">Track your bird</a></button>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
