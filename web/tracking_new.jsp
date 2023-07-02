<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- bootstrap@5.3.0 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous"
    />
    <!-- bootstrap@4.6.0 -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
    <!-- bootstrap@4.5.2 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../reset.css" />
    <link rel="stylesheet" type="text/css" href="./css/tracking_page_new.css" />
  </head>
  <body>
    <div class="header-container">
      <div style="padding-left: 2%; width: 25%">
        <a href="/" class="nav-logo">
          <div class="logo-container">
            <div class="logo-image">
              <img
                src="
                img/349252733_767865025124137_1990273265293346631_n.png"
                alt="page logo"
              />
            </div>
            <div class="logo-text">
              <p>BIRD</p>
              <p>TRADING</p>
              <p>CENTER</p>
            </div>
          </div>
        </a>
      </div>
      <div class="nav-container">
        <ul class="nav">
          <li>
            <a href="/home" class="nav-link">Home</a>
          </li>
          <li>
            <a href="/about-us" class="nav-link">About Us</a>
          </li>
          <li>
            <a href="service" class="nav-link" onclick="navigate('/')"
              >Services
              <span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="10"
                  height="10"
                  fill="currentColor"
                  class="bi bi-caret-down-fill"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                  />
                </svg>
              </span>
            </a>
            <ul class="subnav">
              <li>
                <a href="/workshop" class="nav-link">Workshop</a>
              </li>
              <li>
                <a href="/private-consultant" class="nav-link"
                  >Private Consultant</a
                >
              </li>
              <li>
                <a href="/course-online" class="nav-link">Course Online</a>
              </li>
              <li>
                <a href="/bird-course" class="nav-link">Bird Course</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="/blog" class="nav-link">Blog</a>
          </li>
<!--          <li>
            <a href="/contact" class="nav-link">Contact</a>
          </li>-->
        </ul>
      </div>
      <div class="button-container">
        <button class="signup-button" onclick="toggleSignUpForm()">
          Sign Up
        </button>
        <button class="signin-button" onclick="toggleSignInForm()">
          <p>Log In</p>
        </button>
      </div>
    </div>
    <!-- end of header -->
    <section class="title-section">
      <div class="container">
        <h1 class="title">BIRD COURSE TRACKING PAGE</h1>
      </div>
    </section>

    <section class="product-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="product-card">
              <div class="product-image">
                <img
                  src="img/studyOnlineScream.png"
                  alt="Product Image"
                />
              </div>
              <div class="product-description">
                <div class="desc-container">
                  <p>Size: 25cm</p>
                  <p>Weight: 200g</p>
                  <p>Age: 2 years</p>
                  <p>Color: red - all ranges</p>
                </div>
                <div class="progress-container">
                  <div style="display: flex">
                    <div style="margin-right: 5%">Skill</div>
                    <div class="progress">
                      <div
                        class="progress-bar"
                        role="progressbar"
                        aria-valuenow="70"
                        aria-valuemin="0"
                        aria-valuemax="100"
                        style="width: 50%"
                      ></div>
                    </div>
                  </div>
                  <div style="display: flex">
                    <div style="margin-right: 5%">Health</div>
                    <div class="progress">
                      <div
                        class="progress-bar"
                        role="progressbar"
                        aria-valuenow="70"
                        aria-valuemin="0"
                        aria-valuemax="100"
                        style="width: 70%"
                      ></div>
                    </div>
                  </div>
                  <div style="display: flex">
                    <div style="margin-right: 5%">Course</div>
                    <div class="progress">
                      <div
                        class="progress-bar"
                        role="progressbar"
                        aria-valuenow="70"
                        aria-valuemin="0"
                        aria-valuemax="100"
                        style="width: 30%"
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div
            class="col-md-6"
            style="display: flex; justify-content: center; align-items: center"
          >
            <div class="user-image">
              <img
                src="img/Ellipse 4.png"
                alt="User Image"
                class="rounded-circle"
              />
              <p class="role">Trainer</p>
              <p class="user-name">Peter Johnson</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="card-details-section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="sidebar">
              <div class="img-container">
                <div><img src="img/studyOnlineParrot.png" alt="" /></div>
                <h1>Fly Training Course</h1>
              </div>
              <div class="content">
                <div class="dropdown">
                  <button
                    class="btn dropdown-toggle"
                    type="button"
                    id="module-btn"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    Module
                  </button>
                  <div class="dropdown-menu" aria-labelledby="module-btn">
                    <a class="dropdown-item" href="#">1</a>
                    <a class="dropdown-item" href="#">2</a>
                    <a class="dropdown-item" href="#">3</a>
                    <a class="dropdown-item" href="#">4</a>
                    <a class="dropdown-item" href="#">5</a>
                  </div>
                </div>
                <div>
                  <button class="btn" id="message-btn">Message</button>
                </div>
                <div>
                  <button class="btn" id="note-btn">Note</button>
                </div>
                <div>
                  <button class="btn" id="rating-btn">Rating</button>
                </div>
                <div>
                  <button class="btn" id="course-info-btn">Course Info</button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-9">
            <div class="description" id="module-description">
              <div id="1-description">
                <h2>
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="10"
                      height="10"
                      fill="currentColor"
                      class="bi bi-caret-down-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                  Module 1: Getting used to the training model for the first
                  time
                </h2>
                <p>Process training</p>
              </div>
              <div id="1-description">
                <h2>
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="10"
                      height="10"
                      fill="currentColor"
                      class="bi bi-caret-down-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                  Module 2: Practice flying techniques
                </h2>
                <p>Process Training</p>
              </div>
              <div id="1-description">
                <h2>
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="10"
                      height="10"
                      fill="currentColor"
                      class="bi bi-caret-down-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                  Module 3: Outdoor Access
                </h2>
                <p>Process training</p>
              </div>
              <div id="1-description">
                <h2>
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="10"
                      height="10"
                      fill="currentColor"
                      class="bi bi-caret-down-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                  Module 4: Strengthen the connection
                </h2>
                <p>Process training</p>
              </div>
              <div id="1-description">
                <h2>
                  <span>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="10"
                      height="10"
                      fill="currentColor"
                      class="bi bi-caret-down-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                  Module 5: Check for safe behavior before you let go
                </h2>
                <p>Process training</p>
              </div>
            </div>
            <div class="description" id="message-description">
              <h2>Message Description</h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
                sit amet erat sed neque auctor venenatis. Curabitur pulvinar
                fringilla lacus id condimentum.
              </p>
            </div>
            <div class="description" id="note-description">
              <h2>Note Description</h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
                sit amet erat sed neque auctor venenatis. Curabitur pulvinar
                fringilla lacus id condimentum.
              </p>
            </div>
            <div class="description" id="rating-description">
              <h2>Rating Description</h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
                sit amet erat sed neque auctor venenatis. Curabitur pulvinar
                fringilla lacus id condimentum.
              </p>
            </div>
            <div class="description" id="course-info-description">
              <h2>Course Info Description</h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam
                sit amet erat sed neque auctor venenatis. Curabitur pulvinar
                fringilla lacus id condimentum.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of body -->
    <div class="footer bg-black">
      <div class="container">
        <div class="text-center">
          <p class="text-white">© 2023 by Bird Training Center</p>
        </div>
        <div class="row justify-content-center">
          <div class="col-4 col-md-auto text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-facebook"
              viewBox="0 0 16 16"
            >
              <path
                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"
              />
            </svg>
          </div>
          <div class="col-4 col-md-auto text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-instagram"
              viewBox="0 0 16 16"
            >
              <path
                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
              />
            </svg>
          </div>
          <div class="col-4 col-md-auto text-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-youtube"
              viewBox="0 0 16 16"
            >
              <path
                d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"
              />
            </svg>
          </div>
        </div>
      </div>
    </div>
    <!-- end of footer -->
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
    <script>
      $(document).ready(function () {
        $("#module-description").show();

        $(".dropdown-toggle").dropdown();

        $(".dropdown-menu a").click(function () {
          var selectedModule = $(this).text();
          //   $("#module-btn").text(selectedModule);
          console.log(selectedModule);
          $(".description").hide();
          $("#module-description").show();
        });

        $("#message-btn").click(function () {
          $(".description").hide();
          $("#message-description").show();
        });

        $("#note-btn").click(function () {
          $(".description").hide();
          $("#note-description").show();
        });

        $("#rating-btn").click(function () {
          $(".description").hide();
          $("#rating-description").show();
        });

        $("#course-info-btn").click(function () {
          $(".description").hide();
          $("#course-info-description").show();
        });
      });
    </script>
  </body>
</html>

