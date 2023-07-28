<%--
    Document   : Staff_list_ofblog
    Created on : Jul 4, 2023, 6:06:17 PM
    Author     : hoang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogs</title>
        <jsp:useBean id="b"  class="DAO.BlogDAO" scope="request"></jsp:useBean>
            <!-- boostrap -->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous"
                />
            <!-- w3Table -->
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
            <!--css-->
            <link rel="stylesheet" href="css/reset.css" />
            <link rel="stylesheet" href="css/Staff_Blogs_List.css" />
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg
                                width="40"
                                height="40"
                                viewBox="0 0 20 22"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path
                                d="M18.8235 0H1.17647C0.529412 0 0 0.45 0 1V21C0 21.55 0.529412 22 1.17647 22H18.8235C19.4706 22 20 21.55 20 21V1C20 0.45 19.4706 0 18.8235 0ZM17.6471 20H2.35294V2H17.6471V20ZM4.85294 15.75C4.85294 15.2 5.38235 14.75 6.02941 14.75H13.9706C14.6176 14.75 15.1471 15.2 15.1471 15.75C15.1471 16.3 14.6176 16.75 13.9706 16.75H6.02941C5.38235 16.75 4.85294 16.3 4.85294 15.75ZM5.02941 11C5.02941 10.45 5.55882 10 6.20588 10H13.9412C14.5882 10 15.1176 10.45 15.1176 11C15.1176 11.55 14.5882 12 13.9412 12H6.20588C5.55882 12 5.02941 11.55 5.02941 11ZM5.02941 6.25C5.02941 5.7 5.55882 5.25 6.20588 5.25H13.9412C14.5882 5.25 15.1176 5.7 15.1176 6.25C15.1176 6.8 14.5882 7.25 13.9412 7.25H6.20588C5.55882 7.25 5.02941 6.8 5.02941 6.25Z"
                                fill="black"
                                />
                            </svg>
                            <span style="padding-left: 2rem">Blogs</span>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="navbar-brand">Blog status:</div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <form class="form-inline my-2 my-lg-0">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Staff_list_ofblog.jsp">Active</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_list_ofblog_unactive.jsp">Not active</a>
                                        </li>
                                    </ul>
                                </div>
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
                            <div class="update">
                                <a href="Staff_AddBlog.jsp">
                                    <button class="create-button">Create new blog</button>
                                </a>
                            </div>
                        </nav>
                        <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 3rem 0;">
                            Currently showing <c:out value="${b.getLisofBlog('available').size()}" /> blog(s)
                        </div>
                        <div class="blogs-container" style="flex-wrap: wrap">
                            <!-- start of card -->
                            <c:forEach var="card" items="${b.getLisofBlog('available')}">
                                <div class="blog-container">
                                    <img src="data:images/jpg;base64,${card.thumbnail}" draggable="false"/>
                                    <div class="desc-container">
                                        <h5 class="blog-title">${card.title}</h5>
                                        <div class="date-write">
                                            <span>${card.date}</span>
                                            <span style="float: right" >${card.author}</span>
                                        </div>
                                        <div class="blog-description">
                                            ${card.briefinfo}
                                        </div>
                                    </div>
                                    <div class="button-container">
                                        <form
                                            action="Staff_BlogDetail"
                                            method="post"
                                            style="display: inline"
                                            >
                                            <input
                                                type="hidden"
                                                name="blogId"
                                                value="${card.blogid}"
                                                />
                                            <button type="submit">View detail</button>
                                        </form>
                                    </div>
                                    <div class="update">
                                        <form action="UpdateBlogServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="blogId" value="${card.blogid}" />
                                            <button class="update-button " type="submit" name="action" value="update">Update</button>
                                        </form>
                                    </div>
                                    <div class="delete">
                                        <form class="deleteForm" action="DeleteBlogServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="blogId" value="${card.blogid}" />
                                            <button class="delete-button" type="button" data-bs-toggle="modal" data-bs-target="#confirmDelete-${card.blogid}">Delete</button>
                                            <div class="modal fade" id="confirmDelete-${card.blogid}" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title" style="font-size: 3rem">Delete</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body fs-2">
                                                            Do you want to delete this blog?
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
                            <!-- end of card -->
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!--        <script>
                    window.addEventListener('DOMContentLoaded', function () {
                        var headerWidth = document.getElementById('headerPage').style.width;
                        var container = document.getElementById('containerPage');
                        container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
                    });
                </script>-->
        <!--        trim title-->
        <script>
            // Get all question message elements
            var blogTitle = document.getElementsByClassName("blog-title");

            // Loop through each question message element
            for (var i = 0; i < blogTitle.length; i++) {
                var title = blogTitle[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                title = title.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                title = title.replace(/[^ -~]+/g, "");
            }
        </script>
        <!--show toast on forms-->
        <script>
            // Get all form elements using querySelectorAll
            var forms = document.querySelectorAll(".deleteForm");
            // Attach an event listener to each form's submit event
            forms.forEach(function (form) {
                form.addEventListener("submit", function (event) {
                    // Prevent the default form submission behavior
                    event.preventDefault();
                    // Show success toast
                    Toastify({
                        text: "Delete success",
                        position: "center",
                        close: true,
                        gravity: "top",
                        duration: 3000,
                        style: {
                            fontSize: "2rem",
                            background: "linear-gradient(to right, #00b09b, #96c93d)"
                        },
                        onClick: function () {
                            form.submit();
                        }
                    }).showToast();
                    setTimeout(function () {
                        form.submit();
                    }, 1000);
                });
            });
        </script>
        <!--toast-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
