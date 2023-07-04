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
        <title>JSP Page</title>
        <jsp:useBean id="b"  class="DAO.BlogDAO" scope="request"></jsp:useBean>
            <style>
                .update-button {
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    padding: 8px 16px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 14px;
                    border-radius: 4px;
                    transition: background-color 0.3s;
                }

                .update-button:hover {
                    background-color: #45a049;
                }

                .delete-button {
                    background-color: #f44336;
                    color: white;
                    border: none;
                    padding: 8px 16px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 14px;
                    border-radius: 4px;
                    transition: background-color 0.3s;
                }

                .delete-button:hover {
                    background-color: #d32f2f;
                }
            </style>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>

                <div class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <h1>List of blog</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Blog ID</th>
                                <th>Title</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="card" items="${b.lisofBlog}">
                                <tr>
                                    <td>${card.blogid}</td>
                                    <td>${card.title}</td>
                                    <td>
                                        <form action="UpdateBlogServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="blogId" value="${card.blogid}" />
                                            <button class="update-button" type="submit" name="action" value="update">Update</button>
                                        </form>
                                        <form action="DeleteBlogServlet" method="post" style="display: inline;">
                                            <input type="hidden" name="blogId" value="${card.blogid}" />
                                            <button class="delete-button" type="submit" name="action" value="delete" onclick="confirmDelete(event)">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="Staff_AddBlog.jsp"> Add BLog</a>
                </div>
            </div>
        </div>
        <script>
            function confirmDelete(event) {
                event.preventDefault(); // Prevent the form from submitting immediately

                // Show a confirmation dialog
                if (confirm("Do you want to delete this blog?")) {
                    // If user clicks "OK", submit the form
                    event.target.closest('form').submit();
                } else {
                    // If user clicks "Cancel", do nothing
                    return;
                }
            }
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
