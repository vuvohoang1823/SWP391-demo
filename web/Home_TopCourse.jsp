<%--
    Document   : Home_topCourse
    Created on : Jun 11, 2023, 3:51:05 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <jsp:useBean id="top" class="DAO.courseDAO" scope="request"></jsp:useBean>

            <link rel="stylesheet" href="./css/reset.css" />
            <link rel="stylesheet" href="./css/TopCourse.css" />
        </head>
        <body>
            <section class="birdCourse-container">
                <div class="heading">
                    <h2>OUR FEATURED COURSE</h2>
                    <div>
                        <h1>OUR BEST COURSE FOR YOUR BIRDS</h1>
                    </div>
                </div>
                <div class="section-course">
                    <div class="container">

                        <div class="row">
                        <c:forEach items="${top.top3BirdCourse}"  var="birdcourse">

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
                                                <a href="birdcoursedetail.jsp"><button class="btn btn-primary">Enroll</button></a>
                                            </div>
                                            <p>£${birdcourse.price}</p>
                                        </div>
                                        <h5 class="card-title">${birdcourse.title}</h5>
                                        <div class="course-name">Parrot</div>
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
                                                <span>3 weeks</span>
                                            </div>
                                            <div style="display: inline">
                                                <span style="color: #617a55">
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        width="25"
                                                        height="25"
                                                        fill="currentColor"
                                                        class="bi bi-grid-3x2-gap-fill"
                                                        viewBox="0 0 16 16"
                                                        >
                                                    <path
                                                        d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                        />
                                                    </svg>
                                                </span>
                                                <span>6 modules</span>
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
                                            <b class="star col-lg-4">5/5⭐</b>
                                            <b class="review-count col-lg-9">based on 100 reviews</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!--                         end of product 
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <img
                                                            src="./img/Rectangle 26.png"
                                                            class="card-img-top"
                                                            alt="Product 1"
                                                            />
                                                        <div class="card-body">
                                                            <div class="extra-price">
                                                                <div class="button-container">
                                                                    <button class="btn btn-primary">Enroll</button>
                                                                </div>
                                                                <p>£120.00</p>
                                                            </div>
                                                            <h5 class="card-title">Fly Training Parrot</h5>
                                                            <div class="course-name">Parrot</div>
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
                                                                    <span>3 weeks</span>
                                                                </div>
                                                                <div style="display: inline">
                                                                    <span style="color: #617a55">
                                                                        <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="25"
                                                                            height="25"
                                                                            fill="currentColor"
                                                                            class="bi bi-grid-3x2-gap-fill"
                                                                            viewBox="0 0 16 16"
                                                                            >
                                                                        <path
                                                                            d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                                            />
                                                                        </svg>
                                                                    </span>
                                                                    <span>6 modules</span>
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
                                                                <b class="star col-lg-4">5/5⭐</b>
                                                                <b class="review-count col-lg-9">based on 100 reviews</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end of product 
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <img
                                                            src="./img/Rectangle 26.png"
                                                            class="card-img-top"
                                                            alt="Product 1"
                                                            />
                                                        <div class="card-body">
                                                            <div class="extra-price">
                                                                <div class="button-container">
                                                                    <button class="btn btn-primary">Enroll</button>
                                                                </div>
                                                                <p>£120.00</p>
                                                            </div>
                                                            <h5 class="card-title">Fly Training Parrot</h5>
                                                            <div class="course-name">Parrot</div>
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
                                                                    <span>3 weeks</span>
                                                                </div>
                                                                <div style="display: inline">
                                                                    <span style="color: #617a55">
                                                                        <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="25"
                                                                            height="25"
                                                                            fill="currentColor"
                                                                            class="bi bi-grid-3x2-gap-fill"
                                                                            viewBox="0 0 16 16"
                                                                            >
                                                                        <path
                                                                            d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                                            />
                                                                        </svg>
                                                                    </span>
                                                                    <span>6 modules</span>
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
                                                                <b class="star col-lg-4">5/5⭐</b>
                                                                <b class="review-count col-lg-9">based on 100 reviews</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end of product -->
                    </div>
                    <div class="row" style="display: flex; justify-content: center">
                        <div class="col-lg-4 foot-button">
                            <a href="birdcourse.jsp"><button>Click here to see more</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="onlineCourse-container">
            <div class="heading">
                <div>
                    <h1>FEATURED ONLINE COURSE</h1>
                </div>
            </div>
            <div class="section-course">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${top.top3OnlineTraining}" var="onlinetraining">

                            <div class="col-lg-4">
                                <div class="card">
                                    <img
                                    src="data:images/jpg;base64,${onlinetraining.image}"
                                        class="card-img-top"
                                        alt="Product 1"
                                        />
                                    <div class="card-body">
                                        <div class="extra-price">
                                            <div class="button-container">
                                                <button class="btn btn-primary">Enroll</button>
                                            </div>
                                            <p>£${onlinetraining.price}</p>
                                        </div>
                                        <h5 class="card-title">
                                            ${onlinetraining.title}
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
                                                <span>3 weeks</span>
                                            </div>
                                            <div style="display: inline">
                                                <span style="color: #617a55">
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        width="25"
                                                        height="25"
                                                        fill="currentColor"
                                                        class="bi bi-grid-3x2-gap-fill"
                                                        viewBox="0 0 16 16"
                                                        >
                                                    <path
                                                        d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                        />
                                                    </svg>
                                                </span>
                                                <span>6 modules</span>
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
                                            <b class="star col-lg-4">5/5⭐</b>
                                            <b class="review-count col-lg-9">based on 100 reviews</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!--                         end of product 
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <img
                                                            src="./img/Rectangle 26.png"
                                                            class="card-img-top"
                                                            alt="Product 1"
                                                            />
                                                        <div class="card-body">
                                                            <div class="extra-price">
                                                                <div class="button-container">
                                                                    <button class="btn btn-primary">Enroll</button>
                                                                </div>
                                                                <p>£120.00</p>
                                                            </div>
                                                            <h5 class="card-title">
                                                                Mastering Effective Communication: Unlocking the Power of
                                                                Connection
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
                                                                    <span>3 weeks</span>
                                                                </div>
                                                                <div style="display: inline">
                                                                    <span style="color: #617a55">
                                                                        <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="25"
                                                                            height="25"
                                                                            fill="currentColor"
                                                                            class="bi bi-grid-3x2-gap-fill"
                                                                            viewBox="0 0 16 16"
                                                                            >
                                                                        <path
                                                                            d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                                            />
                                                                        </svg>
                                                                    </span>
                                                                    <span>6 modules</span>
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
                                                                <b class="star col-lg-4">5/5⭐</b>
                                                                <b class="review-count col-lg-9">based on 100 reviews</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end of product 
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <img
                                                            src="./img/Rectangle 26.png"
                                                            class="card-img-top"
                                                            alt="Product 1"
                                                            />
                                                        <div class="card-body">
                                                            <div class="extra-price">
                                                                <div class="button-container">
                                                                    <button class="btn btn-primary">Enroll</button>
                                                                </div>
                                                                <p>£120.00</p>
                                                            </div>
                                                            <h5 class="card-title">
                                                                Mastering Effective Communication: Unlocking the Power of
                                                                Connection
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
                                                                    <span>3 weeks</span>
                                                                </div>
                                                                <div style="display: inline">
                                                                    <span style="color: #617a55">
                                                                        <svg
                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                            width="25"
                                                                            height="25"
                                                                            fill="currentColor"
                                                                            class="bi bi-grid-3x2-gap-fill"
                                                                            viewBox="0 0 16 16"
                                                                            >
                                                                        <path
                                                                            d="M1 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zM1 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V9z"
                                                                            />
                                                                        </svg>
                                                                    </span>
                                                                    <span>6 modules</span>
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
                                                                <b class="star col-lg-4">5/5⭐</b>
                                                                <b class="review-count col-lg-9">based on 100 reviews</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end of product -->
                    </div>
                    <div class="row" style="display: flex; justify-content: center">
                        <div class="col-lg-4 foot-button">
                            <a href="online_course.jsp"><button>Click here to see more</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="workshops-container">
            <div class="heading">
                <div>
                    <h1>AMAZING WORKSHOPS</h1>
                </div>
            </div>
            <div class="section-workshops">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${top.top1CourseWorkshop}" var="workshop">

                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="row no-gutters">
                                        <div class="col-md-3">
                                            <img
                                                src="data:images/jpg;base64,${workshop.image}"

                                                class="card-img"
                                                alt="Product Image 1"
                                                />
                                        </div>
                                        <div class="col-md-9">
                                            <div class="card-body">
                                                <h5 class="card-title">
                                                    ${workshop.title}
                                                </h5>
                                                <div class="desc-text">
                                                    ${workshop.content}
                                                </div>
                                                <div class="card-text">
                                                    <b>Starting date:</b> May 25, 2023 <br />
                                                    <b>Time:</b> 2:00 PM - 4:00 PM <br />
                                                    <b>Location/Venue:</b> Central Community Center <br />
                                                    <b>Target Audience:</b> Bird owners of all experience
                                                    levels
                                                </div>
                                                <div class="extra-price">
                                                    <div class="button-container">
                                                        <a href="MainController?action=view_workshop_detail&courseID=${workshop.courseID}">
                                                            <button>More Information</button> 
                                                        </a>
                                                        
                                                    </div>
                                                    <p>£${workshop.price}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="row" style="display: flex; justify-content: center">
                    <div class="col-lg-4 foot-button">
                        <a href="workshop.jsp"><button>Click here to see more</button></a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
