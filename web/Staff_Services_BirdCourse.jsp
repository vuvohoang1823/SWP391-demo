<%--
    Document   : Staff_Services_OnlineCourse
    Created on : Jul 7, 2023, 11:56:57 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- boostrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- w3Table -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/Staff_Services_OnlineCourse.css" />
    </head>
    <body>
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->

                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <%@ include file="Staff_Services_Head.jsp" %>
                    <!--                    <section class="form-body">
                                            <nav class="navbar navbar-expand-lg navbar-light" style="margin-bottom: 4rem;">
                                                <div>
                                                    <a href="admin_services_account_create-detail.jsp">
                                                    <a href="Staff_createCourse.jsp">
                                                        <button style="
                                                                width: 204px;
                                                                height: 44px;
                                                                margin-right: 3rem;
                                                                border-radius: 10px;
                                                                white-space: nowrap;
                                                                background-color: #0A7E65;
                                                                padding: 0 2rem;
                                                                color: white;
                                                                border: none;
                                                                text-align: center;
                                                                text-decoration: none;
                                                                display: inline-block;
                                                                font-size: 20px;
                                                                font-weight: 700;
                                                                ">
                                                            Add new course
                                                        </button>
                                                    </a>

                                                    </a>
                                                </div>
                                                <form class="form-inline my-2 my-lg-0">
                                                    <div class="search-container">
                                                        <div style="white-space: nowrap; padding-right: 2rem">Search by ID</div>
                                                        <div class="input-group">
                                                            <input
                                                                id="trainername"
                                                                type="search"
                                                                class="form-control mr-sm-2"
                                                                />
                                                            <button
                                                                class="btn btn-light"
                                                                type="submit"
                                                                id="button-addon2"
                                                                >
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </nav>
                                            <table
                                                class="w3-table-all w3-hoverable w3-card-4 table-form"
                                                style="width: 97.5%; margin: 0 auto"
                                                >
                                                <thead>
                                                    <tr>
                                                        <td>ID</td>
                                                        <td>Course Name</td>
                                                        <td>Category</td>
                                                        <td></td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                    <%--<c:forEach items="${i.allCourseBirdCourse}" var="course" varStatus="counter">--%>
                        <tr>
                    <input type="hidden" name="" value="">
                    <td><b>${counter.count}</b></td>
                    <td><b>${course.title}</b></td>
                    <td><b>${course.category}</b></td>
                    <td>
                        <form action="CourseDetail" method="POST">
                            <input type="hidden" name="course_id" value="${course.courseID}">
                            <button type="submit" style="
                                    font-size: 1.5rem;
                                    border-radius: 5px;
                                    background-color: white;
                                    color: black;
                                    padding: 1rem 3rem;
                                    margin-right: -4rem;
                                    ">
                                <b>Modify</b>
                            </button>
                        </form>
                    </td>
                    </tr>
                    <%--</c:forEach>--%>
                    </tbody>
                </table>
            </section>-->



                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="update">
                                <a href="Staff_createCourse.jsp">
                                    <button class="create-button">Create new item</button>
                                </a>
                            </div>
                            <form class="form-inline my-2 my-lg-0">
                                <div class="search-container">
                                    <div style="white-space: nowrap; padding-right: 2rem">Search by ID</div>
                                    <div class="input-group">
                                        <input
                                            id="trainername"
                                            type="search"
                                            class="form-control mr-sm-2"
                                            />
                                        <button
                                            class="btn btn-light"
                                            type="submit"
                                            id="button-addon2"
                                            >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </nav>
                        <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 2rem 0;">
                            Currently showing <c:out value="${i.allCourseBirdCourse.size()}"/> course(s)
                        </div>
                        <div class="blogs-container" style="flex-wrap: wrap">
                            <!-- start of card -->
                            <c:forEach items="${i.allCourseBirdCourse}" var="course" varStatus="counter">

                                <div class="blog-container">
                                    <img
                                        src="data:images/jpg;base64,${course.image}"
                                        class="card-img-top"
                                        alt="Product 1"
                                        />
                                    <div class="desc-container">
                                        <div class="extra-price">
                                            <p>${course.price}$</p>
                                        </div>
                                        <h5 class="blog-title">${course.title}</h5>
                                        <div class="card-text row">
                                            <div class="col-lg-6 d-flex align-items-center" style="justify-content: space-evenly;">
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
                                                <span>${course.duration} days</span>
                                            </div>
                                            <div class="col-lg-6 d-flex align-items-center" style="justify-content: space-evenly;">
                                                <span style="color: #617a55">
                                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M14.0751 9.23077V0H20V9.23077H14.0751ZM7.03755 9.23077V0H12.9624V9.23077H7.03755ZM0 9.23077V0H5.9249V9.23077H0ZM0 20V10.7692H5.9249V20H0ZM7.03755 20V10.7692H12.9624V20H7.03755ZM14.0751 20V10.7692H20V20H14.0751Z" fill="#617A55"/>
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
                                            margin: 15px auto;
                                            "
                                            />
                                        <div class="review row">
                                            <div class="star col-lg-3 d-flex align-items-center justify-content-center">
                                                <div>5/5</div>
                                                <div>
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M5.825 22L7.45 14.975L2 10.25L9.2 9.625L12 3L14.8 9.625L22 10.25L16.55 14.975L18.175 22L12 18.275L5.825 22Z" fill="#F69C14"/>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="review-count col-lg-9 d-flex align-items-center justify-content-center">based on 100 reviews</div>
                                        </div>
                                    </div>
                                    <div class="update">
                                        <form action="CourseDetail" method="post" style="display: inline;">
                                            <input type="hidden" name="course_id" value="${course.courseID}" />
                                            <button class="update-button " type="submit" name="action" value="update">Update</button>
                                        </form>
                                    </div>
                                    <div class="delete">
                                        <form class="deleteForm" action="UpdateCourse" value="delete" method="post" style="display: inline;">
                                            <input type="hidden" name="course_id" value="${course.courseID}" />
                                            <button class="delete-button" type="button" data-bs-toggle="modal" data-bs-target="#confirmDelete-${course.courseID}">Delete</button>
                                            <div class="modal fade" id="confirmDelete-${course.courseID}" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title" style="font-size: 3rem">Delete</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body fs-2">
                                                            Do you want to delete this course?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary fs-2" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" name="action" value="delete" class="btn btn-primary fs-2" data-bs-dismiss="modal">Yes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--end of card-->
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
        <!--toast-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
