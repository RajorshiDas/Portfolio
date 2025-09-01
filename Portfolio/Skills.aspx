<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="skills-container">
        <h1>My Skills</h1>
        <p class="skills-intro">Here's an overview of my technical skills.</p>

        <div class="skills-grid">
            <div class="skill-card reveal">
                <h3>Backend</h3>
                <asp:Repeater ID="rptBackend" runat="server">
                    <ItemTemplate>
                        <div class="form-field">
                            <label><%# Eval("Name") %></label>
                            <div class="progress">
                                <div class="progress-bar" data-level='<%# Eval("Level") %>'></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="skill-card reveal">
                <h3>Frontend</h3>
                <asp:Repeater ID="rptFrontend" runat="server">
                    <ItemTemplate>
                        <div class="form-field">
                            <label><%# Eval("Name") %></label>
                            <div class="progress">
                                <div class="progress-bar" data-level='<%# Eval("Level") %>'></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="skill-card reveal">
                <h3>Tools & Others</h3>
                <asp:Repeater ID="rptTools" runat="server">
                    <ItemTemplate>
                        <div class="form-field">
                            <label><%# Eval("Name") %></label>
                            <div class="progress">
                                <div class="progress-bar" data-level='<%# Eval("Level") %>'></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>