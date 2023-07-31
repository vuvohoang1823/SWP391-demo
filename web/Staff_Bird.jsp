<!DOCTYPE html>
<html>
    <head>
        <title>Add a New Bird</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" type="text/css" href="css/reset.css">
        <link rel="stylesheet" href="css/blogDetail.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>
                <div class="body-container">
                    <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                        <h1>Add a New Type of  Bird</h1>
                        <form id="birdForm" method="Post" action="Bird_AddANewTypeOfBirdServlet">
                            <div class="form-group">
                                <label for="birdType">Type of Bird:</label>
                                <input type="text" id="birdType" name="birdType" required>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="submit-button">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
