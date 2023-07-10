<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/reset.css" type="text/css">
        <link rel="stylesheet" href="css/birdcourse_Successfull.css" type="text/css">
    </head>
    <body>
        <a href="homepage.jsp">
            <div style="
                 position: absolute;
                 bottom: 2rem;
                 right: 2rem;
                 font-size: 2rem;
                 color: #617A55;
                 font-weight: bolder;
                 ">
                &lt; Return To Homepage
            </div>
        </a>
        <div class="col-lg-6">
            <div class="image">
                <img src="img/Untitled (1).png"/>
            </div>
        </div>
        <div class="col-lg-6 form-container">
            <div class="form">
                <div class="title">
                    <h1>
                        Form Submitted Succesfully
                    </h1>
                </div>
                <div class="content-container">
                    <h5>
                        <p>
                            Name:
                        </p>
                        &ensp;
                        <b>
                            ${CourseInfo.customerName}
                        </b
                    </h5>
                    <h5>
                        <p>
                            Bird Name: 
                        </p>
                        &ensp;
                        <b>
                            ${CourseInfo.nameBird}
                        </b>
                    </h5>
                    <h5>
                        <p>
                            Bird Type: 
                        </p>
                        &ensp;
                        <b>
                            ${CourseInfo.typeBird}
                        </b>
                    </h5>
                    <h5>
                        <p>
                            Course Name: 
                        </p>
                        &ensp;
                        <b>
                            ${CourseInfo.courseName}
                        </b>
                    </h5>
                    <h5>
                        <p>
                            Preferred date: 
                        </p>
                        &ensp;
                        <b>
                            ${requestScope.date}
                        </b>
                    </h5>
                    <h5>
                        <p>
                            Price: 
                        </p>
                        &ensp;
                        <b>
                            ${CourseInfo.coursePrice}
                        </b>
                    </h5>
                </div>
            </div>
        </div>
    </body>
</html>


