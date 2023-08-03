<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/Admin_listBird.css" type="text/css">
    </head>
    <body>
        <jsp:useBean id="i" class="DAO.UserDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="a" class="DAO.BirdDAO" scope="request"></jsp:useBean>

            <div class="container-fluid">
                <div class="row flex-nowrap">
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg fill="#000000" viewBox="0 0 128 128" width="40" height="40" id="Layer_1" version="1.1" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M124.3,32.3l2.4-3.2l-6.4-4.8l-2.4,3.2c-2.7,3.6-5.9,6.7-9.5,9.2l-1.7,3.4c0,1,0.1,2,0.1,3c0,26.9-20.1,64.7-64.7,64.7 c-3.4,0-6.8-0.3-10.1-0.8l-4-0.6l-1.2,7.9l4,0.6c3.7,0.6,7.6,0.9,11.4,0.9c27.4,0,44.5-12.9,54-23.7c11.9-13.5,18.7-31.3,18.7-49 c0-0.4,0-0.8,0-1.2C118.4,39.2,121.5,35.9,124.3,32.3z"></path> <path d="M10.8,105.3c11.9,0,23.1-3.9,32.5-11.2l3.1-2.5l-4.9-6.3l-3.1,2.5c-7.9,6.2-17.4,9.5-27.5,9.5c-1.8,0-3.5-0.1-5.3-0.3 l-4-0.5l-0.9,7.9l4,0.5C6.7,105.2,8.8,105.3,10.8,105.3z"></path> <path d="M22.8,80.5c2.5,0,5-0.3,7.4-1l3.9-1L32,70.8l-3.9,1c-2.9,0.8-6.1,0.9-9.1,0.3l-3.9-0.8l-1.5,7.9l3.9,0.8 C19.3,80.4,21.1,80.5,22.8,80.5z"></path> <path d="M24.6,59.8l0.3-8l-4-0.1c-3.2-0.1-6.3-1-9.1-2.5l-3.5-1.9l-3.9,7l3.5,1.9c3.9,2.2,8.3,3.4,12.8,3.5L24.6,59.8z"></path> <path d="M67,44.9c-0.3-1.5-0.5-3-0.5-4.6c0-11.1,9-20.2,20.2-20.2c5.6,0,10.9,2.3,14.7,6.4l3.7,1.2c4.7-0.9,9.3-2.5,13.6-4.7 l3.6-1.8l-3.6-7.1l-3.6,1.8c-3,1.5-6.2,2.7-9.5,3.5c-5.1-4.6-11.9-7.3-18.9-7.3c-15.5,0-28.2,12.6-28.2,28.2c0,0.4,0,0.7,0,1.1 C42.1,39.3,26.9,31,16.4,18.1l-6.6,0.5C7.3,22.8,6,27.7,6,32.7v4h8v-4c0-1.6,0.2-3.2,0.6-4.7c12.7,13,30,20.9,48.3,21.8L67,44.9z"></path> </g> </g></svg>

                            <span style="padding-left: 2rem">Bird List</span>
                        </div>
                    </section>
                    <section class="form-body">
                        <nav class="navbar navbar-expand-lg navbar-light">
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
                                Currently showing <c:out value="${a.allBirds.size()}"/> bird(s)
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
                                    <td>Customer Name</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${a.allBirds}" var="bird" varStatus="counter">
                                    <tr>

                                <input type="hidden" name="" value="">
                                <td><b>${counter.count}</b></td>
                                <td class="image-table">
                                    <img src="data:images/jpg;base64,${bird.image}" alt="" width="256" height="256" />
                                </td>
                                <td>${bird.name}</td>
                                <td>${bird.type}e</td>
                                <td>${bird.birthDate}</td>
                                <td>${bird.customerName}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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


