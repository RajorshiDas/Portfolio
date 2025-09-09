<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="projects-container page-transition active">
        <h1>My Projects</h1>
        <div class="projects-grid">
            
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