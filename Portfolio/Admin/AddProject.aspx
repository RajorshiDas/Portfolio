<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="Portfolio.Admin.AddProject" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Project</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtTitle" runat="server" Placeholder="Title"></asp:TextBox><br />
        <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description"></asp:TextBox><br />
        <asp:FileUpload ID="fuImage" runat="server" /><br />
        <asp:TextBox ID="txtUrl" runat="server" Placeholder="Project URL"></asp:TextBox><br />
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" /><br />
        <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>