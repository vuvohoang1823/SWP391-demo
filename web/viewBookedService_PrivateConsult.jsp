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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/viewBookedService_BirdCourse.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>
            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li class="active"><a href="viewBookedService_PrivateConsult.jsp">In-progress</a></li>
                        <li><a href="viewBookedService_PrivateConsult_complete.jsp">Completed</a></li>
                    </ul>
                </div>
                <div class="search-side">
                    <input type="text" class="search-bar" placeholder="Search by item name">
                    <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20.8335 21.083L26.5002 26.7497" stroke="#323232" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round" />
                    <path
                        d="M23.6667 12.5833C23.6667 18.8426 18.5926 23.9167 12.3333 23.9167C6.0741 23.9167 1 18.8426 1 12.5833C1 6.3241 6.0741 1.25 12.3333 1.25C18.5926 1.25 23.6667 6.3241 23.6667 12.5833Z"
                        stroke="#323232" stroke-width="2" />
                    </svg>
                </div>
            </div>
            <p class="search-result">Currently showing <span class="search-counter">2</span> available item(s)</p>
            <div class="result-container">
                <div class="card-container">
                    <div class="card-detail">
                        <img src="img/bird.jpg" alt="bird.jpg">
                        <div class="description">
                            <p class="course-title">Mastering the Art of Avian Care and Handling</p>
                            <div class="course-desc">
                                <p>Training duration: 10 days</p>
                                <p>Birds name: Simon</p>
                                <p>Type: Mocking Jay</p>

                            </div>
                        </div>
                        <button><a href="">To course</a></button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
