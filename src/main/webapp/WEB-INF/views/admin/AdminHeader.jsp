<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

/* ===== CODEVERSE LOGO ===== */
.logo-container {
	display: flex;
	align-items: center;
	gap: 12px;
	height: 60px;
}

.logo-icon {
	width: 32px;
	height: 32px;
	border-radius: 8px;
	background: #0e1f3d;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='15' height='15' viewBox='0 0 24 24' fill='none' stroke='%23e0be73' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='13 2 3 14 12 14 11 22 21 10 12 10 13 2'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: center;
	background-size: 15px;
}

.logo-main {
	font-family: 'Inter', sans-serif;
	font-size: 1.1rem;
	font-weight: 700;
	letter-spacing: -0.3px;
	background: linear-gradient(90deg, #0e1f3d 42%, #2e6b72 42%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

/* hide old logo image */
.navbar-brand.brand-logo img {
	display: none;
}

/* ===== PROFILE IMAGE PROFESSIONAL ALIGN ===== */

.nav-item.nav-profile{
	display:flex;
	align-items:center;
	height:60px;
}

.nav-item.nav-profile .nav-link{
	display:flex;
	align-items:center;
	justify-content:center;
	padding:0 4px;
}

.nav-item.nav-profile .nav-link img{
	width:32px;
	height:32px;
	border-radius:50%;
	object-fit:cover;
	border:none;
	box-shadow:0 1px 4px rgba(0,0,0,0.08);
	transition:transform .18s ease;
}

.nav-item.nav-profile .nav-link img:hover{
	transform:scale(1.05);
}


/* dropdown alignment */
.nav-item.nav-profile .dropdown-menu{
	right:0;
	left:auto;
	margin-top:10px;
}

/* ===== CODEVERSE ADMIN THEME (IVORY MATCH SIDEBAR) ===== */

/* navbar background */
.navbar{
	background:#f6f4ef !important;
}

/* left logo section */
.navbar-brand-wrapper{
	background:#f6f4ef !important;
}

/* right navbar section */
.navbar-menu-wrapper{
	background:#f6f4ef !important;
}

/* navbar icons color */
.navbar .nav-link i{
	color:#2e6b72 !important;
}

/* icon hover */
.navbar .nav-link:hover i{
	color:#0e1f3d !important;
}

/* notification badge */
.count{
	background:#c9a84c !important;
}

/* dropdown hover */
.dropdown-item:hover{
	background:rgba(46,107,114,0.08) !important;
	color:#2e6b72 !important;
}

</style>



<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">

	<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">

		<!-- ===== LOGO ===== -->

		<a class="navbar-brand brand-logo me-5" href="admin-dashboard">

			<div class="logo-container">

				<div class="logo-icon"></div>

				<div class="logo-main">CodeVerse</div>

			</div>

		</a>

		<a class="navbar-brand brand-logo-mini" href="">
			<div class="logo-container">

				<div class="logo-icon"></div>

			</div>
		</a>

	</div>



	<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

		<button class="navbar-toggler navbar-toggler align-self-center"
			type="button" data-toggle="minimize">
			<span class="icon-menu"></span>
		</button>



		<ul class="navbar-nav mr-lg-2">

			<li class="nav-item nav-search d-none d-lg-block">

				<div class="input-group">

					<div class="input-group-prepend hover-cursor"
						id="navbar-search-icon">

						<span class="input-group-text" id="search">
							<i class="icon-search"></i>
						</span>

					</div>

					<input type="text"
						class="form-control"
						id="navbar-search-input"
						placeholder="Search now"
						aria-label="search"
						aria-describedby="search">

				</div>

			</li>

		</ul>



		<ul class="navbar-nav navbar-nav-right">


			<!-- NOTIFICATION -->

			<li class="nav-item dropdown">

				<a class="nav-link count-indicator dropdown-toggle"
				id="notificationDropdown"
				href="#"
				data-bs-toggle="dropdown">

				<i class="icon-bell mx-0"></i>
				<span class="count"></span>

				</a>


				<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
				aria-labelledby="notificationDropdown">

				<p class="mb-0 font-weight-normal float-left dropdown-header">
				Notifications
				</p>

				<a class="dropdown-item preview-item">

				<div class="preview-thumbnail">
				<div class="preview-icon bg-success">
				<i class="ti-info-alt mx-0"></i>
				</div>
				</div>

				<div class="preview-item-content">
				<h6 class="preview-subject font-weight-normal">
				Application Error
				</h6>
				<p class="font-weight-light small-text mb-0 text-muted">
				Just now
				</p>
				</div>

				</a>



				<a class="dropdown-item preview-item">

				<div class="preview-thumbnail">
				<div class="preview-icon bg-warning">
				<i class="ti-settings mx-0"></i>
				</div>
				</div>

				<div class="preview-item-content">
				<h6 class="preview-subject font-weight-normal">
				Settings
				</h6>
				<p class="font-weight-light small-text mb-0 text-muted">
				Private message
				</p>
				</div>

				</a>



				<a class="dropdown-item preview-item">

				<div class="preview-thumbnail">
				<div class="preview-icon bg-info">
				<i class="ti-user mx-0"></i>
				</div>
				</div>

				<div class="preview-item-content">
				<h6 class="preview-subject font-weight-normal">
				New user registration
				</h6>
				<p class="font-weight-light small-text mb-0 text-muted">
				2 days ago
				</p>
				</div>

				</a>

				</div>

			</li>



			<!-- PROFILE -->

			<li class="nav-item nav-profile dropdown">

				<a class="nav-link dropdown-toggle"
				href="#"
				data-bs-toggle="dropdown"
				id="profileDropdown">

				<c:if test="${not empty sessionScope.user.profilePicURL}">
				<img src="${sessionScope.user.profilePicURL}" alt="profile"/>
				</c:if>

				<c:if test="${empty sessionScope.user.profilePicURL}">
				<img src="assets/images/faces/icon.jpg" alt="profile"/>
				</c:if>

				</a>


				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
				aria-labelledby="profileDropdown">

				<a class="dropdown-item">
				<i class="ti-settings text-primary"></i>
				Settings
				</a>

				<a class="dropdown-item" href="logout">
				<i class="ti-power-off text-primary"></i>
				Logout
				</a>

				</div>

			</li>



			<li class="nav-item nav-settings d-none d-lg-flex">
			<a class="nav-link" href="#">
			<i class="icon-ellipsis"></i>
			</a>
			</li>

		</ul>



		<button
		class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
		type="button"
		data-toggle="offcanvas">

		<span class="icon-menu"></span>

		</button>

	</div>

</nav>