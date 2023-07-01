<%--
    Document   : header
    Created on : Jun 9, 2023, 4:12:41 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        bs5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!--        font awesome-->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/header.css" type="text/css">
    </head>
    <body>
        <c:set var="user" value="${sessionScope.LOGIN_USER}"></c:set>
        <c:set var="role" value="${sessionScope.role}" />
        <c:choose>
            <c:when test="${role eq 'customer' || empty role}">
                <div class="container-fluid customer">
                    <div class="row header">
                        <div class="col-lg-3 logo-section">
                            <img src="./img/icon.jpg" alt="">
                            <p>BIRD <br /> TRAINING <br /> CENTER</p>
                        </div>
                        <div class="col-lg-6 menu-section">
                            <ul class="menu-content">
                                <li><a href="homepage.jsp">Home</a></li>
                                <li><a href="about_us.jsp">About us</a></li>
                                <li>
                                    <a href="#" class="subnav-toggle">
                                        Service
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                        <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                        </svg>
                                    </a>
                                    <div class="triangle"></div>
                                    <ul class="subnav">
                                        <li class="subnav-content"><a href="workshop.jsp">Workshops</a></li>
                                        <li class="subnav-content"><a href="private_consultation.jsp">Private Consultant</a></li>
                                        <li class="subnav-content"><a href="online_course.jsp">Online Course</a></li>
                                        <li class="subnav-content"><a href="birdcourse.jsp">Bird Course</a></li>
                                    </ul>
                                </li>
                                <li><a href="blogs.jsp">Blog</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>
                        <c:choose>
                            <c:when test="${empty user}">
                                <div class="col-lg-3 button-container">
                                    <a href="signUp.jsp" >
                                        <button class="signup-button">
                                            Sign Up
                                        </button>
                                    </a>
                                    <a href="signin.jsp" >
                                        <button class="signin-button">
                                            Log In
                                        </button>
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:set var="fullname" value="${user.fullName}"></c:set>
                                    <div class="col-lg-3 dropdown auth-section d-flex align-items-center justify-content-center">
                                        <div style="
                                             font-weight: 700;
                                             font-size: 1.5rem;
                                             color: #617a55;
                                             padding-right: 2rem;
                                             " >Welcome</div>
                                        <button class="btn btn-secondary dropdown-toggle user-button" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <span><svg width="16" height="16" viewBox="0 0 19 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M9.5 0.00173437C8.6944 -0.017608 7.89308 0.125002 7.14317 0.421175C6.39327 0.717349 5.70993 1.1611 5.13335 1.72634C4.55677 2.29157 4.09859 2.96687 3.78576 3.71251C3.47294 4.45815 3.31179 5.25908 3.31179 6.06817C3.31179 6.87726 3.47294 7.67819 3.78576 8.42383C4.09859 9.16947 4.55677 9.84476 5.13335 10.41C5.70993 10.9752 6.39327 11.419 7.14317 11.7152C7.89308 12.0113 8.6944 12.1539 9.5 12.1346C10.3056 12.1539 11.1069 12.0113 11.8568 11.7152C12.6067 11.419 13.2901 10.9752 13.8667 10.41C14.4432 9.84476 14.9014 9.16947 15.2142 8.42383C15.5271 7.67819 15.6882 6.87726 15.6882 6.06817C15.6882 5.25908 15.5271 4.45815 15.2142 3.71251C14.9014 2.96687 14.4432 2.29157 13.8667 1.72634C13.2901 1.1611 12.6067 0.717349 11.8568 0.421175C11.1069 0.125002 10.3056 -0.017608 9.5 0.00173437ZM6.04545 15.5997C4.4421 15.5997 2.90442 16.2392 1.77067 17.3775C0.63693 18.5158 0 20.0597 0 21.6696V26H19V21.6696C19 20.0597 18.3631 18.5158 17.2293 17.3775C16.0956 16.2392 14.5579 15.5997 12.9545 15.5997H6.04545Z"
                                                    fill="white" />
                                                </svg></span>
                                            ${fullname}
                                    </button>
                                    <div class="dropdown-menu" style="background-color: rgba(0,0,0,0); border: 0;">
                                        <ul class="subnav">
                                            <a class="dropdown-item" href="birdcourselist.jsp"><li>View Booked Services</li></a>
                                            <a class="dropdown-item" href="birdcourselist.jsp"><li>View Profile</li></a>
                                            <a class="dropdown-item" href="LogoutController" style="text-decoration: none">     <li>Logout</li></a>
                                        </ul>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:when>


            <c:when test="${role eq 'trainer'}">
                <div
                    class="bg-white col-2 col-md-4 col-lg-2 min-vh-100 d-flex flex-column p-0 sidebar-trainer"
                    style="width: 13%"
                    >
                    <a
                        href="#"
                        class="d-flex text-decoration-none align-items-center text-white nav-logo logo-container"
                        >
                        <span class="d-block d-sm-none w-auto">
                            <img src=./img/logo_white.png alt="page logo" style="width:
                                 5rem;"/>
                        </span>
                        <span class="fs-4 m-auto d-none d-sm-inline">
                            <div class="d-flex p-3">
                                <div class="logo-image">
                                    <img src=./img/logo_white.png alt="page logo" />
                                </div>
                                <div class="logo-text">
                                    <p style="margin: 0">BIRD</p>
                                    <p style="margin: 0">TRADING</p>
                                    <p style="margin: 0">CENTER</p>
                                </div>
                            </div>
                        </span>
                    </a>
                    <div class="bg-white p-2">
                        <ul class="nav nav-pills flex-column mt-4">
                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="trainer_demo.jsp"
                                    class="d-flex justify-content-center d-sm-block nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="2rem" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M160 64c0-35.3 28.7-64 64-64H576c35.3 0 64 28.7 64 64V352c0 35.3-28.7 64-64 64H336.8c-11.8-25.5-29.9-47.5-52.4-64H384V320c0-17.7 14.3-32 32-32h64c17.7 0 32 14.3 32 32v32h64V64L224 64v49.1C205.2 102.2 183.3 96 160 96V64zm0 64a96 96 0 1 1 0 192 96 96 0 1 1 0-192zM133.3 352h53.3C260.3 352 320 411.7 320 485.3c0 14.7-11.9 26.7-26.7 26.7H26.7C11.9 512 0 500.1 0 485.3C0 411.7 59.7 352 133.3 352z"/></svg>
                                        <span class="fs-2 ms-3 d-none d-sm-inline">Workshops</span>
                                    </div>
                                </a>
                            </li>

                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="Trainer_Tracking"
                                    class="d-flex justify-content-center d-sm-block nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="2rem" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M456 0c-48.6 0-88 39.4-88 88v29.2L12.5 390.6c-14 10.8-16.6 30.9-5.9 44.9s30.9 16.6 44.9 5.9L126.1 384H259.2l46.6 113.1c5 12.3 19.1 18.1 31.3 13.1s18.1-19.1 13.1-31.3L311.1 384H352c1.1 0 2.1 0 3.2 0l46.6 113.2c5 12.3 19.1 18.1 31.3 13.1s18.1-19.1 13.1-31.3l-42-102C484.9 354.1 544 280 544 192V128v-8l80.5-20.1c8.6-2.1 13.8-10.8 11.6-19.4C629 52 603.4 32 574 32H523.9C507.7 12.5 483.3 0 456 0zm0 64a24 24 0 1 1 0 48 24 24 0 1 1 0-48z"/></svg>
                                        <span class="fs-2 ms-3 d-none d-sm-inline">Bird Course</span>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="Trainer_PrivateConsultation_List.jsp"
                                    class="d-flex justify-content-center d-sm-block nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="2rem" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M112 48a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm40 304V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V256.9L59.4 304.5c-9.1 15.1-28.8 20-43.9 10.9s-20-28.8-10.9-43.9l58.3-97c17.4-28.9 48.6-46.6 82.3-46.6h29.7c33.7 0 64.9 17.7 82.3 46.6l44.9 74.7c-16.1 17.6-28.6 38.5-36.6 61.5c-1.9-1.8-3.5-3.9-4.9-6.3L232 256.9V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V352H152zM432 224a144 144 0 1 1 0 288 144 144 0 1 1 0-288zm0 240a24 24 0 1 0 0-48 24 24 0 1 0 0 48zM368 321.6V328c0 8.8 7.2 16 16 16s16-7.2 16-16v-6.4c0-5.3 4.3-9.6 9.6-9.6h40.5c7.7 0 13.9 6.2 13.9 13.9c0 5.2-2.9 9.9-7.4 12.3l-32 16.8c-5.3 2.8-8.6 8.2-8.6 14.2V384c0 8.8 7.2 16 16 16s16-7.2 16-16v-5.1l23.5-12.3c15.1-7.9 24.5-23.6 24.5-40.6c0-25.4-20.6-45.9-45.9-45.9H409.6c-23 0-41.6 18.6-41.6 41.6z"/></svg>
                                        <span class="fs-2 ms-3 d-none d-sm-inline">Consultation</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <c:choose>
                        <c:when test="${empty user}">
                            <c:redirect url="signin.jsp" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="fullname" value="${user.fullName}"></c:set>
                                <div class="dropdown auth-section mt-auto mb-5 w-100">
                                    <button class="btn btn-secondary dropdown-toggle user-button" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><svg width="16" height="16" viewBox="0 0 19 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M9.5 0.00173437C8.6944 -0.017608 7.89308 0.125002 7.14317 0.421175C6.39327 0.717349 5.70993 1.1611 5.13335 1.72634C4.55677 2.29157 4.09859 2.96687 3.78576 3.71251C3.47294 4.45815 3.31179 5.25908 3.31179 6.06817C3.31179 6.87726 3.47294 7.67819 3.78576 8.42383C4.09859 9.16947 4.55677 9.84476 5.13335 10.41C5.70993 10.9752 6.39327 11.419 7.14317 11.7152C7.89308 12.0113 8.6944 12.1539 9.5 12.1346C10.3056 12.1539 11.1069 12.0113 11.8568 11.7152C12.6067 11.419 13.2901 10.9752 13.8667 10.41C14.4432 9.84476 14.9014 9.16947 15.2142 8.42383C15.5271 7.67819 15.6882 6.87726 15.6882 6.06817C15.6882 5.25908 15.5271 4.45815 15.2142 3.71251C14.9014 2.96687 14.4432 2.29157 13.8667 1.72634C13.2901 1.1611 12.6067 0.717349 11.8568 0.421175C11.1069 0.125002 10.3056 -0.017608 9.5 0.00173437ZM6.04545 15.5997C4.4421 15.5997 2.90442 16.2392 1.77067 17.3775C0.63693 18.5158 0 20.0597 0 21.6696V26H19V21.6696C19 20.0597 18.3631 18.5158 17.2293 17.3775C16.0956 16.2392 14.5579 15.5997 12.9545 15.5997H6.04545Z"
                                                fill="white" />
                                            </svg></span>
                                        ${fullname}
                                </button>
                                <div class="dropdown-menu" style="background-color: rgba(0,0,0,0); border: 0;">
                                    <ul class="subnav">
                                        <a class="dropdown-item" href="LogoutController" style="text-decoration: none">     <li>Logout</li></a>
                                    </ul>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:when>


            <c:when test="${role eq 'staff'}">
                <div
                    class="bg-white col-2 col-md-4 col-lg-2 min-vh-100 d-flex flex-column p-0 sidebar-staff"
                    style="width: 13%"
                    >
                    <a
                        href="#"
                        class="d-flex text-decoration-none align-items-center text-white nav-logo logo-container"
                        >
                        <span class="d-block d-sm-none w-auto">
                            <img src=./img/logo_white.png alt="page logo" style="width:
                                 5rem;"/>
                        </span>
                        <span class="fs-4 m-auto d-none d-sm-inline">
                            <div class="d-flex p-3">
                                <div class="logo-image">
                                    <img src=./img/logo_white.png alt="page logo" />
                                </div>
                                <div class="logo-text">
                                    <p style="margin: 0">BIRD</p>
                                    <p style="margin: 0">TRADING</p>
                                    <p style="margin: 0">CENTER</p>
                                </div>
                            </div>
                        </span>
                    </a>
                    <div class="bg-white p-2">
                        <ul class="nav nav-pills flex-column mt-4">
                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="#"
                                    class="d-flex d-sm-flex nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg width="21" height="20" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M7 19V7" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M20 7H1" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M1 6.976C1 2.05476 2.11336 1 7.308 1H13.692C18.8866 1 20 2.05476 20 6.976V13.024C20 17.9452 18.8866 19 13.692 19H7.308C2.11336 19 1 17.9452 1 13.024V6.976Z" stroke="black" stroke-width="2"/>
                                        </svg>
                                        <span class="fs-2 ms-3 d-none d-sm-inline">Dashboard</span>
                                    </div>
                                </a>
                            </li>

                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="Staff_ConsultationForm_Pending.jsp"
                                    class="d-flex d-sm-flex nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg
                                            width="19"
                                            height="19"
                                            viewBox="0 0 19 19"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            >
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M18.136 1.91515C18.136 1.57682 17.9538 1.25189 17.6299 1.01251C17.3061 0.773121 16.8665 0.638428 16.4087 0.638428C13.0993 0.638428 5.90001 0.638428 2.59055 0.638428C2.13283 0.638428 1.69323 0.773121 1.36937 1.01251C1.04551 1.25189 0.863281 1.57682 0.863281 1.91515C0.863281 5.12099 0.863281 13.4995 0.863281 16.9715C0.863281 17.2294 1.07401 17.4624 1.39615 17.5613C1.71915 17.6596 2.09051 17.6054 2.33751 17.4228C2.81855 17.0672 3.32637 16.6919 3.70724 16.4104C4.04405 16.1614 4.5916 16.1614 4.92842 16.4104C5.34124 16.7155 5.88533 17.1177 6.29814 17.4228C6.63496 17.6718 7.18251 17.6718 7.51933 17.4228C7.93387 17.1164 8.48056 16.7123 8.89425 16.4065C9.22934 16.1589 9.77255 16.1569 10.1102 16.4027C10.5343 16.711 11.0974 17.1202 11.5223 17.4286C11.8617 17.675 12.4058 17.6724 12.7409 17.4228C13.1485 17.1196 13.684 16.7206 14.0933 16.4155C14.2557 16.2948 14.4759 16.2272 14.7065 16.2272C14.9362 16.2265 15.1573 16.2948 15.3188 16.4155C15.6936 16.6938 16.1885 17.0628 16.6592 17.4132C16.9062 17.5971 17.2776 17.652 17.6014 17.5537C17.9253 17.4554 18.136 17.2224 18.136 16.9632C18.136 13.4873 18.136 5.11843 18.136 1.91515Z"
                                            fill="white"
                                            />
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M4.31818 16.8616L5.68791 17.8741C6.36241 18.3726 7.45577 18.3726 8.13027 17.8741L9.50519 16.8578L10.9172 17.8836C11.5952 18.3765 12.6842 18.3713 13.3544 17.8728L14.7069 16.8655L16.0472 17.8632C16.5404 18.2303 17.2839 18.3407 17.9308 18.1441C18.5777 17.9468 19 17.4808 19 16.9631V1.91508C19 1.40694 18.7271 0.919874 18.2409 0.561116C17.7555 0.20172 17.0965 0 16.4091 0C13.0996 0 5.90036 0 2.59091 0C1.90345 0 1.2445 0.20172 0.759134 0.561116C0.272907 0.919874 0 1.40694 0 1.91508V16.9714C0 17.4879 0.420578 17.9532 1.06658 18.1511C1.71171 18.3484 2.45446 18.2392 2.94846 17.8741L4.31818 16.8616ZM17.2727 16.9638L15.9324 15.9654C15.6076 15.7241 15.1663 15.5881 14.706 15.5887C14.2457 15.5887 13.8044 15.7247 13.4805 15.966L12.128 16.9733L10.716 15.9475C10.0398 15.456 8.95419 15.4598 8.28401 15.9552L6.90909 16.9714L5.53936 15.959C4.86486 15.4604 3.7715 15.4604 3.097 15.959L1.72727 16.9714C1.72727 13.4994 1.72727 5.12092 1.72727 1.91508C1.72727 1.74591 1.81795 1.58313 1.98032 1.46376C2.14182 1.34375 2.36205 1.27672 2.59091 1.27672H16.4091C16.638 1.27672 16.8582 1.34375 17.0197 1.46376C17.182 1.58313 17.2727 1.74591 17.2727 1.91508V16.9638ZM4.31818 12.7672H5.18182C5.65855 12.7672 6.04545 12.4812 6.04545 12.1288C6.04545 11.7765 5.65855 11.4905 5.18182 11.4905H4.31818C3.84145 11.4905 3.45455 11.7765 3.45455 12.1288C3.45455 12.4812 3.84145 12.7672 4.31818 12.7672ZM8.63636 12.7672H14.6818C15.1585 12.7672 15.5455 12.4812 15.5455 12.1288C15.5455 11.7765 15.1585 11.4905 14.6818 11.4905H8.63636C8.15964 11.4905 7.77273 11.7765 7.77273 12.1288C7.77273 12.4812 8.15964 12.7672 8.63636 12.7672ZM4.31818 8.93703H5.18182C5.65855 8.93703 6.04545 8.65105 6.04545 8.29867C6.04545 7.9463 5.65855 7.66031 5.18182 7.66031H4.31818C3.84145 7.66031 3.45455 7.9463 3.45455 8.29867C3.45455 8.65105 3.84145 8.93703 4.31818 8.93703ZM8.63636 8.93703H14.6818C15.1585 8.93703 15.5455 8.65105 15.5455 8.29867C15.5455 7.9463 15.1585 7.66031 14.6818 7.66031H8.63636C8.15964 7.66031 7.77273 7.9463 7.77273 8.29867C7.77273 8.65105 8.15964 8.93703 8.63636 8.93703ZM4.31818 5.10687H5.18182C5.65855 5.10687 6.04545 4.82089 6.04545 4.46852C6.04545 4.11614 5.65855 3.83016 5.18182 3.83016H4.31818C3.84145 3.83016 3.45455 4.11614 3.45455 4.46852C3.45455 4.82089 3.84145 5.10687 4.31818 5.10687ZM8.63636 5.10687H14.6818C15.1585 5.10687 15.5455 4.82089 15.5455 4.46852C15.5455 4.11614 15.1585 3.83016 14.6818 3.83016H8.63636C8.15964 3.83016 7.77273 4.11614 7.77273 4.46852C7.77273 4.82089 8.15964 5.10687 8.63636 5.10687Z"
                                            fill="black"
                                            />
                                        </svg>

                                        <span class="fs-2 ms-3 d-none d-sm-inline">Form list</span>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="Staff_OrderList_Consult_Completed.jsp"
                                    class="d-flex d-sm-flex nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg
                                            width="19"
                                            height="19"
                                            viewBox="0 0 19 19"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            >
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M0.0323278 5.34888C0.0323278 4.37211 0.798042 3.61578 1.95122 3.61578C3.10439 3.61578 5.47032 3.58959 5.47032 3.58959C5.47032 3.58959 5.43422 2.776 5.43422 1.74125C5.43422 0.706744 6.37266 0 7.49776 0C8.62308 0 14.1976 0.0466741 14.7446 0.0466741C15.2915 0.0466741 15.7353 0.246755 16.3484 0.706628C16.9615 1.16673 17.8884 1.93575 18.3473 2.44811C18.8063 2.96048 19 3.25961 19 3.68236C19 4.10521 19 12.6279 18.9929 13.6154C18.986 14.603 18.0636 15.333 16.9714 15.3475C15.8792 15.3619 13.5339 15.3619 13.5339 15.3619C13.5339 15.3619 13.5889 16.0923 13.5889 17.1253C13.5889 18.1583 12.6325 18.9656 11.5458 18.9941C10.4591 19.0226 3.05755 18.9371 2.00278 18.9656C0.948 18.9941 0 18.1748 0 17.1705C0 16.1663 0.0323278 6.32555 0.0323278 5.34888ZM2.00667 5.80817L1.87075 16.6157C1.86994 16.6767 1.88142 16.7373 1.90452 16.7939C1.92762 16.8505 1.96188 16.902 2.00533 16.9455C2.04877 16.9889 2.10052 17.0234 2.15758 17.0469C2.21464 17.0705 2.27588 17.0826 2.33773 17.0827L11.0583 17.1083C11.1197 17.109 11.1807 17.0975 11.2376 17.0744C11.2944 17.0513 11.3459 17.017 11.389 16.9738C11.4321 16.9305 11.4659 16.8792 11.4883 16.8227C11.5107 16.7662 11.5214 16.7059 11.5196 16.6453L11.4939 15.6103C11.4933 15.5797 11.4866 15.5495 11.4742 15.5214C11.4617 15.4934 11.4438 15.468 11.4213 15.4469C11.3988 15.4257 11.3724 15.4092 11.3434 15.3982C11.3144 15.3873 11.2835 15.3821 11.2525 15.383C11.2525 15.383 8.67264 15.4575 7.50448 15.4171C6.3362 15.3766 5.53745 14.6248 5.5371 13.6111C5.53675 12.5974 5.53745 5.5634 5.53745 5.5634C5.53752 5.53278 5.53142 5.50245 5.51953 5.47417C5.50763 5.44589 5.49016 5.42022 5.46814 5.39865C5.44612 5.37708 5.41997 5.36003 5.39123 5.34849C5.36248 5.33695 5.3317 5.33115 5.30066 5.33142L2.48427 5.34097C2.35856 5.34184 2.2382 5.39121 2.14894 5.47853C2.05967 5.56585 2.00861 5.68418 2.00667 5.80817ZM14.5729 1.70436C14.3763 1.53559 14.2171 1.60659 14.2171 1.86405V3.87243C14.2171 4.00116 14.3225 4.10603 14.4527 4.10673L16.9148 4.11848C17.1748 4.11976 17.2263 3.98393 17.0299 3.81516L14.5729 1.70436ZM7.77632 1.80294C7.74526 1.80267 7.71445 1.80844 7.68565 1.81992C7.65686 1.83141 7.63064 1.84838 7.6085 1.86987C7.58637 1.89137 7.56874 1.91695 7.55664 1.94517C7.54454 1.9734 7.5382 2.00369 7.53799 2.03433L7.46413 13.242C7.46368 13.2878 7.47244 13.3332 7.48991 13.3755C7.50738 13.4179 7.5332 13.4564 7.56589 13.4889C7.59858 13.5213 7.63747 13.5471 7.68032 13.5646C7.72317 13.5821 7.76911 13.591 7.81549 13.5909L16.6879 13.5692C16.7511 13.5689 16.8117 13.5443 16.8567 13.5005C16.9018 13.4568 16.9277 13.3974 16.929 13.335L17.0786 6.0696C17.0795 6.03917 17.0741 6.00889 17.0628 5.98055C17.0516 5.95222 17.0347 5.9264 17.0131 5.90464C16.9915 5.88288 16.9657 5.86562 16.9373 5.85389C16.9088 5.84216 16.8782 5.83619 16.8474 5.83634C16.8474 5.83634 13.7595 5.84123 13.2155 5.84123C12.6715 5.84123 12.3265 5.5826 12.3265 5.08676C12.3265 4.59093 12.3161 2.0646 12.3161 2.0646C12.3156 2.0025 12.2905 1.94308 12.246 1.89914C12.2015 1.85519 12.1413 1.83026 12.0784 1.82971L7.7762 1.80294H7.77632Z"
                                            fill="black"
                                            />
                                        </svg>

                                        <span class="fs-2 ms-3 d-none d-sm-inline">Order list</span>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item py-2 py-sm-4">
                                <a
                                    href="#"
                                    class="d-flex d-sm-flex nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg width="19" height="21" viewBox="0 0 19 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6 10H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M1 5.22222C1 3.23185 1 2.23666 1.6224 1.61833C2.24479 1 3.24653 1 5.25 1H13.75C15.7534 1 16.7552 1 17.3776 1.61833C18 2.23666 18 3.23185 18 5.22222V13.6667C18 16.6522 18 18.145 17.0664 19.0725C16.1328 20 14.6302 20 11.625 20H7.375C4.36979 20 2.8672 20 1.9336 19.0725C1 18.145 1 16.6522 1 13.6667V5.22222Z" stroke="#33363F" stroke-width="2"/>
                                        <path d="M13 17V20M6 17V20" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M6 6H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        </svg>
                                        <span class="fs-2 ms-3 d-none d-sm-inline">Services</span>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item py-2 py-sm-4 mask">
                                <a
                                    href="#"
                                    class="d-flex d-sm-flex nav-link text-black"
                                    >
                                    <div class="d-flex align-items-center" style="margin: 3% 0;">
                                        <svg
                                            width="20"
                                            height="22"
                                            viewBox="0 0 20 22"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            >
                                        <path
                                            d="M18.8235 0H1.17647C0.529412 0 0 0.45 0 1V21C0 21.55 0.529412 22 1.17647 22H18.8235C19.4706 22 20 21.55 20 21V1C20 0.45 19.4706 0 18.8235 0ZM17.6471 20H2.35294V2H17.6471V20ZM4.85294 15.75C4.85294 15.2 5.38235 14.75 6.02941 14.75H13.9706C14.6176 14.75 15.1471 15.2 15.1471 15.75C15.1471 16.3 14.6176 16.75 13.9706 16.75H6.02941C5.38235 16.75 4.85294 16.3 4.85294 15.75ZM5.02941 11C5.02941 10.45 5.55882 10 6.20588 10H13.9412C14.5882 10 15.1176 10.45 15.1176 11C15.1176 11.55 14.5882 12 13.9412 12H6.20588C5.55882 12 5.02941 11.55 5.02941 11ZM5.02941 6.25C5.02941 5.7 5.55882 5.25 6.20588 5.25H13.9412C14.5882 5.25 15.1176 5.7 15.1176 6.25C15.1176 6.8 14.5882 7.25 13.9412 7.25H6.20588C5.55882 7.25 5.02941 6.8 5.02941 6.25Z"
                                            fill="black"
                                            />
                                        </svg>

                                        <span class="fs-2 ms-3 d-none d-sm-inline">Blogs</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <c:choose>
                        <c:when test="${empty user}">
                            <c:redirect url="signin.jsp" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="username" value="${user.username}"></c:set>
                                <div class="dropdown auth-section mt-auto mb-5 w-100">
                                    <button class="btn btn-secondary dropdown-toggle user-button" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span><svg width="16" height="16" viewBox="0 0 19 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M9.5 0.00173437C8.6944 -0.017608 7.89308 0.125002 7.14317 0.421175C6.39327 0.717349 5.70993 1.1611 5.13335 1.72634C4.55677 2.29157 4.09859 2.96687 3.78576 3.71251C3.47294 4.45815 3.31179 5.25908 3.31179 6.06817C3.31179 6.87726 3.47294 7.67819 3.78576 8.42383C4.09859 9.16947 4.55677 9.84476 5.13335 10.41C5.70993 10.9752 6.39327 11.419 7.14317 11.7152C7.89308 12.0113 8.6944 12.1539 9.5 12.1346C10.3056 12.1539 11.1069 12.0113 11.8568 11.7152C12.6067 11.419 13.2901 10.9752 13.8667 10.41C14.4432 9.84476 14.9014 9.16947 15.2142 8.42383C15.5271 7.67819 15.6882 6.87726 15.6882 6.06817C15.6882 5.25908 15.5271 4.45815 15.2142 3.71251C14.9014 2.96687 14.4432 2.29157 13.8667 1.72634C13.2901 1.1611 12.6067 0.717349 11.8568 0.421175C11.1069 0.125002 10.3056 -0.017608 9.5 0.00173437ZM6.04545 15.5997C4.4421 15.5997 2.90442 16.2392 1.77067 17.3775C0.63693 18.5158 0 20.0597 0 21.6696V26H19V21.6696C19 20.0597 18.3631 18.5158 17.2293 17.3775C16.0956 16.2392 14.5579 15.5997 12.9545 15.5997H6.04545Z"
                                                fill="white" />
                                            </svg></span>
                                        ${username}
                                </button>
                                <div class="dropdown-menu" style="background-color: rgba(0,0,0,0); border: 0;">
                                    <ul class="subnav">
                                        <a class="dropdown-item" href="LogoutController" style="text-decoration: none">     <li>Logout</li></a>
                                    </ul>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:when>
        </c:choose>

    </body>
</html>
