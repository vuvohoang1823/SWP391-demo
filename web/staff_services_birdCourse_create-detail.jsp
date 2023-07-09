
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous"
            />
        <!-- css -->
        <link rel="stylesheet" href="css/reset.css" />
        <link rel="stylesheet" href="css/staff_services_birdCourse_create-detail.css" />

    </head>
    <body>

        <div class="container-fluid">
            <div class="row flex-nowrap">
                <!--            header-->
                <%@ include file="header.jsp" %>

                <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                    <section class="form-head">
                        <div class="heading d-flex align-items-center">
                            <svg width="40" height="40" viewBox="0 0 19 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6 10H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M1 5.22222C1 3.23185 1 2.23666 1.6224 1.61833C2.24479 1 3.24653 1 5.25 1H13.75C15.7534 1 16.7552 1 17.3776 1.61833C18 2.23666 18 3.23185 18 5.22222V13.6667C18 16.6522 18 18.145 17.0664 19.0725C16.1328 20 14.6302 20 11.625 20H7.375C4.36979 20 2.8672 20 1.9336 19.0725C1 18.145 1 16.6522 1 13.6667V5.22222Z" stroke="#33363F" stroke-width="2"/>
                                        <path d="M13 17V20M6 17V20" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        <path d="M6 6H13" stroke="#33363F" stroke-width="2" stroke-linecap="round"/>
                                        </svg>
                            <span style="padding-left: 2rem">Services</span>
                        </div>
                        <div class="navbar navbar-expand-lg navbar-light">
                            <a href="<%= previousPage%>">
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
                            <div class="container-fluid">
                                <div class="" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link " href="Staff_ConsultationForm_Pending.jsp">Bird Course</a>
                                        </li>
                                        <li class="nav-item ">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Private Consultant</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Staff_ConsultationForm_Pending.jsp">Contact Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="container-fluid" style="padding: 0 2.5%">
                        <div class="forms-container">
                            <div class="forms-header">
                                <div class="left-side"><b>Form Detail</b></div>
                            </div>
                            <form action="" method="">
                                <input type="hidden" name="" value="">
                                <div class="form-customerDetails">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Course name</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Input name"
                                                        value=""
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Course price</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="price"
                                                        placeholder="Enter Price"
                                                        onChange="formatCurrency(this)"
                                                        />
                                                    <!--chỉ submit cái hiddenPrice xuống DB-->
                                                    <input
                                                        id="hiddenPrice"
                                                        type="hidden"
                                                        />
                                                    <!--------------------------------------->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Duration</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id=""
                                                        placeholder="Input duration"
                                                        value=""
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label for="categoryname" class="form-label">Category</label>
                                                    <div class="input-group">
                                                        <input
                                                            id="category"
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Choose category"
                                                            disabled
                                                            />
                                                        <input
                                                            id="hiddenCategoryName"
                                                            type="hidden" value=""
                                                            />
                                                        <button
                                                            class="btn btn-primary"
                                                            type="button"
                                                            id="button-addon2"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#chooseCategory"
                                                            >
                                                            Select category
                                                        </button>
                                                        <div
                                                            class="modal fade"
                                                            id="chooseCategory"
                                                            tabindex="-1"
                                                            data-bs-backdrop="static"
                                                            data-bs-keyboard="false"
                                                            >
                                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h1 class="modal-title fs-5">Category</h1>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="category-list">
                                                                            <div class="category-item">
                                                                                <input class="category-input" type="radio" name="selected-category" value="" id="cate_1">
                                                                                <label for="cate_1">
                                                                                    <span class="category-name">Bird Course</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="category-item">
                                                                                <input class="category-input" type="radio" name="selected-category" value="" id="cate_2">
                                                                                <label for="cate_2">
                                                                                    <span class="category-name">Private Consultation</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="category-item">
                                                                                <input class="category-input" type="radio" name="selected-category" value="" id="cate_3">
                                                                                <label for="cate_3">
                                                                                    <span class="category-name">Workshop</span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="category-item">
                                                                                <input class="category-input" type="radio" name="selected-category" value="" id="cate_4">
                                                                                <label for="cate_4">
                                                                                    <span class="category-name">Online Course</span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button type="button" class="btn btn-primary" id="" data-bs-dismiss="modal" onclick="saveCategory()">Save changes</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="customernotes" class="form-label"
                                                       >Description about course</label
                                                >
                                                <textarea
                                                    class="form-control"
                                                    id=""
                                                    style="height: 10rem; font-size: 2rem"
                                                    >
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="" class="form-label">
                                                    Image about course
                                                </label>
                                            </div>
                                            <div class="mb-3">
                                                <form action="">
                                                    <img src="" alt="" width="300" height="300" id="image">
                                                    <input type="file" name="" id="imageFile" accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="forms-footer">
                                        <button type="submit" name="action" value="checkout" class="btn approve">Create new bird course</button>
                                    </div>
                                </div>

                        </div>
                    </div>

                </div>

            </div>

        </form>
    </div>
    <script>
        window.addEventListener('DOMContentLoaded', function () {
            var headerWidth = document.getElementById('headerPage').offsetWidth;
            var container = document.getElementById('containerPage');
            container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
        });
    </script>
    <script>
        function formatCurrency(input) {
            const hiddenPrice = document.getElementById("hiddenPrice");
            hiddenPrice.value = input.value;
            // Get the numeric value
            var value = input.value;

            // Format as currency
            var formattedValue = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'USD',
                minimumFractionDigits: 2
            }).format(value);

            // Update the input value with the formatted currency
            input.value = formattedValue;
        }
        function chooseFile(fileInput) {
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#image').attr('src', e.target.result);
                }
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
        function saveCategory() {
            var selectedCategory = document.querySelector('input[name="selected-category"]:checked');
            var categoryInput = document.getElementById('category');

            if (selectedCategory) {
                var categoryValue = selectedCategory.nextElementSibling.querySelector('.category-name').innerText;
                categoryInput.value = categoryValue;
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</body>
</html>