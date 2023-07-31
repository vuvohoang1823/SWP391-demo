<%-- 
    Document   : BirdProfileCustomer_UPDATEBIRD
    Created on : Jul 31, 2023, 4:10:41 PM
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
    </head>
    <body>
        <jsp:useBean id="b" class="DAO.CustomerBirdDAO" ></jsp:useBean>
        <c:set var="customerId" value="<%=customerID%>" />
        <h1>Update a  bird</h1>
        <c:if test="${not empty sessionScope.Customer_Bird}">
            <c:set var="detail" value="${sessionScope.Customer_Bird}"></c:set>
                <form id="birdForm" method="post" action="Bird_UpdateBirdByCustomerServlet" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="birdName">Name of Bird:</label>
                        <input type="text" id="birdName" name="birdName" value="${detail.name}" required>
                </div>
                <div>
                    <input type="hidden" name="customerID"  value="${customerId}">
                </div>
                <div>
                    <input type="hidden" name="birdId" value="${detail.bird_id}">
                </div>

                <div class="form-group">
                    <label for="birdImage">Upload Bird Image:</label>
                    <input type="file" id="birdImage" name="birdImage" accept="image/*" >
                    <img style="width:250px"  src="data:images/jpg;base64,${detail.bird_img}"/> 
                    <input type="hidden" name="birdIMGDATA" value="${detail.bird_img}"/>
                </div>

                <div class="form-group">
                    <label for="birdType">Type of Bird:</label>

                    <%--                <select id="birdType" name="birdType" required>
                                        <c:forEach var="type_list" items="${b.lisofType_of_Bird}">
                                            <option value="${type_list.type_id}">${type_list.type_name}</option>
                                        </c:forEach>

                </select>--%>
                    <select id="birdType" name="birdType" required>
                        <c:forEach var="type_list" items="${b.lisofType_of_Bird}">
                            <option value="${type_list.type_id}"
                                    <c:if test="${type_list.type_id eq detail.type_id}">
                                        selected
                                    </c:if>
                                    >${type_list.type_name}
                             
                            </option>
                        </c:forEach>
                    </select>


                </div>

                <div class="form-group">
                    <label for="birdBirthday">Birthday:</label>
                    <input type="date" id="birdBirthday" name="birdBirthday"  value="${detail.birdDate}"required>
                </div>

                <div class="form-group">
                    <button type="submit" class="submit-button">Update</button>
                    <button type="button" class="cancel-button" onclick="cancelForm()">Cancel</button>
                </div>
            </form>
        </c:if>
    </body>
</html>
