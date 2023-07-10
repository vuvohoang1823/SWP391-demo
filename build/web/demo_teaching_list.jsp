<%-- 
    Document   : demo_teaching_list
    Created on : Jun 14, 2023, 4:29:49 PM
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="cc" class="DAO.CourseTeachingDAO"></jsp:useBean>
        <jsp:useBean id="t" class="DAO.TrainerDAO1"></jsp:useBean>
        <title>JSP Page</title>
    </head>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        h2 {
            margin-top: 30px;
            color: #666;
        }

        hr {
            margin: 30px 0;
            border: none;
            border-top: 1px solid #ccc;
        }

        h4 {
            color: #007bff;
            margin-bottom: 10px;
        }

        p {
            margin: 0;
            padding: 5px 0;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 16px;
            color: #fff;
            text-decoration: none;
            background-color: #007bff;
            border-radius: 3px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
    <body>
        <h1>Teaching list </h1>
        
        <c:set var="customerID" value="<%= trainerID %>" />
        <h2>Trainer: ${sessionScope.LOGIN_USER.fullName}</h2>
      
                
        <hr/>
        
        <c:forEach items="${cc.getConsultationListAreTeaching(customerID)}" var="item">
            <h4>Private consultation</h4>
                <p>Customer: ${item.fullname_customer}</p>
                <p>Contact: ${item.contact_customer}</p>
                <p>Note : ${item.note}</p>
                <p>Address : ${item.address}</p>
                <p>Type : ${item.type}</p>
                 
        </c:forEach>
                <a href="form_payment_consultation.jsp">Complete</a>
        
               
        
        
        
    </body>
</html>
