# 🚀 CodeVerse — Hackathon Management Platform

A production-ready full-stack hackathon management system built using **Spring Boot + Hibernate**, designed to handle end-to-end hackathon workflows with a clean UI and scalable backend architecture.

---

## ⚡ Tech Stack

**Backend:** Spring Boot, Hibernate (JPA), REST APIs  
**Frontend:** JSP / HTML / CSS / Bootstrap  
**Database:** MySQL  
**Tools:** Maven, JDBC Template  

---

## 📁 CodeVerse Project Structure

```bash
codeverse/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── grownited/
│       │           ├── controller/        ← Request handling (Admin, User, Hackathon)
│       │           ├── entity/            ← Database entities
│       │           ├── filter/            ← Security & auth filters
│       │           ├── repository/        ← JPA/Hibernate repositories
│       │           ├── service/           ← Business logic layer
│       │           ├── CodeVerseApplication.java
│       │           └── ServletInitializer.java
│       │
│       ├── resources/
│       │   ├── static/                   ← CSS, JS, images
│       │   ├── templates/                ← Template files (if used)
│       │   ├── application.properties
│       │   ├── application.properties_local
│       │   └── application.properties_prod
│       │
│       └── webapp/
│           └── WEB-INF/
│               └── views/
│                   ├── admin/
│                   │   ├── AdminDashboard.jsp
│                   │   ├── AdminHeader.jsp
│                   │   ├── AdminFooter.jsp
│                   │   └── AdminSidebar.js
│                   │
│                   ├── hackathon/
│                   │   ├── NewHackathon.jsp
│                   │   ├── EditHackathon.jsp
│                   │   ├── ListHackathon.jsp
│                   │   ├── HackathonDescription.jsp
│                   │   └── HackathonPrize.jsp
│                   │
│                   ├── category/
│                   │   ├── NewCategory.jsp
│                   │   ├── EditCategory.jsp
│                   │   └── ListCategory.jsp
│                   │
│                   ├── judge/
│                   │   ├── NewJudge.jsp
│                   │   └── ListJudge.jsp
│                   │
│                   ├── user/
│                   │   ├── Login.jsp
│                   │   ├── Register.jsp
│                   │   ├── ForgotPassword.jsp
│                   │   └── UserList.jsp
│                   │
│                   └── common/
│                       ├── Header.jsp
│                       ├── Footer.jsp
│                       └── Sidebar.jsp
│
└── pom.xml                             ← Maven dependencies
```

---

## 🎯 Features

### Public
- View all hackathons with details  
- Explore themes, deadlines, and prizes  
- Register/login system  

### Participant
- Register for hackathons  
- Create or join teams  
- Submit project details  
- Track submission status  

### Organizer
- Create and manage hackathons  
- Define rules, deadlines, and prizes  
- View registered participants and teams  
- Manage submissions  

### Admin
- Manage all users and roles  
- Approve/reject hackathons  
- Monitor platform activity  
- Maintain system integrity  

---

## 🔒 Security Features

- Role-based access control (Admin, Organizer, Participant)  
- Secure authentication system  
- Input validation and error handling  
- Session management  

---

## 🗄 Database Design

- **User** → Stores user details and roles  
- **Hackathon** → Hackathon information  
- **Team** → Team creation and members  
- **Submission** → Project submissions  

---

## 📌 About

CodeVerse is designed as a complete hackathon ecosystem — from user registration to final project submission.  
It focuses on structured backend architecture, clean UI, and real-world scalability.

---

## 📄 License

MIT

---

Built with ❤️ using Spring Boot + Hibernate
