<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin-top: 250px;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        /* Container styles */
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 40px;
            background-color: #e6e6e6;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
           
            
        }
        
        /* Heading styles */
        h1 {
            font-size: 32px;
            color: #333;
            margin-top: 0;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        
        /* Colorful styles */
        .colorful {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        
        .colorful div {
            width: 50px;
            height: 50px;
            margin: 0 10px;
            border-radius: 50%;
            opacity: 0.8;
        }
        
        .colorful .color1 {
            background-color: #ffd700;
        }
        
        .colorful .color2 {
            background-color: #ff1493;
        }
        
        .colorful .color3 {
            background-color: #00ced1;
        }
        
        .colorful .color4 {
            background-color: #800080;
        }
        
        .colorful .color5 {
            background-color: #ff4500;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Successfully</h1>
        <div class="colorful">
            <div class="color1"></div>
            <div class="color2"></div>
            <div class="color3"></div>
            <div class="color4"></div>
            <div class="color5"></div>
        </div>
    </div>
</body>
</html>
