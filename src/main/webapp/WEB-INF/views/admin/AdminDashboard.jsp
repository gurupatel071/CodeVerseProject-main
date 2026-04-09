<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

<!-- Chart JS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

  /* ===========================
     ROOT VARIABLES — ENGLISH PALETTE
     Inspired by: Oxford, Eton Blue, Ivory, Slate
  =========================== */
  :root {
    --navy:       #1B2A4A;
    --oxford:     #0E1F3D;
    --eton:       #2E6B72;
    --sage:       #4A7C6F;
    --ivory:      #F7F4EE;
    --cream:      #EDE9E0;
    --slate:      #4B5B6E;
    --muted:      #8C97A4;
    --gold:       #C9A84C;
    --rose:       #A85858;
    --white:      #FFFFFF;
    --shadow-sm:  0 2px 12px rgba(27,42,74,0.08);x
    --shadow-md:  0 8px 32px rgba(27,42,74,0.12);
    --shadow-lg:  0 16px 48px rgba(27,42,74,0.16);
    --radius:     14px;
    --radius-sm:  8px;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  /* ===========================
     PAGE FADE-IN
  =========================== */
  .content-wrapper {
    padding: 2rem 2rem 1rem !important;
    animation: pageFadeIn 0.7s ease both;
  }

  @keyframes pageFadeIn {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ===========================
     WELCOME HEADER
  =========================== */
  .dashboard-welcome {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 0.25rem;
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

  .welcome-title {
    font-family: 'Playfair Display', serif;
    font-size: 2rem;
    font-weight: 700;
    color: var(--oxford);
    line-height: 1.2;
  }

  .welcome-title span {
    color: var(--eton);
  }

  .text-muted-custom {
    color: var(--muted);
    font-size: 0.9rem;
    margin-bottom: 2rem;
    letter-spacing: 0.3px;
  }

  /* ===========================
     STAT CARDS
  =========================== */
  .stat-card {
    border: none;
    border-radius: var(--radius);
    padding: 1.5rem 1.6rem;
    position: relative;
    overflow: hidden;
    cursor: default;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: var(--shadow-sm);
    animation: cardSlideUp 0.6s ease both;
  }

  .stat-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow-lg);
  }

  .stat-card::before {
    content: '';
    position: absolute;
    top: -30px; right: -30px;
    width: 100px; height: 100px;
    border-radius: 50%;
    opacity: 0.12;
    background: white;
    transition: transform 0.4s ease;
  }

  .stat-card:hover::before {
    transform: scale(1.5);
  }

  .stat-card p {
    font-size: 0.78rem;
    font-weight: 600;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    opacity: 0.85;
    margin-bottom: 0.5rem;
  }

  .stat-card h2 {
    font-family: 'Playfair Display', serif;
    font-size: 2.6rem;
    font-weight: 700;
    line-height: 1;
  }

  .stat-icon {
    position: absolute;
    bottom: 14px; right: 18px;
    font-size: 2.8rem;
    opacity: 0.18;
    font-weight: 900;
  }

  /* Card Colour Themes — English Palette */
  .card-oxford  { background: var(--oxford);  color: var(--white); }
  .card-eton    { background: var(--eton);    color: var(--white); }
  .card-sage    { background: var(--sage);    color: var(--white); }
  .card-gold    { background: var(--gold);    color: var(--oxford); }

  .card-upcoming  { background: #2D6A4F; color: var(--white); }
  .card-ongoing   { background: #B5573B; color: var(--white); }
  .card-completed { background: #2C4A6E; color: var(--white); }

  /* Staggered animation */
  @keyframes cardSlideUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  .stat-card:nth-child(1) { animation-delay: 0.1s; }
  .stat-card:nth-child(2) { animation-delay: 0.2s; }
  .stat-card:nth-child(3) { animation-delay: 0.3s; }
  .stat-card:nth-child(4) { animation-delay: 0.4s; }

  /* ===========================
     SECTION DIVIDER
  =========================== */
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
     QUICK ACTION BUTTONS
  =========================== */
  .action-btn {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 0.8rem 1.2rem;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-weight: 600;
    font-size: 0.85rem;
    letter-spacing: 0.3px;
    text-decoration: none !important;
    border: none;
    cursor: pointer;
    transition: all 0.25s ease;
    box-shadow: var(--shadow-sm);
  }

  .action-btn:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }

  .action-btn-primary   { background: var(--oxford);  color: var(--white); }
  .action-btn-success   { background: var(--sage);    color: var(--white); }
  .action-btn-warning   { background: var(--gold);    color: var(--oxford); }
  .action-btn-info      { background: var(--eton);    color: var(--white); }

  /* ===========================
     CHART CARD — CENTERED
  =========================== */
  .chart-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-md);
    padding: 2rem;
    animation: cardSlideUp 0.6s 0.5s ease both;
  }

  .chart-card-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.2rem;
    color: var(--oxford);
    margin-bottom: 0.3rem;
  }

  .chart-card-subtitle {
    font-size: 0.78rem;
    color: var(--muted);
    margin-bottom: 1.8rem;
  }

  .chart-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 500px;
    margin: 0 auto;
  }

  /* ===========================
     RECENT HACKATHONS TABLE
  =========================== */
  .table-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-sm);
    padding: 1.5rem 1.8rem;
    animation: cardSlideUp 0.6s 0.65s ease both;
  }

  .table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.2rem;
  }

  .table-card-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.15rem;
    color: var(--oxford);
  }

  .badge-count {
    background: var(--oxford);
    color: var(--gold);
    font-size: 0.7rem;
    font-weight: 700;
    padding: 3px 9px;
    border-radius: 50px;
    margin-left: 8px;
  }

  .view-all-link {
    font-size: 0.8rem;
    font-weight: 600;
    color: var(--eton);
    text-decoration: none;
    letter-spacing: 0.3px;
    transition: color 0.2s;
  }
  .view-all-link:hover { color: var(--oxford); }

  .styled-table {
    width: 100%;
    border-collapse: collapse;
  }

  .styled-table thead tr {
    border-bottom: 2px solid var(--cream);
  }

  .styled-table thead th {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    color: var(--muted);
    padding: 0.6rem 0.8rem;
    text-align: left;
  }

  .styled-table tbody tr {
    border-bottom: 1px solid var(--ivory);
    transition: background 0.2s ease;
  }

  .styled-table tbody tr:hover {
    background: var(--ivory);
  }

  .styled-table tbody td {
    padding: 0.85rem 0.8rem;
    font-size: 0.88rem;
    color: var(--slate);
  }

  /* Status Pills */
  .pill {
    display: inline-block;
    padding: 3px 11px;
    border-radius: 50px;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 0.5px;
    white-space: nowrap;
  }

  .pill-upcoming  { background: #E8F0FE; color: #2C4A6E; }
  .pill-ongoing   { background: #E8F5EE; color: #2D6A4F; }
  .pill-completed { background: var(--cream); color: var(--slate); }
  .pill-free      { background: #E8F5EE; color: #2D6A4F; }
  .pill-paid      { background: #FEF0EB; color: #B5573B; }

  /* ===========================
     STAT PULSE NUMBERS
  =========================== */
  @keyframes countUp {
    from { opacity: 0; transform: scale(0.8); }
    to   { opacity: 1; transform: scale(1); }
  }
  .stat-card h2 {
    animation: countUp 0.5s ease both;
    animation-delay: inherit;
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

  <!-- HEADER -->
  <jsp:include page="AdminHeader.jsp"></jsp:include>

  <div class="container-fluid page-body-wrapper">

    <!-- SIDEBAR -->
    <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

    <div class="main-panel">
      <div class="content-wrapper">

        <!-- ===========================
             WELCOME
        =========================== -->
        <div class="welcome-badge">Admin Dashboard</div>

        <c:if test="${not empty sessionScope.user}">
          <h3 class="welcome-title mb-1">
            Welcome back, <span>${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
          </h3>
        </c:if>

        <p class="text-muted-custom">Hackathon Management Dashboard — Overview</p>


        <!-- ===========================
             MAIN STATS ROW
        =========================== -->
        <div class="section-label">Core Metrics</div>

        <div class="row g-3 mb-3">

          <div class="col-md-3">
            <div class="stat-card card-oxford">
              <p>Total Users</p>
              <h2>${totalUsers}</h2>
              <div class="stat-icon">👥</div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="stat-card card-eton">
              <p>Total Categories</p>
              <h2>${totalCategories}</h2>
              <div class="stat-icon">🏷</div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="stat-card card-sage">
              <p>Total Hackathons</p>
              <h2>${totalHackathons}</h2>
              <div class="stat-icon">💻</div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="stat-card card-gold">
              <p>Active Hackathons</p>
              <h2>${activeHackathons}</h2>
              <div class="stat-icon">⚡</div>
            </div>
          </div>

        </div>


        <!-- ===========================
             EXTRA STATS ROW
        =========================== -->
        <div class="section-label">Event Breakdown</div>

        <div class="row g-3 mb-4">

          <div class="col-md-4">
            <div class="stat-card card-upcoming">
              <p>Upcoming</p>
              <h2>${upcomingCount}</h2>
              <div class="stat-icon">🗓</div>
            </div>
          </div>

          <div class="col-md-4">
            <div class="stat-card card-ongoing">
              <p>Ongoing</p>
              <h2>${ongoingCount}</h2>
              <div class="stat-icon">🔥</div>
            </div>
          </div>

          <div class="col-md-4">
            <div class="stat-card card-completed">
              <p>Completed</p>
              <h2>${completedCount}</h2>
              <div class="stat-icon">✅</div>
            </div>
          </div>

        </div>


        <!-- ===========================
             QUICK ACTIONS
        =========================== -->
        <div class="section-label">Quick Actions</div>

        <div class="row g-2 mb-4">

          <div class="col-md-3">
            <a href="newHackathon" class="action-btn action-btn-primary w-100 justify-content-center">
              ＋ Create Hackathon
            </a>
          </div>

          <div class="col-md-3">
            <a href="newCategory" class="action-btn action-btn-success w-100 justify-content-center">
              ＋ Add Category
            </a>
          </div>

          <div class="col-md-3">
            <a href="listHackathon" class="action-btn action-btn-warning w-100 justify-content-center">
              ⚙ Manage Hackathons
            </a>
          </div>

          <div class="col-md-3">
            <a href="listUser" class="action-btn action-btn-info w-100 justify-content-center">
              👤 Manage Users
            </a>
          </div>

        </div>


        <!-- ===========================
             CHART — CENTERED
        =========================== -->
        <div class="section-label">Analytics</div>

        <div class="row mb-4">
          <div class="col-md-8 offset-md-2">
            <div class="chart-card text-center">
              <h4 class="chart-card-title">Hackathon Status Overview</h4>
              <p class="chart-card-subtitle">Distribution of hackathons by current status</p>
              <div class="chart-wrapper">
                <canvas id="hackathonChart"></canvas>
              </div>
            </div>
          </div>
        </div>


        <!-- ===========================
             RECENT HACKATHONS TABLE
        =========================== -->
        <div class="section-label">Recent Hackathons</div>

        <div class="row mb-4">
          <div class="col-md-12">
            <div class="table-card">

              <div class="table-header">
                <div>
                  <span class="table-card-title">Recent Hackathons</span>
                  <span class="badge-count">${totalHackathons}</span>
                </div>
                <a href="listHackathon" class="view-all-link">View All →</a>
              </div>

              <div class="table-responsive">
                <table class="styled-table">
                  <thead>
                    <tr>
                      <th>Title</th>
                      <th>Status</th>
                      <th>Event Type</th>
                      <th>Registration End</th>
                    </tr>
                  </thead>
                  <tbody>

                    <c:forEach var="h" items="${recentHackathons}">
                      <tr>
                        <td><strong>${h.title}</strong></td>
                           <td>
                      <c:choose>
                        <c:when test="${h.status == 'UPCOMING'}">
                          <span class="pill pill-upcoming">${h.status}</span>
                        </c:when>
                        <c:when test="${h.status == 'ONGOING'}">
                          <span class="pill pill-ongoing">${h.status}</span>
                        </c:when>
                        <c:otherwise>
                          <span class="pill pill-completed">${h.status}</span>
                        </c:otherwise>
                      </c:choose>
                    </td>
                        <td>${h.eventType}</td>
                        <td>${h.registrationEndDate}</td>
                      </tr>
                    </c:forEach>

                    <c:if test="${empty recentHackathons}">
                      <tr>
                        <td colspan="4" style="text-align:center; color:var(--muted); padding:2rem 0;">
                          No recent hackathons found
                        </td>
                      </tr>
                    </c:if>

                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>


      </div>

      <!-- FOOTER -->
      <jsp:include page="AdminFooter.jsp"></jsp:include>

    </div>
  </div>
</div>


<!-- ===========================
     CHART SCRIPT
=========================== -->
<script>

const ctx = document.getElementById('hackathonChart');

// Animate in
ctx.style.opacity = '0';
ctx.style.transform = 'translateY(20px)';
ctx.style.transition = 'opacity 0.6s ease, transform 0.6s ease';

setTimeout(() => {
  ctx.style.opacity = '1';
  ctx.style.transform = 'translateY(0)';
}, 400);

new Chart(ctx, {

  type: 'bar',

  data: {
    labels: ['Upcoming', 'Ongoing', 'Completed'],
    datasets: [{
      label: 'Hackathons',
      data: [${upcomingCount}, ${ongoingCount}, ${completedCount}],
      backgroundColor: [
        'rgba(45, 106, 79, 0.85)',
        'rgba(181, 87, 59, 0.85)',
        'rgba(44, 74, 110, 0.85)'
      ],
      borderColor: [
        'rgba(45, 106, 79, 1)',
        'rgba(181, 87, 59, 1)',
        'rgba(44, 74, 110, 1)'
      ],
      borderWidth: 0,
      borderRadius: 10,
      borderSkipped: false,
      barThickness: 60,
      hoverBackgroundColor: [
        'rgba(45, 106, 79, 1)',
        'rgba(181, 87, 59, 1)',
        'rgba(44, 74, 110, 1)'
      ]
    }]
  },

  options: {
    responsive: true,
    maintainAspectRatio: true,

    plugins: {
      legend: { display: false },
      tooltip: {
        backgroundColor: '#0E1F3D',
        titleColor: '#C9A84C',
        bodyColor: '#FFFFFF',
        padding: 12,
        cornerRadius: 8,
        titleFont: { family: 'DM Sans', weight: '600', size: 13 },
        bodyFont:  { family: 'DM Sans', size: 13 },
        callbacks: {
          label: function(item) {
            var n = item.parsed.y;
            return '  ' + n + (n == 1 ? ' hackathon' : ' hackathons');
          }
        }
      }
    },

    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          stepSize: 1,
          color: '#8C97A4',
          font: { family: 'DM Sans', size: 12 }
        },
        grid: { color: '#F0EDE6', drawBorder: false }
      },
      x: {
        ticks: {
          color: '#4B5B6E',
          font: { family: 'DM Sans', size: 13, weight: '600' }
        },
        grid: { display: false }
      }
    },

    animation: {
      duration: 1400,
      easing: 'easeOutQuart',
      delay: (ctx) => ctx.dataIndex * 200
    }
  }

});

</script>

</body>
</html>
