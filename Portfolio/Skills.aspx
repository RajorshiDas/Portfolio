<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="skills-container">
            <h1>My Skills</h1>
            <p class="skills-intro">Here's an overview of my technical skills.</p>

            <div class="skills-grid">
                <div class="skill-card reveal">
                    <h3>Backend</h3>
                    <div class="form-field">
                        <label>C# / .NET</label>
                        <div class="progress"><div class="progress-bar" data-level="90"></div></div>
                    </div>
                    <div class="form-field">
                        <label>ASP.NET WebForms</label>
                        <div class="progress"><div class="progress-bar" data-level="85"></div></div>
                    </div>
                    <div class="form-field">
                        <label>SQL Server</label>
                        <div class="progress"><div class="progress-bar" data-level="80"></div></div>
                    </div>
                </div>

                <div class="skill-card reveal">
                    <h3>Frontend</h3>
                    <div class="form-field">
                        <label>HTML</label>
                        <div class="progress"><div class="progress-bar" data-level="90"></div></div>
                    </div>
                    <div class="form-field">
                        <label>CSS</label>
                        <div class="progress"><div class="progress-bar" data-level="85"></div></div>
                    </div>
                    <div class="form-field">
                        <label>JavaScript</label>
                        <div class="progress"><div class="progress-bar" data-level="80"></div></div>
                    </div>
                </div>

                <div class="skill-card reveal">
                    <h3>Tools & Others</h3>
                    <div class="form-field">
                        <label>Git</label>
                        <div class="progress"><div class="progress-bar" data-level="80"></div></div>
                    </div>
                    <div class="form-field">
                        <label>REST APIs</label>
                        <div class="progress"><div class="progress-bar" data-level="75"></div></div>
                    </div>
                    <div class="form-field">
                        <label>Problem Solving</label>
                        <div class="progress"><div class="progress-bar" data-level="85"></div></div>
                    </div>
                </div>
            </div>

            </div>

    </asp:Content>
