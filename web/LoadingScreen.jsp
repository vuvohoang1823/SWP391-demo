<%--
    Document   : LoadingScreen
    Created on : Jul 27, 2023, 11:57:13 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .loading {
                overflow-y: hidden;
                user-select: none;
            }
            #loading-screen {
                z-index: 999;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <div id="loading-screen">
            <div class="spinner-border text-light" style="width: 3rem; height: 3rem;" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>

        <!-- Function to handle smooth scrolling to an element -->
        <script>
            function scrollToElement(elementId) {
                const element = document.getElementById(elementId);
                if (element) {
                    const offsetTop = element.getBoundingClientRect().top;
                    const headerOffset = 0; // Adjust this value to account for any fixed header/navbar
                    window.scrollBy({
                        top: offsetTop - headerOffset,
                        behavior: 'smooth'
                    });
                }
            }
        </script>

        <script>
            // Prevent scrolling and text highlighting
            document.body.classList.add('loading');

            // Hide the loading screen and re-enable scrolling and text highlighting when all content is loaded
            window.onload = function () {
                document.getElementById('loading-screen').style.display = 'none';
                document.body.classList.remove('loading');

                // Check if the URL contains a hash (e.g., home.jsp#id)
                if (window.location.hash) {
                    // Get the target element ID (remove the # character)
                    const targetElementId = window.location.hash.substring(1);
                    scrollToElement(targetElementId);
                }
            };
        </script>
    </body>
</html>
