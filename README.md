
# Portfolio Website

A personal portfolio web application built with ASP.NET Web Forms (.NET Framework 4.7.2).  
Features include admin authentication, dashboard, skills/projects management, and a contact form.

## Features

- Responsive design with modern UI
- Admin login and dashboard
- Add, edit, and delete skills, projects, and education
- Contact form with email support
- Dark mode toggle

## Prerequisites

- Windows OS
- Visual Studio 2019 or 2022
- .NET Framework 4.7.2
- SQL Server (Express or full)
- Git

## Getting Started

### 1. Clone the Repository
 

2. **Open the solution in Visual Studio**
- Open `Portfolio.sln` in Visual Studio 2019 or 2022.

3. **Configure the database**
- Make sure SQL Server is installed and running.
- Update the connection string in `Portfolio/Web.config` to match your SQL Server instance.
- Create the database and tables as required (see any provided SQL scripts).

4. **Build and run**
- Build the solution in Visual Studio.
- Press `F5` to run the project.

5. **Login**
- Go to `/Admin/Login.aspx`
- Use the default credentials:
  - Username: `admin`
  - Password: `password`

6. **Start using the dashboard**
- Add, edit, or delete skills, projects, and education.
- Use the contact form to test messaging.

---

**Note:**  
- You may need to restore NuGet packages if prompted.
- For any issues, check your connection string and database setup.
