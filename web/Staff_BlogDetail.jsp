<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="../reset.css" />
        <link rel="stylesheet" href="css/blogDetail.css">
    </head>
    <body>
        <jsp:useBean id="blog" class="DAO.BlogDAO" scope="request"></jsp:useBean>

            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <c:if test="${not empty sessionScope.BLOG_DETAIL}">
                        <c:set var="detail" value="${sessionScope.BLOG_DETAIL}"/>
                        <div class="body-container">
                            <section class="section-head">
                                <a href="<%= previousPage%>">
                                    <div style="
                                         z-index: 1;
                                         position: absolute;
                                         top: 5rem;
                                         left: 5rem;
                                         font-size: 2.5rem;
                                         color: white;
                                         ">
                                        &lt; Back
                                    </div>
                                </a>
                                <img src="data:images/jpg;base64,${detail.thumbnail}" draggable="false"/>
                                <div class="desc-container">
                                    <div class="date-time">
                                        <span>${detail.date}</span>
                                        <span>${detail.author}</span>
                                        <span>10 minutes reading</span>
                                    </div>
                                    <h1 class="blog-title">
                                        ${detail.title}
                                    </h1>
                                </div>
                            </section>
                            <section class="section-body">
                                <div class="upvote">
                                    <a href="#" class="triangle-up"></a>
                                    <span class="vote-count">+15</span>
                                    <a href="#" class="triangle-down"></a>
                                </div>
                                <div class="content">
                                    <div>
                                        <!-- hard code -->
                                        <h5>Introduction:</h5>
                                        <!--------------->
                                        ${detail.introduction}
                                    </div>
                                    <div>
                                        <!-- hard code -->
                                        <br />
                                        <b>1. Understanding of the post:</b>
                                        <!--------------->
                                        ${detail.content1}
                                        <!-- hard code -->
                                        <div class="img-container">
                                            <img src="data:images/jpg;base64,${detail.contentIMG}" draggable="false"/>
                                        </div>
                                        <!--------------->
                                    </div>
                                    <div>
                                        <!-- hard code -->
                                        <b>2. Building Trust and Partnership:</b>
                                        <!--------------->
                                        ${detail.content2}
                                    </div>
                                    <div>
                                        <!-- hard code -->
                                        <br />
                                        <h5>Conclusion</h5>
                                        <!--------------->
                                        ${detail.inconclusion}
                                    </div>
                                </div>
                            </section>
                        </div>
                    </c:if>
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
        <!--        trim title-->
        <script>
            // Get all question message elements
            var blogTitle = document.getElementsByClassName("blog-title");

            // Loop through each question message element
            for (var i = 0; i < blogTitle.length; i++) {
                var title = blogTitle[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                title = title.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                title = title.replace(/[^ -~]+/g, "");
            }
        </script>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
    </body>
</body>
</html>