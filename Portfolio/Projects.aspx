<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="projects-container page-transition active">
           <h1>My Projects</h1>

        <div class="projects-grid">

            <h2>My Projects</h2>
    <asp:Repeater ID="rptProjects" runat="server">
    <ItemTemplate>
        <div class="project-card">
            <h3><%# Eval("Title") %></h3>
            <p><%# Eval("Description") %></p>
            <asp:Image ID="imgProject" runat="server" ImageUrl='<%# Eval("Image") %>' Width="200px" />
            <asp:HyperLink ID="lnkGitHub" runat="server"
                NavigateUrl='<%# Eval("Url") %>'
                Text="🔗 View on GitHub"
                CssClass="btn btn-primary"
                Target="_blank" />
        </div>
    </ItemTemplate>
</asp:Repeater>
            <div class="project-card reveal">
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

            <div class="project-card reveal">
                <img src="Images/project2.jpg" alt="Portfolio Website" />
                <div class="project-info">
                    <h3>Developer Portfolio</h3>
                    <p>Responsive portfolio with dark theme, smooth animations, and modular sections built on WebForms.</p>
                    <div class="project-tech">
                        <span>HTML</span>
                        <span>CSS</span>
                        <span>JavaScript</span>
                    </div>
                    <a href="#" class="project-link">View Project</a>
                </div>
            </div>

            <div class="project-card reveal">
                <img src="Images/project3.jpg" alt="Task Manager" />
                <div class="project-info">
                    <h3>Task Manager</h3>
                    <p>CRUD app for tasks with categories, due dates, and filtering. Emphasis on clean UI and UX.</p>
                    <div class="project-tech">
                        <span>ASP.NET</span>
                        <span>C#</span>
                        <span>Bootstrap</span>
                    </div>
                    <a href="#" class="project-link">View Project</a>
                </div>
            </div>

            <div class="project-card reveal">
                <img src="Images/project4.jpg" alt="API Client" />
                <div class="project-info">
                    <h3>Weather API Client</h3>
                    <p>Simple client consuming a public API with caching and error handling, rendered in a minimal UI.</p>
                    <div class="project-tech">
                        <span>JavaScript</span>
                        <span>REST</span>
                        <span>JSON</span>
                    </div>
                    <a href="#" class="project-link">View Project</a>
                </div>

    
            </div>
         </div>
    </div>
</asp:Content>
