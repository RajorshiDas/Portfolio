<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Portfolio.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="hero-section">
        <div class="hero-content">
            <h1>
                <div>Hello! I'm Rajorshi Das</div>
                <span>I'm </span>  <span class="typed-text"> </span><span class="cursor"></span>
            </h1>
            <p class="subtext">Welcome to my portfolio. Get to know more about me</p>
            <a href="#projects" class="btn">View Projects</a>
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
        </div>
    </div>
</asp:Content>