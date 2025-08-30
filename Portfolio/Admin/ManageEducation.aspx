<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEducation.aspx.cs" Inherits="Portfolio.Admin.ManageEducation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Education</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Manage Education</h2>
        <asp:GridView ID="gvEducation" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
            OnRowEditing="gvEducation_RowEditing" OnRowUpdating="gvEducation_RowUpdating"
            OnRowCancelingEdit="gvEducation_RowCancelingEdit" OnRowDeleting="gvEducation_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Degree" HeaderText="Degree" />
                <asp:BoundField DataField="Institution" HeaderText="Institution" />
                <asp:BoundField DataField="Year" HeaderText="Year" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
