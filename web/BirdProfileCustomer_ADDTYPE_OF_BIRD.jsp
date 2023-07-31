<!DOCTYPE html>
<html>
    <head>
        <title>Add a New Bird</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
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

            input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .submit-button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                background-color: #4CAF50;
                color: white;
            }

            .submit-button:hover {
                opacity: 0.8;
            }

        </style>
    </head>
    <body>
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
    </body>
</html>
