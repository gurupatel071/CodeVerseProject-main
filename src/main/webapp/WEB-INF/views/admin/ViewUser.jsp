<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View User</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<!-- Google Fonts — same as Dashboard -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

  :root {
    --navy:      #1B2A4A;
    --oxford:    #0E1F3D;
    --eton:      #2E6B72;
    --sage:      #4A7C6F;
    --ivory:     #F7F4EE;
    --cream:     #EDE9E0;
    --slate:     #4B5B6E;
    --muted:     #8C97A4;
    --gold:      #C9A84C;
    --rose:      #A85858;
    --white:     #FFFFFF;
    --shadow-sm: 0 2px 12px rgba(27,42,74,0.08);
    --shadow-md: 0 8px 32px rgba(27,42,74,0.12);
    --shadow-lg: 0 16px 48px rgba(27,42,74,0.16);
    --radius:    14px;
    --radius-sm: 8px;
  }

  * { box-sizing: border-box; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  .content-wrapper {
    padding: 2rem 2rem 1rem !important;
    animation: pageFadeIn 0.7s ease both;
  }

  @keyframes pageFadeIn {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ===========================
     PAGE TITLE
  =========================== */
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

  /* ===========================
     PROFILE CARD
  =========================== */
  .profile-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-md);
    overflow: hidden;
    animation: cardSlideUp 0.6s 0.1s ease both;
  }

  @keyframes cardSlideUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Left panel — Oxford dark */
  .profile-left {
    background: var(--oxford);
    padding: 2.5rem 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    text-align: center;
    min-height: 100%;
  }

  .profile-avatar-wrap {
    position: relative;
    margin-bottom: 1.2rem;
  }

  .profile-pic {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid var(--gold);
    box-shadow: 0 0 0 6px rgba(201,168,76,0.15);
  }

  /* Avatar fallback circle */
  .avatar-initials {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--eton), var(--sage));
    border: 3px solid var(--gold);
    box-shadow: 0 0 0 6px rgba(201,168,76,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Playfair Display', serif;
    font-size: 2rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 0;
  }

  .profile-name {
    font-family: 'Playfair Display', serif;
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 0.3rem;
  }

  .profile-email {
    font-size: 0.78rem;
    color: rgba(255,255,255,0.55);
    margin-bottom: 1rem;
    word-break: break-all;
  }

  .role-pill {
    display: inline-block;
    padding: 4px 14px;
    border-radius: 50px;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-bottom: 0.6rem;
  }

  .pill-admin  { background: rgba(201,168,76,0.2); color: var(--gold); border: 1px solid rgba(201,168,76,0.4); }
  .pill-user   { background: rgba(255,255,255,0.1); color: rgba(255,255,255,0.8); border: 1px solid rgba(255,255,255,0.2); }

  .status-pill-left {
    display: inline-block;
    padding: 4px 14px;
    border-radius: 50px;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.5px;
  }

  .pill-active-left   { background: rgba(45,106,79,0.25);  color: #6FCF97; border: 1px solid rgba(45,106,79,0.4); }
  .pill-inactive-left { background: rgba(168,88,88,0.25);  color: #EB9090; border: 1px solid rgba(168,88,88,0.4); }

  /* Stats mini row inside left panel */
  .profile-meta {
    width: 100%;
    margin-top: 1.5rem;
    border-top: 1px solid rgba(255,255,255,0.08);
    padding-top: 1.2rem;
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
  }

  .meta-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .meta-label {
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 0.8px;
    text-transform: uppercase;
    color: rgba(255,255,255,0.4);
  }

  .meta-value {
    font-size: 0.82rem;
    font-weight: 600;
    color: rgba(255,255,255,0.85);
  }

  /* ===========================
     RIGHT INFO PANEL
  =========================== */
  .profile-right {
    padding: 2rem 2.5rem;
  }

  .info-section-title {
    font-family: 'Playfair Display', serif;
    font-size: 1rem;
    color: var(--oxford);
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid var(--cream);
  }

  .info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.2rem 2rem;
    margin-bottom: 1.8rem;
  }

  .info-item {}

  .info-item .info-key {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 4px;
  }

  .info-item .info-val {
    font-size: 0.92rem;
    font-weight: 500;
    color: var(--navy);
  }

  .info-val-muted {
    color: var(--muted);
    font-style: italic;
    font-size: 0.85rem;
  }

  /* ===========================
     FOOTER ACTIONS
  =========================== */
  .profile-footer {
    padding: 1.2rem 2.5rem;
    border-top: 1px solid var(--cream);
    display: flex;
    justify-content: flex-end;
    gap: 0.75rem;
    background: var(--ivory);
    border-radius: 0 0 var(--radius) 0;
  }

  .btn-action {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 20px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    font-weight: 600;
    text-decoration: none;
    border: 1.5px solid transparent;
    cursor: pointer;
    transition: all 0.22s ease;
  }

  .btn-back {
    border-color: var(--slate);
    color: var(--slate);
    background: transparent;
  }
  .btn-back:hover {
    background: var(--slate);
    color: var(--white);
  }

  .btn-edit {
    border-color: var(--gold);
    color: var(--oxford);
    background: var(--gold);
  }
  .btn-edit:hover {
    background: var(--oxford);
    color: var(--gold);
    border-color: var(--oxford);
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

        <!-- ===========================
             PAGE TITLE
        =========================== -->
        <div class="welcome-badge">Admin Panel</div>
        <h3 class="page-title">User Details</h3>
        <p class="page-subtitle">Complete profile information for this user</p>

        <div class="section-label">Profile</div>

        <div class="row justify-content-center">
          <div class="col-lg-11">

            <div class="profile-card">
              <div class="row g-0">

                <!-- ===========================
                     LEFT — PROFILE PANEL
                =========================== -->
                <div class="col-md-3">
                  <div class="profile-left">

                    <!-- Avatar -->
                    <div class="profile-avatar-wrap">
                      <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                          <img src="${user.profilePicURL}" class="profile-pic">
                        </c:when>
                        <c:otherwise>
                          <div class="avatar-initials">
                            ${user.firstName.substring(0,1)}${user.lastName.substring(0,1)}
                          </div>
                        </c:otherwise>
                      </c:choose>
                    </div>

                    <!-- Name + Email -->
                    <div class="profile-name">${user.firstName} ${user.lastName}</div>
                    <div class="profile-email">${user.email}</div>

                    <!-- Role pill -->
                    <c:choose>
                      <c:when test="${user.role == 'ADMIN'}">
                        <span class="role-pill pill-admin">${user.role}</span>
                      </c:when>
                      <c:otherwise>
                        <span class="role-pill pill-user">${user.role}</span>
                      </c:otherwise>
                    </c:choose>

                    <!-- Status pill -->
                    <c:choose>
                      <c:when test="${user.active}">
                        <span class="status-pill-left pill-active-left">Active</span>
                      </c:when>
                      <c:otherwise>
                        <span class="status-pill-left pill-inactive-left">Inactive</span>
                      </c:otherwise>
                    </c:choose>

                    <!-- Meta info -->
                    <div class="profile-meta">
                      <div class="meta-item">
                        <span class="meta-label">User ID</span>
                        <span class="meta-value">#${user.userId}</span>
                      </div>
                      <div class="meta-item">
                        <span class="meta-label">Gender</span>
                        <span class="meta-value">${user.gender}</span>
                      </div>
                      <div class="meta-item">
                        <span class="meta-label">Birth Year</span>
                        <span class="meta-value">${user.birthYear}</span>
                      </div>
                    </div>

                  </div>
                </div>

                <!-- ===========================
                     RIGHT — DETAILS PANEL
                =========================== -->
                <div class="col-md-9">
                  <div class="profile-right">

                    <!-- Contact Info -->
                    <div class="info-section-title">Contact Information</div>
                    <div class="info-grid">

                      <div class="info-item">
                        <div class="info-key">Full Name</div>
                        <div class="info-val">${user.firstName} ${user.lastName}</div>
                      </div>

                      <div class="info-item">
                        <div class="info-key">Email Address</div>
                        <div class="info-val">${user.email}</div>
                      </div>

                      <div class="info-item">
                        <div class="info-key">Contact Number</div>
                        <div class="info-val">
                          <c:choose>
                            <c:when test="${not empty user.contactNum}">${user.contactNum}</c:when>
                            <c:otherwise><span class="info-val-muted">Not provided</span></c:otherwise>
                          </c:choose>
                        </div>
                      </div>

                      <div class="info-item">
                        <div class="info-key">Member Since</div>
                        <div class="info-val">${user.createdAt}</div>
                      </div>

                    </div>

                    <!-- Location Info -->
                    <div class="info-section-title">Location</div>
                    <div class="info-grid">

                      <div class="info-item">
                        <div class="info-key">Country</div>
                        <div class="info-val">
                          <c:choose>
                            <c:when test="${not empty userDetail.country}">${userDetail.country}</c:when>
                            <c:otherwise><span class="info-val-muted">Not provided</span></c:otherwise>
                          </c:choose>
                        </div>
                      </div>

                      <div class="info-item">
                        <div class="info-key">State</div>
                        <div class="info-val">
                          <c:choose>
                            <c:when test="${not empty userDetail.state}">${userDetail.state}</c:when>
                            <c:otherwise><span class="info-val-muted">Not provided</span></c:otherwise>
                          </c:choose>
                        </div>
                      </div>

                      <div class="info-item">
                        <div class="info-key">City</div>
                        <div class="info-val">
                          <c:choose>
                            <c:when test="${not empty userDetail.city}">${userDetail.city}</c:when>
                            <c:otherwise><span class="info-val-muted">Not provided</span></c:otherwise>
                          </c:choose>
                        </div>
                      </div>

                    </div>

                  </div>

                  <!-- Footer Actions -->
                  <div class="profile-footer">
                    <a href="listUser" class="btn-action btn-back">← Back to Users</a>
                    <a href="editUser?userId=${user.userId}" class="btn-action btn-edit">✎ Edit User</a>
                  </div>

                </div>

              </div>
            </div>

          </div>
        </div>

      </div>

      <jsp:include page="AdminFooter.jsp"></jsp:include>

    </div>
  </div>
</div>

</body>
</html>
