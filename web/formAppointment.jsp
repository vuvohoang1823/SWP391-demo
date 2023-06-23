<%--
    Document   : formAppointment
    Created on : Jun 13, 2023, 11:40:28 AM
    Author     : hoang
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="i" class="DAO.TrainerDAO" scope="request"></jsp:useBean>

            <title>JSP Page</title>
            <style>
                body {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    background-color: #f1f1f1;
                }

                form {
                    width: 400px;
                    padding: 20px;
                    background-color: #ffffff;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                h5 {
                    text-align: center;
                }

                label {
                    display: block;
                    margin-bottom: 5px;
                }

                input[type="text"],
                input[type="email"],
                textarea,
                select {
                    width: 100%;
                    padding: 8px;
                    margin-bottom: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                button[type="reset"],
                button[type="submit"] {
                    width: 100%;
                    padding: 10px;
                    margin-top: 10px;
                    border: none;
                    border-radius: 4px;
                    background-color: #4caf50;
                    color: #ffffff;
                    cursor: pointer;
                }

                button[type="reset"] {
                    background-color: #f44336;
                }

                button[type="reset"]:hover,
                button[type="submit"]:hover {
                    opacity: 0.8;
                }
                .trainer-item {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                }

                .trainer-avatar {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    margin-right: 10px;
                }

                .trainer-name {
                    font-weight: bold;
                }

                .trainer-skill {
                    color: gray;
                }
            </style>
        </head>
        <body>
            <h2 style="text-align: center ; position: absolute ; top:0px;">Form Appointment</h2>
            <form action="formappointment" method="POST">
                <label for="fullname">FullName:</label><input name="fullname" type="text" ><br/>
                <label for="email">Email:</label><input name="email" type="email" > <br/>
                <label for="address">Address:</label><input name="Address"type="text"><br/>
            <%--       <select name="trainer">
                    <c:forEach items="${i.trainerUnavailable}" var="s">
                        <option value="${s.trainerID}">${s.fullName}</option>
                    </c:forEach>
                    </select>--%>


            <!-- Choose Trainer-->
            <div style="display: inline-block; border: 1px solid #ccc;
                 border-radius: 4px;
                 box-sizing: border-box;
                 width: 100%;
                 padding: 8px;
                 margin-bottom: 10px;">
                <input type="radio" name="trainer" value="not-choose" id="not-choose">
                <label for="not-choose">Not choose Trainer</label>

                <input type="radio" name="trainer" value="choose" id="choose">
                <label for="choose">Choose Trainer</label>

                <div id="trainer-list" style="display: none; margin-top: 10px;">
                    <c:forEach items="${i.trainerUnavailable}" var="s">
                        <div class="trainer-item">
                            <img  src="data:images/jpg;base64,${s.img}" alt="Trainer  Avatar" class="trainer-avatar">
                            <input type="radio" name="selected-trainer" value="${s.trainerID}" id="trainer">
                            <label for="trainer">
                                <span class="trainer-name">${s.fullName}</span>
                                <br>
                                <span class="trainer-skill">Skill: Skill 1</span>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <label for="start">Start date:</label><input type="date"  name="datestart"
                                                         value="2023-01-1"
                                                         min="2023-01-01" max="2023-12-31">   <br/>
            <label for="note">Note:</label><textarea name="note" rows="4" cols="50"></textarea><br/>
            <select name="type">
                <option value="offline">Offline</option>
                <option value="online">Online</option>
            </select><br/>

            <button type="reset">Reset</button>
            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i>
                <input type="submit" name="action" value="Submit Form">
            </button>

        </form>
        <script>
            var chooseRadio = document.getElementById('choose');
            var notChooseRadio = document.getElementById('not-choose');
            var trainerList = document.getElementById('trainer-list');
            var trainerRadios = document.querySelectorAll('[name="selected-trainer"]');

            chooseRadio.addEventListener('change', function () {
                if (this.checked) {
                    trainerList.style.display = 'block';
                } else {
                    trainerList.style.display = 'none';
                }
            });

            notChooseRadio.addEventListener('change', function () {
                if (this.checked) {
                    trainerList.style.display = 'none';
                    trainerRadios.forEach(function (radio) {
                        radio.checked = false;
                    });
                }
            });

            trainerRadios.forEach(function (radio) {
                radio.addEventListener('change', function () {
                    if (notChooseRadio.checked) {
                        notChooseRadio.checked = false;
                    }
                    trainerList.style.display = 'none';
                });
            });
        </script>

    </body>
</html>
