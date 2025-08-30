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
        <div class="education-container">
    <h1>Education & Certifications</h1>
    <asp:Repeater ID="rptEducation" runat="server">
        <ItemTemplate>
            <div class="education-item">
                <h2><%# Eval("Degree") %></h2>
                <h3><%# Eval("Institution") %> | <%# Eval("Year") %></h3>
                <p><%# Eval("Description") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

            <h2 id="contact">Contact Me</h2>
    <asp:Panel ID="pnlContact" runat="server" CssClass="contact-form">
    <asp:TextBox ID="txtName" runat="server" Placeholder="Your Name"></asp:TextBox><br />
    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Your Email"></asp:TextBox><br />
    <asp:TextBox ID="txtSubject" runat="server" Placeholder="Subject"></asp:TextBox><br />
    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Your Message"></asp:TextBox><br />
    <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" CssClass="btn" /><br />
    <asp:Label ID="lblContactStatus" runat="server" ForeColor="Green"></asp:Label>
    </asp:Panel>

      
    </div>
</asp:Content>