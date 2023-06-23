<%-- 
    Document   : formdetail_demo
    Created on : Jun 13, 2023, 12:01:48 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <jsp:useBean id="f" class="DAO.AppointmentDAO" scope="request"></jsp:useBean>

        <title>Form Detail</title>
    </head>
    <body>
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

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .detaill {
            margin-bottom: 20px;
        }

        .detaill p {
            margin: 0;
            padding: 5px 0;
        }

        .detaill a {
            display: inline-block;
            margin-right: 10px;
            padding: 8px 16px;
            color: #fff;
            text-decoration: none;
            background-color: #007bff;
            border-radius: 3px;
        }

        .detaill a:hover {
            background-color: #0056b3;
        }
    </style>
        
        
        
        
        
        <div class="container">
        <c:if test="${not empty sessionScope.appointment_detail}">
            <c:set var="detail" value="${sessionScope.appointment_detail}"/>
            <div class="detaill">
                <p>ID: ${detail.consultation_id}</p>
                <p>Note: ${detail.note}</p>
                <p>Address: ${detail.address}</p>
                <p>Type ${detail.type}</p>
                <p>Trainer: ${detail.trainer_fullname}</p>
                <p>Customer: ${detail.customer_fullname}</p>
                <a href="MainController?action=browse_form&consultation_id=${detail.consultation_id}&status=deny">Deny</a>

                <a href="MainController?action=browse_form&consultation_id=${detail.consultation_id}&status=approve">Approve</a>
                
            </div>
        </c:if>
                
        </div>


    </body>
</html>
