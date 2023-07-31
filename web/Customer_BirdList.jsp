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
        <link rel="stylesheet" href="css/Customer_BirdList.css" />
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="profileHeading">
            <p>My Birds</p>
        </div>
        <section class="form-body">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="update">
                    <a href="Customer_AddBird.jsp">
                        <button class="create-button">Add New Bird</button>
                    </a>
                </div>
                <form class="form-inline my-2 my-lg-0">
                    <div class="search-container">
                        <div style="white-space: nowrap; padding-right: 2rem">Search by Bird</div>
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
            <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 3rem 0;">
                <div class="d-flex justify-content-center" style="font-size: 1.5rem; padding: 2rem 0;">
                    Currently showing <c:out value="${i.allAccount.size()}"/> bird(s)
                </div>
            </div>
            <table
                class="w3-table-all w3-hoverable w3-card-4 table-form"
                style="width: 97.5%; margin: 0 auto"
                >
                <thead>
                    <tr>
                        <td>No</td>
                        <td>Bird Image</td>
                        <td>Bird Name</td>
                        <td>Bird Type</td>
                        <td>Bird Age</td>
                        <td>Bird Gender</td>
                        <td>Status</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                <input type="hidden" name="" value="">
                <td><b>1</b></td>
                <td class="image-table">
                    <img src="assets/images/avata.png" alt="" width="256" height="256" />
                </td>
                <td>Bird Name</td>
                <td>Bird Type</td>
                <td>Bird Age</td>
                <td>Gender</td>
                <td style="padding-right: 4rem">
                    <div style="background-color: #0A7E65; display: flex;text-align: center;justify-content: center;border-radius: 10px;">
                        <a style="padding: 1rem;font-size: 2rem;font-weight: bold">
                            Status
                        </a>
                    </div>
                </td>
                <td>
                    <a href="Customer_ModifyBird.jsp" style="text-decoration: none">
                        <button style="font-size: 2rem;
                                border-radius: 5px;
                                background-color: white;
                                font-weight: bolder;
                                color: black;
                                padding: 2rem 3rem;
                                display: flex;
                                justify-content: center">
                            Modify
                        </button>
                    </a>
                </td>
                </tr>
                </tbody>
            </table>
        </section>
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
