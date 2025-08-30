<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Education.aspx.cs" Inherits="Portfolio.Education" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
</asp:Content>
