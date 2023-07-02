<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Success</title>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: url('assets/images/bg/bg-lines-one.png');
    }

    .container {
      text-align: center;
    }

    .back-to-home {
      margin-bottom: 20px;
    }

    .success-heading {
      font-size: 28px;
      font-weight: bold;
      color: #333;
      margin-bottom: 20px;
    }

    .success-image {
      width: 400px;
      height: auto;
      margin-bottom: 40px;
    }

    .return-button {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: bold;
      color: #fff;
      background-color: #007bff;
      border: none;
      border-radius: 4px;
      transition: background-color 0.3s ease;
      text-decoration: none;
    }

    .return-button i {
      margin-right: 8px;
    }

    .return-button:hover {
      background-color: #0056b3;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="back-to-home rounded d-none d-sm-block">
      <a href="home" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
    </div>

    <img src="assets/images/gif/payment_success.gif" class="success-image" alt="">
    <h3 class="success-heading">Payment Successful</h3>
    <a href="homepage.jsp" class="return-button"><i class="fa-solid fa-house"></i> Return to Homepage</a>
  </div>

  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/feather.min.js"></script>
  <script src="assets/js/app.js"></script>
</body>

</html>
