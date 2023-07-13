<%-- 
    Document   : Staff_View_Workshop_Detail
    Created on : Jul 6, 2023, 4:32:50 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            .container {
                max-width: 600px;
                margin: 0 auto;
            }

            h1 {
                text-align: center;
                margin-top: 0;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
            }

            input[type="text"],
            input[type="date"],
            textarea {
                width: 100%;
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }

            .file-upload {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }

            .file-input {
                font-size: 16px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
            }

            .upload-label {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 150px;
                height: 150px;
                background-color: #f2f2f2;
                border: 1px dashed #ccc;
                cursor: pointer;
            }

            .preview-image {
                width: 100%;
                max-height: 100%;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            button[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Update workshop's information </h1>
        <c:set var="workshop" value="${sessionScope.staff_workshop_detail}"/>
        <form action="Staff_UpdateWorkshopDetailServlet" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                    <input type="file" id="workshop_image" name="workshop_image" class="form-control" accept="image/*" multiple required>
            </div>

            <div class="form-group">
                <label for="title">Course ID: </label>
                <input type="text" name="courseID" value="${workshop.courseID}" class="form-control" placeholder="Enter title" >   
            </div>
            <div class="form-group">
                <label>Trainer ID: </label>
                <input type="text" name="trainerID" value="${workshop.trainerID}" class="form-control" placeholder="Enter title" >   
            </div>
            <div class="form-group">
                <label>Title: </label>
                <input type="text" name="title" value="${workshop.title}" class="form-control" placeholder="Enter title" >   
            </div>
            <div class="form-group">
                <label>Price: </label>
                <input type="text" name="price" value="${workshop.price}" class="form-control" placeholder="Enter title" >   
            </div>
            <div class="form-group">
                <label>End Enroll Date:</label>
                <input type="date" name="end_enroll_date" value="${workshop.end_enroll_date}" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" name="start_date" value="${workshop.start_date}" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Content:</label>
                <textarea class="form-control" name="content" placeholder="Enter introduction" required>${workshop.content}</textarea>
            </div>
            <div class="form-group">
                <label>Sub content 1:</label>
                <textarea class="form-control" name="sub_content_1" placeholder="Enter introduction" required>${workshop.sub_content_1}</textarea>
            </div>
            <div class="form-group">
                <label>Sub content 2:</label>
                <textarea class="form-control" name="sub_content_2" placeholder="Enter introduction" required>${workshop.sub_content_2}</textarea>
            </div>
            <div class="form-group">
                <label>Sub content 3:</label>
                <textarea class="form-control" name="sub_content_3" placeholder="Enter introduction" required>${workshop.sub_content_3}</textarea>
            </div>
            <div class="form-group">
                <label>Sub content 4:</label>
                <textarea class="form-control" name="sub_content_4" placeholder="Enter introduction" required>${workshop.sub_content_4}</textarea>
            </div>
            
            <input type="hidden" name="staffID" value="${workshop.staffID}" />
            <input type="hidden" name="category" value="${workshop.category}" />
            <button type="submit" name="action" value="update_workshop_detail" class="btn btn-primary">Update Information</button>

        </form>


            <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
