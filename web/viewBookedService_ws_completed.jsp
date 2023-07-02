<%--
    Document   : viewBookedService-ws-completed
    Created on : Jul 2, 2023, 7:58:36 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/viewBookedService_ws_completed.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row tab-title">
                <p>Booked Services</p>
            </div>
            <div class="row tab-nav">
                <ul class="service-nav">
                    <li><a href="">Bird Courses</a></li>
                    <li><a href="">Online Courses</a></li>
                    <li><a href="">Workshops</a></li>
                </ul>
            </div>
            <div class="filter-search">
                <div class="filter-side">
                    <ul class="filter-option">
                        <li><a href="">In-progress</a></li>
                        <li><a href="">Completed</a></li>
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
            <div class="show-result">
                <div class="search-card">
                    <div class="card">
                        <img src="img/ws1.jpg" alt="" class="card-img">
                        <div class="card-content">
                            <div class="header">
                                <p>Harness Training Workshop:<br />
                                    Strengthening the Connection with Your Bird
                                </p>
                            </div>
                            <div class="body">
                                <p>This hands-on course is designed to help bird owners develop a harmonious bond with their
                                    avian
                                    companions by exploring the fascinating world of whistle training. Whether you have a
                                    parrot,
                                    cockatiel, or canary, this workshop offers a unique opportunity to tap into their
                                    natural
                                    vocal
                                    abilities and unlock a whole new level of communication.
                                </p>
                            </div>
                            <div class="date-time">
                                <p class="date"><span>Starting date:</span> May 25, 2023</p>
                                <p class="time"><span>Time:</span> 2:00 PM - 4:00 PM</p>
                                <p class="location"><span>Location/Venue:</span> Central Community Center</p>
                            </div>
                            <div class="audience">
                                <p><span>Target audience:</span> Bird owners of all experience levels</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="search-card">
                    <div class="card">
                        <img src="img/ws1.jpg" alt="" class="card-img">
                        <div class="card-content">
                            <div class="header">
                                <p>Harness Training Workshop:<br />
                                    Strengthening the Connection with Your Bird
                                </p>
                            </div>
                            <div class="body">
                                <p>This hands-on course is designed to help bird owners develop a harmonious bond with their
                                    avian
                                    companions by exploring the fascinating world of whistle training. Whether you have a
                                    parrot,
                                    cockatiel, or canary, this workshop offers a unique opportunity to tap into their
                                    natural
                                    vocal
                                    abilities and unlock a whole new level of communication.
                                </p>
                            </div>
                            <div class="date-time">
                                <p class="date"><span>Starting date:</span> May 25, 2023</p>
                                <p class="time"><span>Time:</span> 2:00 PM - 4:00 PM</p>
                                <p class="location"><span>Location/Venue:</span> Central Community Center</p>
                            </div>
                            <div class="audience">
                                <p><span>Target audience:</span> Bird owners of all experience levels</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
