<%--
    Document   : Staff_Services_OnlineCourse
    Created on : Jul 7, 2023, 11:56:57 PM
    Author     : thang
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services</title>
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
        <link rel="stylesheet" href="css/Staff_Services_Workshop.css" />
        <jsp:useBean id="i" class="DAO.courseDAO" scope="request"></jsp:useBean>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->

                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <%@ include file="Staff_Services_Head.jsp" %>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="update">
                                <a href="Staff_Services_Workshop_Create.jsp">
                                    <button class="create-button">Create workshop</button>
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
                            <!--Currently showing 2 service(s)-->
                        </div>
                        <div class="workshops-container d-flex flex-column align-items-center">
                            <!--start workshop-->
                            <c:forEach items="${i.allCourseWorkshop}" var="workshop" >
                                <div class="workshop-container bg-white row mb-5">
                                    <div class="img-container col-lg-3">
                                        <img src="data:images/jpg;base64,${workshop.image}"/>
                                    </div>
                                    <div class="desc-container col-lg-9">
                                        <div class="title mb-3">
                                            ${workshop.title}
                                        </div>
                                        <div class="description mb-3">
                                            ${workshop.content}
                                        </div>
                                        <div class="time-location mb-3">
                                            <b>Starting date:</b> ${workshop.start_date} <br>
                                            <b>Time:</b> 2:00 PM - 4:00 PM <br>
                                            <b>Location/Venue:</b> Central Community Center <br>
                                            <b>Target Audience:</b> Bird owners of all experience levels
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center" style="margin-top: 2rem">
                                            <div class="price">£${workshop.price}</div>
                                            <div class="close-date">
                                                <div>Close</div>
                                                <div class="date">${workshop.end_enroll_date}</div>
                                            </div>
                                            <div class="close-date">
                                                <div>Close registration</div>
                                                <div class="date">${workshop.end_enroll_date}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="update">
                                        <form action="Staff_ViewWorkshopDetailServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="courseID" value="${workshop.courseID}" />
                                            <button class="update-button " type="submit" name="action" value="update">Update</button>
                                        </form>
                                    </div>


                                    <div class="delete">
                                        <form action="Staff_DeleteWorkshopServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="courseID" value="${workshop.courseID}" />
                                            <button class="delete-button " type="submit" name="action" value="update">Delete</button>
                                        </form>
                                    </div>
                                    <%--
                               <div class="delete">
                                   <form class="Staff_DeleteWorkshopServlet" action="" method="post" style="display: inline;">
                                       <input type="hidden" name="courseID" value="${workshop.courseID}" />
                                       <button class="delete-button" type="button" data-bs-toggle="modal" data-bs-target="#confirmDelete-${workshop.courseID}">Delete</button>
                                       <div class="modal fade" id="confirmDelete-${workshop.courseID}" tabindex="-1" aria-hidden="true">
                                           <div class="modal-dialog modal-dialog-centered">
                                               <div class="modal-content">
                                                   <div class="modal-header">
                                                       <h1 class="modal-title" style="font-size: 3rem">Delete</h1>
                                                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                   </div>
                                                   <div class="modal-body fs-2">
                                                       Do you want to delete this workshop?
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
                                    --%>
                                </div>
                            </c:forEach>
                            <!--end workshop-->
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
