<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="About.aspx.cs" Inherits="Portfolio.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="about-container page-transition active">
                <h1>About Me</h1>

                <div class="about-grid">
                    <div class="about-content reveal">
                        <p>Hello! I’m <strong>Rajorshi</strong>, a passionate developer focused on building clean, performant web and app experiences. I love solving problems, learning new technologies, and crafting thoughtful UIs.</p>
                        <ul class="about-highlights">
                            <li>✔ Strong in C#, ASP.NET, and SQL Server</li>
                            <li>✔ Comfortable with HTML, CSS, JavaScript</li>
                            <li>✔ Interest in app development and design systems</li>
                        </ul>
                        <div class="about-cta">
                            <a class="btn" href="Projects.aspx">See my work</a>
                            <a class="btn" href="Contact.aspx">Contact me</a>
                        </div>
                    </div>

                    <div class="about-image reveal">
                        <img src="Images/about.jpg" alt="About Me" />
                    </div>
                </div>
       </div>


    </asp:Content>