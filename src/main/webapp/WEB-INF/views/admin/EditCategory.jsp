<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Category</title>
    <jsp:include page="AdminCSS.jsp"></jsp:include>
</head>

<body>

<div class="container-scroller">

    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <div class="container-fluid page-body-wrapper">

        <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

        <div class="main-panel">
            <div class="content-wrapper">

                <h3>Edit Category</h3>

                <form action="updateCategory" method="post">

                    <!-- ✅ IMPORTANT -->
                    <input type="hidden" name="categoryId" value="${category.categoryId}"/>

                    <div class="form-group">
                        <label>Category Name</label>
                        <input type="text" name="categoryName"
                               value="${category.categoryName}"
                               class="form-control" required/>
                    </div>

                    <br>

                    <button type="submit" class="btn btn-success">Update Category</button>

                </form>

            </div>

            <jsp:include page="AdminFooter.jsp"></jsp:include>

        </div>
    </div>
</div>

</body>
</html>