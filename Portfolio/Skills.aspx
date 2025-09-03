<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="skills-container">
        <h1>My Skills</h1>
        <p class="skills-intro">Here's an overview of my technical skills.</p>
        <asp:Repeater ID="rptCategories" runat="server" OnItemDataBound="rptCategories_ItemDataBound">
            <ItemTemplate>
                <div class="category">
                    <h3><%# Eval("Category") %></h3>
                    <asp:Repeater ID="rptSkills" runat="server">
                        <ItemTemplate>
                            <div class="skill">
                                <span><%# Eval("Name") %></span>
                                <div class="bar">
                                    <div class="bar-fill" style='<%# "width:" + Eval("Level") + "%;" %>'>
                                        <%# Eval("Level") %>%
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>