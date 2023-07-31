<%-- 
    Document   : BirdProfileCustomer
    Created on : Jul 31, 2023, 2:41:45 AM
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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="b" class="DAO.CustomerBirdDAO" scope="request"></jsp:useBean>
            <title>JSP Page</title>
        </head>
        <body>
            <h1>   Hello ${sessionScope.LOGIN_USER.fullName} </h1>
        
        
        
        
        
        
        
        <!-- Link to add a new bird-->
        <a href="BirdProfileCustomer_ADDBIRD.jsp"><button style="border:2px solid blue ; width:150px ; height:40px ;cursor: pointer">Add a new Bird</button></a> <br/>
        <!-- Link to add a new bird-->
        
        <!-- Link to add a new type  === ROLE Staff  ---->
        <!--Note * : temporialty-->
        <a href="BirdProfileCustomer_ADDTYPE_OF_BIRD.jsp"><button style="border:2px solid blue ; width:150px ; height:40px ;cursor: pointer">Add a new Type of Bird</button></a> <br/>
        <!-- Link to add a new type  === ROLE Staff  --->
        
        
        
        
        
        
        
        
        
        
        
        
        
        Your Bird Profile: 
        <c:set var="customerId" value="<%=customerID%>" />
        <c:forEach items="${b.getLisofBirdByCustomerDTO(customerId)}" var="info" >
            Bird ID : ${info.bird_id} <br/>
            Bird Name : ${info.name}  <br/>
            Customer_ID : ${info.customer_id}  <br/>
            Bird_Image : <img style="width:250px"  src="data:images/jpg;base64,${info.bird_img}"/>  <br/>
            Birth Date : ${info.birdDate} <br/>
            Type_ID : ${info.type_id}  <br/>
            Type_Name  : ${info.type_name}  <br/>
            <a href="BirdUpdatePageServlet?customerID=${info.customer_id}&id=${info.bird_id}"><button>Update</button></a><br/>
             <a href="BirdDeleteByCustomerIDServlet?id=${info.bird_id}"><button>Delete</button></a>
            <br/>
            <br/>
        </c:forEach>


    </body>
</html>
