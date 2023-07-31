<%-- 
    Document   : BirdProfileCustomer_ADDBIRD
    Created on : Jul 31, 2023, 12:30:35 PM
    Author     : ASUS
--%>
<%@page import="entity.CustomerDTO"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="entity.UserDTO"%>
<%
    // Retrieve the UserDTO object from the session
    CustomerDTO user = (CustomerDTO) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    CustomerDAO customerDAO = new CustomerDAO();

    // Get the customer ID using the user ID
    int customerID = customerDAO.getCustomerID(user.getUser_id());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            h1 {
                text-align: center;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="file"],
            select,
            input[type="date"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .submit-button,
            .cancel-button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .submit-button {
                background-color: #4CAF50;
                color: white;
            }

            .cancel-button {
                background-color: #f44336;
                color: white;
                margin-left: 10px;
            }

            .submit-button:hover,
            .cancel-button:hover {
                opacity: 0.8;
            }

        </style>

        <jsp:useBean id="b" class="DAO.CustomerBirdDAO" scope="request"></jsp:useBean>
        </head>
        <body>
            <c:set var="customerId" value="<%=customerID%>" />
            <h1>ADD a new bird</h1>
            <form id="birdForm" method="post" action="Bird_AddANewBirdByCustomerServlet" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="birdName">Name of Bird:</label>
                    <input type="text" id="birdName" name="birdName" required>
                </div>
                 <div >
                     <input type="hidden" name="customerID"  value="${customerId}">
                </div>

                <div class="form-group">
                    <label for="birdImage">Upload Bird Image:</label>
                    <input type="file" id="birdImage" name="birdImage" accept="image/*" required>
                </div>

                <div class="form-group">
                    <label for="birdType">Type of Bird:</label>

                    <select id="birdType" name="birdType" required>
                    <c:forEach var="type_list" items="${b.lisofType_of_Bird}">
                        <option value="${type_list.type_id}">${type_list.type_name}</option>
                    </c:forEach>

                </select>
            </div>

            <div class="form-group">
                <label for="birdBirthday">Birthday:</label>
                <input type="date" id="birdBirthday" name="birdBirthday" required>
            </div>

            <div class="form-group">
                <button type="submit" class="submit-button">Submit</button>
                <button type="button" class="cancel-button" onclick="cancelForm()">Cancel</button>
            </div>
        </form>

        <script>
            function cancelForm() {
                document.getElementById("birdForm").reset();
            }
        </script>
    </body>
</html>
