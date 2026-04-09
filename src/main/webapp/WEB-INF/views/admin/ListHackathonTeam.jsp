<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

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


<jsp:include page="AdminCSS.jsp" />

<div class="container-scroller">

	<jsp:include page="AdminHeader.jsp" />
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="AdminLeftSidebar.jsp" />

		<div class="main-panel">
			<div class="content-wrapper">

				<h3 class="mb-4 text-center">Hackathon Team Management</h3>

				<table class="table table-bordered">

					<tr>
						<th>#</th>
						<th>Hackathon</th>
						<th>Leader</th>
						<th>Team Name</th>
						<th>Status</th>
						<th>Action</th>
					</tr>

					<c:forEach items="${teamList}" var="t" varStatus="i">

						<tr>
							<td>${i.count}</td>
							<td>${t.hackathon.title}</td>
							<td>${t.teamLeader.firstName}</td>
							<td>${t.teamName}</td>
							<td>${t.teamStatus}</td>

							<td><a
								href="deleteHackathonTeam?hackathonTeamId=${t.hackathonTeamId}"
								class="btn btn-danger btn-sm">Delete</a></td>

						</tr>

					</c:forEach>

				</table>

			</div>

			<jsp:include page="AdminFooter.jsp" />

		</div>
	</div>
</div>