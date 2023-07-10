<%-- 
    Document   : form_payment_consultation
    Created on : Jun 14, 2023, 9:58:25 PM
    Author     : LAPTOP
--%>
<%@page import="entity.Trainer"%>
<%@page import="DAO.AppointmentDAO"%>
<%@page import="entity.TrainerDTO"%>
<%@page import="DAO.TrainerDAO1"%>
<%@page import="entity.UserDTO"%>

<%
    // Retrieve the UserDTO object from the session
    Trainer user = (Trainer) session.getAttribute("LOGIN_USER");

    // Create an instance of the CustomerDAO
    TrainerDAO1 trainerDAO = new TrainerDAO1();

    // Get the customer ID using the user ID
    int trainerID = trainerDAO.getTrainerID(user.getUserID());
%>
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
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        select {
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        h2 {
            margin-top: 20px;
        }

        h5 {
            margin-top: 30px;
        }

        a.button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <h1>Payment checklist</h1>
    <form method="post" action="form_payment_consultation.jsp">
        <select name="mode">
            <option value="online">Online</option>
            <option value="offline">Offline</option>
        </select><br>
        <input type="text" name="number" placeholder="Number"><br>
        <input type="submit" value="Calculate">
    </form>

    <%-- Retrieve form data --%>
    <% String mode = request.getParameter("mode");
       String numberStr = request.getParameter("number");

       double result = 0.0;

       try {
           if (mode != null) {
               // Convert the input string to a number
               double number = Double.parseDouble(numberStr);

               // Perform the calculation based on the mode
               if (mode.equals("online")) {
                   result = number * 100;
               } else if (mode.equals("offline")) {
                   result = number * 150;
               }
           }
       } catch (NumberFormatException e) {
           // Handle any conversion errors or invalid input
           out.println("Invalid input. Please enter a valid number.");
           return;
       }
    %>

    <%-- Display the result --%>
    <% if (mode != null) { %>
        <h2>Result: <%= result %></h2>
    <% } %>
    
    <h5>${sessionScope.LOGIN_USER.fullName}</h5>
    <h5><%= trainerID %></h5>
    <a href="MainController?action=payment_consultation&amount=<%= result %>&trainer_id=<%= trainerID %>">Payment</a>
</body>
</html>
