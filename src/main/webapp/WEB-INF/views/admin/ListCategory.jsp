<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Category Management</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
:root {
	--navy: #1B2A4A;
	--oxford: #0E1F3D;
	--eton: #2E6B72;
	--sage: #4A7C6F;
	--ivory: #F7F4EE;
	--cream: #EDE9E0;
	--slate: #4B5B6E;
	--muted: #8C97A4;
	--gold: #C9A84C;
	--rose: #A85858;
	--white: #FFFFFF;
	--shadow-sm: 0 2px 12px rgba(27, 42, 74, 0.08);
	--shadow-md: 0 8px 32px rgba(27, 42, 74, 0.12);
	--radius: 14px;
	--radius-sm: 8px;
}

body {
	font-family: 'DM Sans', sans-serif;
	background: var(--ivory);
	color: var(--navy);
}

.content-wrapper {
	padding: 2rem 2rem 1rem !important;
}

.welcome-badge {
	display: inline-block;
	background: var(--oxford);
	color: var(--gold);
	font-family: 'Playfair Display', serif;
	font-size: 0.7rem;
	letter-spacing: 2px;
	text-transform: uppercase;
	padding: 4px 12px;
	border-radius: 50px;
	margin-bottom: 0.5rem;
}

.page-title {
	font-family: 'Playfair Display', serif;
	font-size: 2rem;
	font-weight: 700;
	color: var(--oxford);
	margin-bottom: 0.25rem;
}

.page-subtitle {
	color: var(--muted);
	font-size: 0.9rem;
	margin-bottom: 2rem;
}

.section-label {
	font-size: 0.7rem;
	font-weight: 700;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: var(--muted);
	margin: 1.8rem 0 1rem;
	display: flex;
	align-items: center;
	gap: 10px;
}

.section-label::after {
	content: '';
	flex: 1;
	height: 1px;
	background: var(--cream);
}

/* TOOLBAR */
.toolbar-card {
	background: var(--white);
	border-radius: var(--radius);
	box-shadow: var(--shadow-sm);
	padding: 1.2rem 1.5rem;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 1rem;
	flex-wrap: wrap;
}

.toolbar-left {
	display: flex;
	align-items: center;
	gap: 1rem;
	flex-wrap: wrap;
}

.search-wrap {
	position: relative;
}

.search-icon {
	position: absolute;
	left: 14px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--muted);
	font-size: 0.9rem;
}

.search-input {
	width: 260px;
	padding: 9px 14px 9px 38px;
	border: 1.5px solid var(--cream);
	border-radius: 50px;
	font-size: 0.88rem;
	background: var(--ivory);
}

.filter-select {
	padding: 9px 14px;
	border: 1.5px solid var(--cream);
	border-radius: 50px;
	font-size: 0.85rem;
	background: var(--ivory);
}

.btn-new {
	padding: 9px 20px;
	border-radius: var(--radius-sm);
	font-size: 0.85rem;
	font-weight: 600;
	background: var(--oxford);
	color: var(--gold);
	text-decoration: none;
}

.btn-new:hover {
	background: var(--eton);
	color: white;
}

/* TABLE CARD */
.table-card {
	background: white;
	border-radius: var(--radius);
	box-shadow: var(--shadow-sm);
	overflow: hidden;
}

.styled-table {
	width: 100%;
	border-collapse: collapse;
}

.styled-table thead {
	background: var(--ivory);
}

.styled-table th {
	font-size: 0.7rem;
	text-transform: uppercase;
	letter-spacing: 1px;
	color: var(--muted);
	padding: 0.9rem 1rem;
}

.styled-table td {
	padding: 0.95rem 1rem;
	font-size: 0.88rem;
}

.styled-table tbody tr {
	border-bottom: 1px solid var(--cream);
}

.styled-table tbody tr:hover {
	background: #F9F7F2;
}

.pill {
	padding: 3px 10px;
	border-radius: 50px;
	font-size: 0.72rem;
	font-weight: 700;
}

.pill-active {
	background: #E8F5EE;
	color: #2D6A4F;
}

.pill-inactive {
	background: #FEF0EB;
	color: #B5573B;
}

.btn-action {
	padding: 5px 12px;
	border-radius: var(--radius-sm);
	font-size: 0.78rem;
	font-weight: 600;
	text-decoration: none;
	border: 1px solid transparent;
	margin-right: 3px;
}

.btn-edit {
	border-color: var(--gold);
	color: #8B6D1F;
}

.btn-edit:hover {
	background: var(--gold);
	color: var(--oxford);
}

.btn-delete {
	border-color: var(--rose);
	color: var(--rose);
}

.btn-delete:hover {
	background: var(--rose);
	color: white;
}

/* EMPTY STATE */
.empty-state {
	text-align: center;
	padding: 4rem 2rem;
}

.empty-icon {
	font-size: 3rem;
	opacity: 0.3;
	margin-bottom: 0.8rem;
}

.empty-text {
	color: var(--muted);
	font-size: 0.92rem;
}
/* ===== DASHBOARD BACKGROUND FIX ===== */

/* main dashboard area */
.content-wrapper{
	background:#F3EFE7 !important;
}

/* page body soft contrast */
body{
	background:#F3EFE7 !important;
}

/* panels/cards area subtle contrast */
.main-panel{
	background:#F3EFE7 !important;
}
</style>
</head>

<body>

	<div class="container-scroller">

		<jsp:include page="AdminHeader.jsp"></jsp:include>

		<div class="container-fluid page-body-wrapper">

			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

			<div class="main-panel">

				<div class="content-wrapper">

					<div class="welcome-badge">Admin Panel</div>
					<h3 class="page-title">Category Management</h3>
					<p class="page-subtitle">Create, edit and manage hackathon
						categories</p>

					<div class="section-label">All Categories</div>

					<!-- TOOLBAR -->

					<div class="toolbar-card mb-3">

						<div class="toolbar-left">

							<div class="search-wrap">
								<span class="search-icon">🔍</span> <input type="text"
									class="search-input" placeholder="Search categories..."
									onkeyup="filterTable(this.value)">
							</div>

							<select class="filter-select"
								onchange="filterByStatus(this.value)">
								<option value="">All Status</option>
								<option value="ACTIVE">Active</option>
								<option value="INACTIVE">Inactive</option>
							</select>

						</div>

						<a href="newCategory" class="btn-new">＋ New Category</a>

					</div>

					<!-- TABLE -->

					<div class="table-card">

						<div class="table-responsive">

							<table class="styled-table">

								<thead>
									<tr>
										<th>#</th>
										<th>Category Name</th>
										<th>Status</th>
										<th style="text-align: center;">Actions</th>
									</tr>
								</thead>

								<tbody id="categoryTable">

									<c:if test="${empty categoryList}">
										<tr>
											<td colspan="4">

												<div class="empty-state">
													<div class="empty-icon">📂</div>
													<div class="empty-text">No categories found</div>
												</div>

											</td>
										</tr>
									</c:if>

									<c:forEach var="cat" items="${categoryList}" varStatus="i">

										<tr>

											<td>${i.count}</td>

											<td><strong>${cat.categoryName}</strong></td>

											<td><c:choose>

													<c:when test="${cat.active}">
														<span class="pill pill-active">ACTIVE</span>
													</c:when>

													<c:otherwise>
														<span class="pill pill-inactive">INACTIVE</span>
													</c:otherwise>

												</c:choose></td>

											<td style="text-align: center"><a
												href="editCategory?id=${cat.categoryId}"
												class="btn-action btn-edit"> Edit </a> <a
												href="deleteCategory?categoryId=${cat.categoryId}"
												onclick="return confirm('Are you sure you want to delete this category?');"
												class="btn-action btn-delete"> Delete </a></td>

										</tr>

									</c:forEach>

								</tbody>

							</table>

						</div>

					</div>

				</div>

				<jsp:include page="AdminFooter.jsp"></jsp:include>

			</div>
		</div>
	</div>

	<script>
		function filterTable(input) {

			input = input.toLowerCase()

			var rows = document.querySelectorAll("#categoryTable tr")

			rows.forEach(function(row) {

				var text = row.innerText.toLowerCase()

				row.style.display = text.indexOf(input) !== -1 ? "" : "none"

			})

		}

		function filterByStatus(status) {

			var rows = document.querySelectorAll("#categoryTable tr")

			rows.forEach(function(row) {

				if (!status) {
					row.style.display = ""
					return

				}

				var text = row.innerText.toUpperCase()

				row.style.display = text.indexOf(status) !== -1 ? "" : "none"

			})

		}
	</script>

</body>
</html>