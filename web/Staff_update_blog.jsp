<%-- 
    Document   : Staff_update_blog
    Created on : Jul 4, 2023, 7:46:00 PM
    Author     : hoang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:if test="${not empty sessionScope.blogdetail}">
            <c:set var="detail" value="${sessionScope.blogdetail}"></c:set>
            
            <div class="container">
        <h1>Add a New Blog</h1>
        <form action="UpdateServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" value="${detail.blogid}" name="blogId"/>
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${detail.title}" class="form-control" placeholder="Enter title" required>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date"  value="${detail.date}"class="form-control" required>
            </div>
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" id="author" name="author"  value="${detail.author}" class="form-control" placeholder="Enter author" required>
            </div>
            <div class="form-group">
                <label for="briefinfo">Brief Info:</label>
                <input type="text" id="briefinfo" name="briefinfo"   value="${detail.briefinfo}" class="form-control" placeholder="Enter brief info" required>
            </div>
            <div class="form-group">
                <label for="introduction">Introduction:</label>
                <textarea id="introduction" name="introduction"   class="form-control" placeholder="Enter introduction" required>${detail.introduction}</textarea>
            </div>
             <div class="form-group">
                <label for="thumbnail">Thumbnail:</label>
                <input type="file"  name="thumbnail" class="form-control"  value=""/><img  src="data:images/jpg;base64,${detail.thumbnail}" height="50px" width="50px" alt="">
            </div>
            <div class="form-group">
                <label for="content1">Content 1:</label>
                <textarea id="content1" name="content1"  class="form-control" placeholder="Enter content 1" required>${detail.content1}</textarea>
            </div>
            <div class="form-group">
                <label for="content2">Content 2:</label>
                <textarea id="content2" name="content2"  class="form-control" placeholder="Enter content 2" required>${detail.content2}</textarea>
            </div>
            <div class="form-group">
                <label for="inconclusion">Inconclusion:</label>
                <textarea id="inconclusion" name="inconclusion"  class="form-control" placeholder="Conclusion" required>${detail.inconclusion}</textarea>
            </div>
            <div class="form-group">
                <label for="contentIMG">Content Image:</label>
                <input type="file" id="contentIMG" name="contentIMG"  class="form-control" ><img  src="data:images/jpg;base64,${detail.contentIMG}" height="50px" width="50px" alt="">
            </div>
            <button type="submit" name="action" value="update" class="btn btn-primary">Update</button>                          
        </form>
    </div>
            </c:if>
    </body>
</html>
