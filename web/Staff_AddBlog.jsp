<%--
    Document   : AddBlog
    Created on : Jul 4, 2023, 1:28:09 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a New Blog</title>
    </style>
    <!-- boostrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
        crossorigin="anonymous"
        />
    <!-- w3Table -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <!--css-->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/Staff_Blogs_Update.css" />
</head>
<body>
    <div class="container-fluid">
        <div class="row flex-nowrap">
            <%@include file="header.jsp" %>
            <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                <section class="form-head">
                    <div class="heading d-flex align-items-center">
                        <svg
                                width="40"
                                height="40"
                                viewBox="0 0 20 22"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path
                                d="M18.8235 0H1.17647C0.529412 0 0 0.45 0 1V21C0 21.55 0.529412 22 1.17647 22H18.8235C19.4706 22 20 21.55 20 21V1C20 0.45 19.4706 0 18.8235 0ZM17.6471 20H2.35294V2H17.6471V20ZM4.85294 15.75C4.85294 15.2 5.38235 14.75 6.02941 14.75H13.9706C14.6176 14.75 15.1471 15.2 15.1471 15.75C15.1471 16.3 14.6176 16.75 13.9706 16.75H6.02941C5.38235 16.75 4.85294 16.3 4.85294 15.75ZM5.02941 11C5.02941 10.45 5.55882 10 6.20588 10H13.9412C14.5882 10 15.1176 10.45 15.1176 11C15.1176 11.55 14.5882 12 13.9412 12H6.20588C5.55882 12 5.02941 11.55 5.02941 11ZM5.02941 6.25C5.02941 5.7 5.55882 5.25 6.20588 5.25H13.9412C14.5882 5.25 15.1176 5.7 15.1176 6.25C15.1176 6.8 14.5882 7.25 13.9412 7.25H6.20588C5.55882 7.25 5.02941 6.8 5.02941 6.25Z"
                                fill="black"
                                />
                            </svg>  
                        <span style="padding-left: 2rem">Blogs</span>
                    </div>
                    <div class="navbar navbar-expand-lg navbar-light" style="height: 60px">
                        <a href="Staff_list_ofblog.jsp">
                            <div style="
                                 position: absolute;
                                 top: 35%;
                                 left: 5rem;
                                 font-size: 1.5rem;
                                 color: #617a55;
                                 ">
                                &lt; Back
                            </div>
                        </a>
                    </div>
                </section>
                <div class="container-fluid" style="padding: 0 2.5%">
                    <div class="forms-container">
                        <div class="forms-header">
                            <div class="left-side"><b>Add new Blog</b></div>
                        </div>
                        <form class="addForm" action="AddBlogServlet" method="POST" enctype="multipart/form-data">
                            <div class="form-formDetails">
                                <div class="form-name">
                                    <div class="name">Blog Detail</div>
                                </div>
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-lg-7">
                                            <div class="mb-5">
                                                <label for="title" class="form-label">Title:</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="title"
                                                    name="title"
                                                    placeholder="Enter title"
                                                    required
                                                    />
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="mb-5">
                                                <label for="date" class="form-label">Date:</label>
                                                <input type="date"
                                                       id="date"
                                                       name="date"
                                                       class="form-control"
                                                       placeholder="Enter date"
                                                       required
                                                       />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-7">
                                            <div class="mb-5">
                                                <label for="author" class="form-label">Author:</label>
                                                <input type="text"
                                                       id="author"
                                                       name="author"
                                                       class="form-control"
                                                       placeholder="Enter author"
                                                       required
                                                       />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-5">
                                            <label for="briefinfo" class="form-label">Brief Info:</label>
                                            <textarea id="briefinfo"
                                                      name="briefinfo"
                                                      class="form-control long-input"
                                                      placeholder="Enter brief info"
                                                      oninput="adjustTextareaHeight(this)"
                                                      onblur="trimTrailingSpaces(this)"
                                                      required
                                                      ></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-5">
                                            <label for="introduction" class="form-label">Introduction:</label>
                                            <textarea id="introduction"
                                                      name="introduction"
                                                      class="form-control long-input"
                                                      placeholder="Enter introduction"
                                                      oninput="adjustTextareaHeight(this)"
                                                      onblur="trimTrailingSpaces(this)"
                                                      required></textarea>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-lg-5 mb-5">
                                            <label for="thumbnail" class="form-label">Thumbnail:</label>
                                            <input type="file"
                                                   id="thumbnail"
                                                   name="thumbnail"
                                                   class="form-control imgInput"
                                                   accept="image/*"
                                                   onchange="updateThumbnail(this)"
                                                   required/>
                                        </div>
                                        <div class="img-container d-flex justify-content-center">
                                            <img class="showImg" src="" alt="">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-5">
                                            <label for="content1" class="form-label">Content 1:</label>
                                            <textarea id="content1"
                                                      name="content1"
                                                      class="form-control long-input"
                                                      placeholder="Enter content 1"
                                                      oninput="adjustTextareaHeight(this)"
                                                      onblur="trimTrailingSpaces(this)"
                                                      required></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-5">
                                            <label for="content2" class="form-label">Content 2:</label>
                                            <textarea id="content2"
                                                      name="content2"
                                                      class="form-control long-input"
                                                      placeholder="Enter content 2"
                                                      oninput="adjustTextareaHeight(this)"
                                                      onblur="trimTrailingSpaces(this)"
                                                      required></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="mb-5">
                                            <label for="inconclusion" class="form-label">Conclusion:</label>
                                            <textarea id="inconclusion"
                                                      name="inconclusion"
                                                      class="form-control long-input"
                                                      placeholder="Conclusion"
                                                      oninput="adjustTextareaHeight(this)"
                                                      onblur="trimTrailingSpaces(this)"
                                                      required></textarea>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-lg-5 mb-5">
                                            <label for="contentIMG" class="form-label">Content Image:</label>
                                            <input type="file"
                                                   id="contentIMG"
                                                   name="contentIMG"
                                                   class="form-control imgInput"
                                                   accept="image/*"
                                                   onchange="updateThumbnail(this)"
                                                   required>
                                        </div>
                                        <div class="img-container d-flex justify-content-center">
                                            <img class="showImg" src="" height="50px" width="50px" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="forms-footer">
                                <div>
                                    <button type="submit" name="action" value="add_blog" class="btn update">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        window.addEventListener('DOMContentLoaded', function () {
            var headerWidth = document.getElementById('headerPage').offsetWidth;
            var container = document.getElementById('containerPage');
            container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
        });
    </script>
    <!--show toast on forms-->
    <script>
        // Get all form elements using querySelectorAll
        var forms = document.querySelectorAll(".addForm");
        // Attach an event listener to each form's submit event
        forms.forEach(function (form) {
            form.addEventListener("submit", function (event) {
                // Prevent the default form submission behavior
                event.preventDefault();
                // Show success toast
                Toastify({
                    text: "Submit success",
                    position: "center",
                    close: true,
                    gravity: "top",
                    duration: 3000,
                    style: {
                        fontSize: "2rem",
                        background: "linear-gradient(to right, #00b09b, #96c93d)"
                    },
                    onClick: function () {
                        form.submit();
                    }
                }).showToast();
                setTimeout(function () {
                    form.submit();
                }, 1000);
            });
        });
    </script>
    <!--update image-->
    <script>
        function updateThumbnail(input) {
            var reader = new FileReader();

            reader.onload = function (e) {
                var showImg = input.parentNode.parentNode.querySelector('.img-container').querySelector('.showImg');
                showImg.src = e.target.result;
            };

            if (input.files && input.files[0]) {
                reader.readAsDataURL(input.files[0]);
            }
        }

        var imgInputs = document.getElementsByClassName("imgInput");
        for (var i = 0; i < imgInputs.length; i++) {
            var imgInput = imgInputs[i];
            imgInput.onchange = function () {
                updateThumbnail(this);
            };
        }
    </script>
    <!--adjust textrea height-->
    <script>
        function adjustTextareaHeight(textarea) {
            textarea.style.height = "auto";
            textarea.style.height = textarea.scrollHeight + "px";
        }

        var textareas = document.getElementsByClassName("long-input");
        for (var i = 0; i < textareas.length; i++) {
            adjustTextareaHeight(textareas[i]);
        }
    </script>
    <!--remove trailing space-->
    <script>
        function trimTrailingSpaces(textarea) {
            textarea.value = textarea.value.trim();
            adjustTextareaHeight(textarea);
        }
    </script>
    <!--toast-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <!--bs5-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"
    ></script>
</body>
</html>
