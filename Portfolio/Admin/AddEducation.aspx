<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEducation.aspx.cs" Inherits="Portfolio.Admin.AddEducation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Education</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add Education</h2>
        <asp:TextBox ID="txtDegree" runat="server" Placeholder="Degree"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtInstitution" runat="server" Placeholder="Institution"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtYear" runat="server" Placeholder="Year"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Description"></asp:TextBox><br /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </form>
</body>
</html>
