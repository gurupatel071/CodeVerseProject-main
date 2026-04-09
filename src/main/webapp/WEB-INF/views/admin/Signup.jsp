<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Registration</title>

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
    --radius:    14px;
    --radius-sm: 8px;
  }

  * { box-sizing: border-box; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  /* ── ONLY CHANGE: content-wrapper centers the form ── */
  .content-wrapper {
    padding: 2rem 2rem 1rem !important;
    display: flex;
    flex-direction: column;
    align-items: center;
    animation: pageFadeIn 0.7s ease both;
  }

  /* make title block full-width so it doesn't shrink */
  .page-header-block {
    width: 100%;
    max-width: 780px;
  }

  @keyframes pageFadeIn {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @keyframes cardSlideUp {
    from { opacity: 0; transform: translateY(24px); }
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
    margin: 1.6rem 0 1rem;
    display: flex;
    align-items: center;
    gap: 10px;
    width: 100%;
  }

  .section-label::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--cream);
  }

  /* ===========================
     FORM CARD  — centered, fixed width
  =========================== */
  .form-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-md);
    overflow: hidden;
    animation: cardSlideUp 0.6s 0.1s ease both;
    width: 100%;
    max-width: 780px;        /* ← controls how wide the card is */
  }

  .form-card-header {
    background: var(--oxford);
    padding: 1.6rem 2rem;
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .form-card-header-icon {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: rgba(201,168,76,0.15);
    border: 1.5px solid rgba(201,168,76,0.35);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
  }

  .form-card-header-text h5 {
    font-family: 'Playfair Display', serif;
    font-size: 1.1rem;
    color: var(--white);
    margin: 0 0 2px;
  }

  .form-card-header-text p {
    font-size: 0.78rem;
    color: rgba(255,255,255,0.45);
    margin: 0;
  }

  .form-card-body {
    padding: 2rem 2.2rem;
  }

  /* ===========================
     FORM FIELDS
  =========================== */
  .form-group-custom {
    margin-bottom: 1.3rem;
  }

  .form-label-custom {
    display: block;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--slate);
    margin-bottom: 6px;
  }

  .form-control-custom {
    width: 100%;
    padding: 10px 14px;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    color: var(--navy);
    background: var(--ivory);
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
  }

  .form-control-custom:focus {
    border-color: var(--eton);
    box-shadow: 0 0 0 3px rgba(46,107,114,0.1);
    background: var(--white);
  }

  .form-control-custom::placeholder { color: var(--muted); }

  select.form-control-custom {
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%238C97A4' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    padding-right: 36px;
  }

  input[type="file"].form-control-custom {
    padding: 8px 14px;
    cursor: pointer;
  }

  input[type="file"].form-control-custom::-webkit-file-upload-button {
    background: var(--oxford);
    color: var(--gold);
    border: none;
    padding: 5px 14px;
    border-radius: 6px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.8rem;
    font-weight: 600;
    cursor: pointer;
    margin-right: 10px;
    transition: background 0.2s;
  }

  /* ===========================
     GENDER RADIO GROUP
  =========================== */
  .radio-group {
    display: flex;
    gap: 0.8rem;
    flex-wrap: wrap;
  }

  .radio-option {
    display: flex;
    align-items: center;
    gap: 7px;
    padding: 8px 16px;
    border: 1.5px solid var(--cream);
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.2s ease;
    background: var(--ivory);
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--slate);
  }

  .radio-option input[type="radio"] {
    accent-color: var(--eton);
    width: 15px;
    height: 15px;
    cursor: pointer;
    margin: 0;
  }

  .radio-option:has(input:checked) {
    border-color: var(--eton);
    background: rgba(46,107,114,0.08);
    color: var(--eton);
  }

  /* ===========================
     FORM SECTION DIVIDER
  =========================== */
  .form-section {
    margin-bottom: 0.5rem;
  }

  .form-section-title {
    font-family: 'Playfair Display', serif;
    font-size: 0.95rem;
    color: var(--oxford);
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid var(--cream);
  }

  /* ===========================
     SUBMIT BUTTON
  =========================== */
  .form-footer {
    padding: 1.3rem 2.2rem;
    background: var(--ivory);
    border-top: 1px solid var(--cream);
    display: flex;
    justify-content: flex-end;
    gap: 0.75rem;
    align-items: center;
  }

  .btn-cancel {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 22px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.88rem;
    font-weight: 600;
    text-decoration: none;
    border: 1.5px solid var(--slate);
    color: var(--slate);
    background: transparent;
    cursor: pointer;
    transition: all 0.22s ease;
  }

  .btn-cancel:hover {
    background: var(--slate);
    color: var(--white);
  }

  .btn-submit {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 28px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.88rem;
    font-weight: 700;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    transition: all 0.22s ease;
    letter-spacing: 0.3px;
  }

  .btn-submit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }

  /* ===========================
     AVATAR PREVIEW
  =========================== */
  .avatar-preview-wrap {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .avatar-preview {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid var(--gold);
    display: none;
  }

  .avatar-placeholder {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: var(--oxford);
    color: var(--gold);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.4rem;
    flex-shrink: 0;
  }

</style>

<body>

<div class="container-scroller">
  <div class="container-fluid page-body-wrapper">

    <div class="main-panel">
      <div class="content-wrapper">

        <!-- PAGE TITLE BLOCK -->
        <div class="page-header-block">
      
          <h3 class="page-title">User Registration</h3>
          <p class="page-subtitle">Add a new user to the platform</p>
          <div class="section-label">New User</div>
        </div>

        <!-- FORM CARD -->
        <div class="form-card">

          <!-- Card Header -->
          <div class="form-card-header">
            <div class="form-card-header-icon">👤</div>
            <div class="form-card-header-text">
              <h5>Create User Account</h5>
              <p>Fill in all required fields to register a new user</p>
            </div>
          </div>

          <!-- Card Body -->
          <div class="form-card-body">

            <form action="register" method="post" enctype="multipart/form-data" id="registerForm">

              <!-- PERSONAL INFO -->
              <div class="form-section">
                <div class="form-section-title">Personal Information</div>
                <div class="row">

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">First Name <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="firstName" class="form-control-custom" placeholder="Enter first name" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Last Name <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="lastName" class="form-control-custom" placeholder="Enter last name" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Birth Year <span style="color:var(--rose)">*</span></label>
                      <input type="number" name="birthYear" class="form-control-custom" min="1900" max="2100" placeholder="e.g. 2000" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Contact Number <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="contactNum" class="form-control-custom" placeholder="Enter contact number" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Qualification <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="qualification" class="form-control-custom" placeholder="e.g. B.Tech, MCA, BSc" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">User Type</label>
                      <select name="userTypeId" class="form-control-custom">
                        <option value="-1">— Select User Type —</option>
                        <c:forEach items="${allUserType}" var="ut">
                          <option value="${ut.userTypeId}">${ut.userType}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>

                  <!-- Gender -->
                  <div class="col-12">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Gender <span style="color:var(--rose)">*</span></label>
                      <div class="radio-group">
                        <label class="radio-option">
                          <input type="radio" name="gender" value="MALE" required> Male
                        </label>
                        <label class="radio-option">
                          <input type="radio" name="gender" value="FEMALE"> Female
                        </label>
                        <label class="radio-option">
                          <input type="radio" name="gender" value="OTHER"> Other
                        </label>
                      </div>
                    </div>
                  </div>

                </div>
              </div>

              <!-- ACCOUNT INFO -->
              <div class="form-section">
                <div class="form-section-title">Account Credentials</div>
                <div class="row">

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Email Address <span style="color:var(--rose)">*</span></label>
                      <input type="email" name="email" class="form-control-custom" placeholder="Enter email" required>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Password <span style="color:var(--rose)">*</span></label>
                      <input type="password" name="password" class="form-control-custom" placeholder="Set password" required>
                    </div>
                  </div>

                </div>
              </div>

              <!-- LOCATION -->
              <div class="form-section">
                <div class="form-section-title">Location</div>
                <div class="row">

                  <div class="col-md-4">
                    <div class="form-group-custom">
                      <label class="form-label-custom">City <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="city" class="form-control-custom" placeholder="City" required>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="form-group-custom">
                      <label class="form-label-custom">State <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="state" class="form-control-custom" placeholder="State" required>
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="form-group-custom">
                      <label class="form-label-custom">Country <span style="color:var(--rose)">*</span></label>
                      <input type="text" name="country" class="form-control-custom" value="India" required>
                    </div>
                  </div>

                </div>
              </div>

              <!-- PROFILE PICTURE -->
              <div class="form-section">
                <div class="form-section-title">Profile Picture</div>
                <div class="form-group-custom">
                  <label class="form-label-custom">Upload Photo</label>
                  <div class="avatar-preview-wrap">
                    <div class="avatar-placeholder" id="avatarPlaceholder">📷</div>
                    <img id="avatarPreview" class="avatar-preview" src="" alt="Preview">
                    <input type="file" name="profilePic" class="form-control-custom" accept="image/*" onchange="previewAvatar(this)" style="flex:1;">
                  </div>
                </div>
              </div>

            </form>

          </div>

          <!-- Footer Actions -->
          <div class="form-footer">
            <a href="listUser" class="btn-cancel">← Cancel</a>
            <button type="button" onclick="document.getElementById('registerForm').submit()" class="btn-submit">
              ✓ Save User
            </button>
          </div>

        </div>
        <!-- /form-card -->

      </div>

    </div>
  </div>
</div>

<script>
function previewAvatar(input) {
  var preview = document.getElementById('avatarPreview');
  var placeholder = document.getElementById('avatarPlaceholder');
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      preview.src = e.target.result;
      preview.style.display = 'block';
      placeholder.style.display = 'none';
    };
    reader.readAsDataURL(input.files[0]);
  }
}
</script>

</body>
</html>
