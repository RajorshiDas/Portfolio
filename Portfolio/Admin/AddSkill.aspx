<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSkill.aspx.cs" Inherits="Portfolio.Admin.AddSkill" %>
<h2>Add Skill</h2>
<form id="form1" runat="server">
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    <asp:Panel runat="server">
        <asp:Label Text="Category:" AssociatedControlID="ddlCategory" runat="server" />
        <asp:DropDownList ID="ddlCategory" runat="server">
            <asp:ListItem>Backend</asp:ListItem>
            <asp:ListItem>Frontend</asp:ListItem>
            <asp:ListItem>Tools</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label Text="Skill Name:" AssociatedControlID="txtName" runat="server" />
        <asp:TextBox ID="txtName" runat="server" />
        <br />
        <asp:Label Text="Level (0-100):" AssociatedControlID="txtLevel" runat="server" />
        <asp:TextBox ID="txtLevel" runat="server" />
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Skill" OnClick="btnAdd_Click" />
    </asp:Panel>
</form>