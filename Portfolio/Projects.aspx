<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="projects-container">
           <h1>My Projects</h1>
        
        <div class="projects-grid">
            <div class="project-card">
                <img src="Images/project1.jpg" alt="E-Commerce Website" />
                <div class="project-info">
                    <h3>E-Commerce Platform</h3>
                    <p>ASP.NET WebForms e-commerce site with product management, shopping cart, and payment integration.</p>
                    <div class="project-tech">
                        <span>ASP.NET</span>
                        <span>C#</span>
                        <span>SQL Server</span>
                    </div>
                    <a href="#" class="project-link">View Project</a>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
