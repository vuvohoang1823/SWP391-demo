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
        <link rel="stylesheet" href="css/viewBookedService_PrivateConsult.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <%@include file="viewBookedService_Head.jsp" %>
            <div class="filter-search">
                <div class="filter-side">
                    <p>Service status: </p>
                    <ul class="filter-option">
                        <li><a href="viewBookedService_PrivateConsult.jsp">Upcoming</a></li>
                        <li class="active"><a href="viewBookedService_PrivateConsult_complete.jsp">Completed</a></li>
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
                        <div class="col-lg-4 d-flex align-items-center">
                            <img src="img/martin.jpg" alt="bird.jpg">
                        </div>
                        <div class="description col-lg-8">
                            <p class="course-title">Basic Consult</p>
                            <div class="course-desc">
                                <p><b>Customer:</b> Nguyen van A</p>
                                <p><b>Time:</b> 7AM</p>
                                <p><b>Date:</b> 11/11/2011</p>
                                <p><b>Trainer name:</b> Simon</p>
                                <p><b>Consultation fee:</b> $100/hour</p>
                                <p><b>Total fee:</b> $1000</p>
                            </div>
                        </div>
                        <div class="btn-complete">
                            <button><a href="">Online payment</a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
