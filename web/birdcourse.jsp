<%--
    Document   : birdcourse
    Created on : Jun 15, 2023, 12:14:55 AM
    Author     : vuvoh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bird Course</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/birdCourse.css" type="text/css">
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>
        </head>
        <body>
        <%@include file="header.jsp" %>
        <div class="body-container">
            <section class="section-head">
                <div class="desc-container">
                    <div style="height: 83%; overflow-y: hidden">
                        <h2>BIRD COURSE</h2>
                        <h1>Unlock the Potential of Your Feathered Companion</h1>
                        <p>
                            Becoming a trainer is designed to empower
                            individuals like you to embark. Whether you aspire to train in corporate settings,
                            educational institutions, or any other field, this comprehensive
                            course will equip you with the essential skills and knowledge to
                            excel as a trainer.
                        </p>
                    </div>
                    <div class="button-container">
                        <button>Explore Course</button>
                    </div>
                </div>
                <div class="img-container">
                    <div class="image1">
                        <img src="./img/bluebirdgirl.png" alt="" />
                    </div>
                    <div class="image2">
                        <img src="./img/flyheader3pics.png" alt="" />
                    </div>
                </div>
            </section>
            <section class="section-body">
                <div class="heading">
                    <div>
                        <h1>Discover Courses for Your Beloved Birds</h1>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Search for Bird Course"
                                    style="width: 30rem;
                                    height: 5rem; font-size: 2rem"

                                    />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="20"
                                            height="40"
                                            fill="currentColor"
                                            class="bi bi-search"
                                            viewBox="0 0 16 16"
                                            >
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                            />
                                        </svg>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <select class="custom-select" onchange="submitForm()" name="filterChose">
                                <option hidden value="1" ${!filterChose ? "selected" : ""}>Select Skill</option>
                                <option value="1" ${filterChose eq "1" ? "selected" : ""}>Talk</option>
                                <option value="2" ${filterChose eq "2" ? "selected" : ""}>Dancing</option>
                                <option value="3" ${filterChose eq "3" ? "selected" : ""}>Fly</option>
                                <option value="4" ${filterChose eq "4" ? "selected" : ""}>Sing</option>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <select class="custom-select" onchange="submitForm()" name="filterChose">
                                <option hidden value="1" ${!filterChose ? "selected" : ""}>Select Specie</option>
                                <option value="1" ${filterChose eq "1" ? "selected" : ""}>Owl</option>
                                <option value="2" ${filterChose eq "2" ? "selected" : ""}>Bobolink</option>
                                <option value="3" ${filterChose eq "3" ? "selected" : ""}>Gull</option>
                                <option value="4" ${filterChose eq "4" ? "selected" : ""}>Dunlin</option>
                            </select>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section-course">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${i.allCourseBirdCourse}" var="birdcourse">
                            <div class="col-md-4">
                                <div class="card">
                                    <img
                                        src="data:images/jpg;base64,${birdcourse.image}"
                                        class="card-img-top"
                                        alt="Product 1"
                                        />
                                    <div class="card-body">
                                        <div class="extra-price">
                                            <div class="button-container">
                                                <a href="detail?cid=${birdcourse.courseID}&type=${birdcourse.type}"><button>Enroll</button></a>
                                                <!--                                        <button class="btn btn-primary"><a href="bir">Enroll<a/></button>-->
                                            </div>
                                            <p>£${birdcourse.price}</p>
                                        </div>
                                        <h5 class="card-title">
                                            ${birdcourse.title}
                                        </h5>
                                        <div class="card-text">
                                            <div style="display: inline">
                                                <span style="color: #617a55">
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        width="25"
                                                        height="25"
                                                        fill="currentColor"
                                                        class="bi bi-clock-fill"
                                                        viewBox="0 0 16 16"
                                                        >
                                                    <path
                                                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"
                                                        />
                                                    </svg>
                                                </span>
                                                <span>${birdcourse.duration} days</span>
                                            </div>
                                            <div style="display: inline">
                                                <svg fill="#617a55" widtth="30" height="30" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" xml:space="preserve" stroke="#617a55"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <path d="M24.885,8.587C24.885,8.587,24.884,8.587,24.885,8.587c0.039,0.073,0.066,0.152,0.066,0.24 c0,0.284-0.23,0.515-0.516,0.515c-0.164,0-0.304-0.083-0.398-0.203c-0.051,0.115-0.081,0.242-0.081,0.376 c0,0.513,0.416,0.928,0.928,0.928c0.513,0,0.929-0.415,0.929-0.928C25.812,9.003,25.396,8.587,24.885,8.587z"></path> <path d="M28.555,8.909c-0.873-2.724-3.426-4.697-6.439-4.697c-3.455,0-6.3,2.593-6.708,5.939l-0.002,0.002 C12.608,14.854,1.877,12.365,0,11.341c3.273,7.316,7.955,10.891,12.538,11.872c1.554,0.825,3.321,1.302,5.204,1.302 c0.199,0,0.395-0.02,0.59-0.029L17.4,26.067l-1.97,0.646l0.159,0.487l1.91-0.625l0.899,0.923l0.367-0.356l-0.875-0.897l1.06-1.796 c0.728-0.079,1.437-0.227,2.114-0.438l2.021,2.583l-1.713,0.637l0.178,0.479l1.943-0.722l1.789,0.801l0.209-0.467l-1.826-0.817 l-2.096-2.678c4.238-1.554,7.271-5.599,7.307-10.364c0.053-0.162,0.102-0.318,0.141-0.461C29.093,12.735,32,9.837,32,9.837 L28.555,8.909z M16.805,21.562c-2.257,0-7.657-3.406-7.657-4.199c0-0.795,5.4-3.969,7.657-3.969c2.256,0,4.084,1.829,4.084,4.084 S19.061,21.562,16.805,21.562z M24.757,11.372c-1.024,0-1.856-0.831-1.856-1.857c0-1.025,0.832-1.855,1.856-1.855 c1.025,0,1.856,0.831,1.856,1.855C26.613,10.541,25.782,11.372,24.757,11.372z"></path> </g> </g> </g></svg>
                                                <span>${birdcourse.type}</span>
                                            </div>
                                        </div>
                                        <hr
                                            style="
                                            border: 1px solid black;
                                            width: 100%;
                                            padding: 0 2%;
                                            margin: 20px auto;
                                            "
                                            />
                                        <div class="review">
                                            <b class="star col-lg-4" style="font-size: 15px">5/5⭐</b>
                                            <b class="review-count col-lg-9"style="font-size: 15px">based on 100 reviews</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <%@include file="footer.jsp" %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

    </body>

</html>