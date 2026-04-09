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
}</style>

<jsp:include page="AdminCSS.jsp" />

<div class="container-scroller">

	<jsp:include page="AdminHeader.jsp" />
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="AdminLeftSidebar.jsp" />

		<div class="main-panel">
			<div class="content-wrapper">

				<div class="text-center mb-4">
					<h3 class="font-weight-bold border-bottom pb-2">New Hackathon
						Team</h3>
				</div>

				<div class="card shadow-sm">
					<div class="card-body">

						<form action="saveHackathonTeam" method="post">

							<div class="mb-3">
								<label>Hackathon</label> <select name="hackathon.hackathonId"
									class="form-control">
									<c:forEach items="${hackathonList}" var="h">
										<option value="${h.hackathonId}">${h.title}</option>
									</c:forEach>
								</select>
							</div>

							<div class="mb-3">
								<label>Team Leader</label> <select name="teamLeader.userId"
									class="form-control">
									<c:forEach items="${userList}" var="u">
										<option value="${u.userId}">${u.firstName}</option>
									</c:forEach>
								</select>
							</div>

							<div class="mb-3">
								<label>Team Name</label> <input type="text" name="teamName"
									class="form-control">
							</div>

							<div class="mb-3">
								<label>Status</label> <select name="teamStatus"
									class="form-control">
									<option value="QUALIFY">QUALIFY</option>
									<option value="SUSPEND">SUSPEND</option>
								</select>
							</div>

							<button class="btn btn-primary">Save</button>

						</form>

					</div>
				</div>

			</div>

			<jsp:include page="AdminFooter.jsp" />

		</div>
	</div>
</div>