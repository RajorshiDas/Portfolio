# 📂 Portfolio Website

A personal portfolio web application built with **ASP.NET Web Forms (.NET Framework 4.7.2)**.  
It includes a responsive UI, admin dashboard, skills/projects/education management, and a contact form with email support.

---

## 🚀 Features
- Responsive design with modern UI
- Dark mode toggle
- Admin authentication & dashboard
- Add, edit, and delete:
  - Skills
  - Projects
  - Education
- Contact form with email functionality

---

## 🛠️ Prerequisites
Before running this project, make sure you have:
- Windows OS
- Visual Studio 2019 or 2022
- .NET Framework 4.7.2
- SQL Server (Express or full)
- Git

---

## ⚡ Getting Started

### 1. Clone the Repository
```bash
https://github.com/RajorshiDas/Portfolio.git
```

### 2. 
Open the solution in Visual Studio
Open Portfolio.sln in Visual Studio.
Open Portfolio.sln in Visual Studio 2019 or 2022.

### 3. Configure the Databas

Ensure SQL Server is installed and running.
Update the connection string in:
```
Portfolio/Web.config
```
Run the SQL scripts (if provided) to create and seed the database.
Create the database and tables as required (see any provided SQL scripts).

### 4. Build and Run
Build the solution in Visual Studio.
Press F5 to run the application.
Press F5 to run the project.

### 5. Admin Login
Default admin credentials:
```bash
Username: admin
Password: password
```
### 6. Usage
Access the dashboard via /Admin/Login.aspx after logging in.
Manage skills, projects, and education from the dashboard.
Visitors can view your portfolio and contact you via the contact form.
### 7.Customization
Update profile, skills, and projects via the admin dashboard.
Modify styles in:
```bash
Portfolio/Content/Site.css
```
Add or update images/icons in:
```bash
Portfolio/Content/skill-icons/
Portfolio/Content/images/
```



