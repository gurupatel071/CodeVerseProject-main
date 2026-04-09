<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>


/* ===== SIDEBAR BASE ===== */

.sidebar{
    background:#f6f4ef !important;
}

/* ===== REMOVE TEMPLATE DEFAULT BACKGROUND ===== */

.sidebar .nav .nav-item,
.sidebar .nav .nav-item.show,
.sidebar .collapse.show{
    background:transparent !important;
}

/* ===== MAIN LINKS ===== */

.sidebar .nav .nav-item > .nav-link{
    color:#3a4555 !important;
    font-weight:500;
    border-radius:10px;
    margin:4px 10px;
    padding:11px 16px;
    transition:background .22s ease, color .22s ease, transform .18s ease, box-shadow .22s ease;
}

/* ===== ICON COLOR ===== */

.sidebar .nav .nav-item > .nav-link i{
    color:#2e6b72 !important;
    transition:color .22s ease;
}

/* ===== HOVER EFFECT ===== */

.sidebar .nav .nav-item > .nav-link:hover{
    background:rgba(20,45,70,0.13) !important;
    color:#0e1f3d !important;
    transform:translateX(3px);
}

/* ===== HOVER ICON ===== */

.sidebar .nav .nav-item > .nav-link:hover i{
    color:#0e1f3d !important;
}

/* ===== ACTIVE MENU ===== */

.sidebar .nav .nav-item.active > .nav-link{
    background:linear-gradient(135deg, #1a3a4a 0%, #0e2535 100%) !important;
    color:#f6f4ef !important;
    box-shadow:0 4px 14px rgba(14,31,61,0.22);
    transform:translateX(0);
}

/* ===== ACTIVE ICON ===== */

.sidebar .nav .nav-item.active > .nav-link i{
    color:#8ecdd4 !important;
}

/* ===== DROPDOWN OPEN (not active, just expanded) ===== */

.sidebar .nav-link[aria-expanded="true"]{
    background:rgba(20,45,70,0.10) !important;
    color:#0e1f3d !important;
}

.sidebar .nav-link[aria-expanded="true"] i{
    color:#0e1f3d !important;
}

/* ===== SUBMENU CONTAINER — no vertical line ===== */

.sidebar .nav.sub-menu{
    background:transparent !important;
    padding-left:20px;
    margin-left:0;
    border:none !important;
}

/* ===== SUBMENU LINKS ===== */

.sidebar .nav.sub-menu .nav-link{
    color:#556070 !important;
    font-size:0.84rem;
    padding:7px 14px;
    border-radius:8px;
    transition:background .18s ease, color .18s ease, transform .15s ease;
    position:relative;
}

/* ===== SUBMENU HOVER ===== */

.sidebar .nav.sub-menu .nav-link:hover{
    background:rgba(20,45,70,0.10) !important;
    color:#0e1f3d !important;
    transform:translateX(2px);
}

/* ===== SUBMENU ACTIVE ===== */

.sidebar .nav.sub-menu .nav-link.active{
    color:#1a3a4a !important;
    font-weight:600;
    background:rgba(20,45,70,0.08) !important;
}

</style>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="admin-dashboard">
				<i class="icon-grid menu-icon"></i> <span class="menu-title">Dashboard</span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
			aria-controls="ui-basic"> <i class="icon-layout menu-icon"></i> <span
				class="menu-title">Manage Users</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="newUserType">Add
							NewUser Type</a></li>
					<li class="nav-item"><a class="nav-link" href="listUserType">List
							NewUser Type</a></li>
					<li class="nav-item"><a class="nav-link" href="listUser">User
							List</a></li>
					<li class="nav-item"><a class="nav-link" href="newJudge">New 
							Judge</a></li>
					<li class="nav-item"><a class="nav-link" href="listJudge">List
							Judge</a></li>				
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i class="icon-columns menu-icon"></i>
				<span class="menu-title">Category</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="newCategory">New
							Category</a></li>

					<li class="nav-item"><a class="nav-link" href="listCategory">List
							Category</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			data-bs-toggle="collapse" href="#charts" aria-expanded="false"
			aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
				<span class="menu-title">Hackathon</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="newHackathon">New
							Hackathon</a></li>

					<li class="nav-item"><a class="nav-link" href="listHackathon">List
							Hackathon</a></li>
				</ul>
		<li class="nav-item"><a class="nav-link"
			data-bs-toggle="collapse" href="#auth" aria-expanded="false"
			aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
				class="menu-title">User Pages</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="login">
							Login </a></li>
					<li class="nav-item"><a class="nav-link" href="signup">
							Register </a></li>
				</ul>
			</div></li>
	</ul>
</nav>