<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSkills.aspx.cs" Inherits="Portfolio.Admin.ManageSkills" %>
<h2>Manage Skills</h2>
<asp:GridView ID="gvSkills" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowEditing="gvSkills_RowEditing"
    OnRowCancelingEdit="gvSkills_RowCancelingEdit" OnRowUpdating="gvSkills_RowUpdating" OnRowDeleting="gvSkills_RowDeleting">
    <Columns>
        <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" />
        <asp:BoundField DataField="Name" HeaderText="Skill Name" />
        <asp:BoundField DataField="Level" HeaderText="Level" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
<asp:Label ID="lblMessage" runat="server" ForeColor="Red" />