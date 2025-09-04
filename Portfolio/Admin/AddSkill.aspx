<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSkill.aspx.cs" Inherits="Portfolio.Admin.AddSkill" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Skill</title>
    <style>
           body {
    font-family: Arial, sans-serif;
    /* Gradient background with a subtle pattern overlay */
    background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
    min-height: 100vh;
    margin: 0;
    padding: 0;
    position: relative;
}
     body::before {
         content: "";
         position: fixed;
         top: 0; left: 0; right: 0; bottom: 0;
         pointer-events: none;
         opacity: 0.15;
         z-index: -1;
         background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="19" width="2" height="40" fill="%2399badd"/><rect y="19" width="40" height="2" fill="%2399badd"/></svg>');
     }
        .skill-form-container {
            background: #fff;
            max-width: 400px;
            margin: 40px auto;
            padding: 30px 40px 20px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }
        .skill-form-container label,
        .skill-form-container .aspNet-Label {
            display: block;
            margin-bottom: 6px;
            color: #444;
            font-weight: 500;
        }
        .skill-form-container input[type="text"],
        .skill-form-container select,
        .skill-form-container .aspNet-TextBox,
        .skill-form-container .aspNet-DropDownList {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
        }
        .skill-form-container input[type="submit"],
        .skill-form-container button,
        .skill-form-container .aspNet-Button {
            width: 100%;
            background: #0078d7;
            color: #fff;
            border: none;
            padding: 12px 0;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .skill-form-container input[type="submit"]:hover,
        .skill-form-container button:hover,
        .skill-form-container .aspNet-Button:hover {
            background: #005fa3;
        }
        .skill-form-container .status-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="skill-form-container">
        <h2>Add Skill</h2>
        <form id="form1" runat="server">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="status-label" />
            <asp:Panel runat="server">
                <asp:Label Text="Category:" AssociatedControlID="ddlCategory" runat="server" CssClass="aspNet-Label" />
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="aspNet-DropDownList">
                    <asp:ListItem>Backend</asp:ListItem>
                    <asp:ListItem>Frontend</asp:ListItem>
                    <asp:ListItem>Tools</asp:ListItem>
                    <asp:ListItem>Languages</asp:ListItem>
                    <asp:ListItem>Databases</asp:ListItem>
                    <asp:ListItem>App Development</asp:ListItem>

                </asp:DropDownList>
                <asp:Label Text="Skill Name:" AssociatedControlID="txtName" runat="server" CssClass="aspNet-Label" />
                <asp:TextBox ID="txtName" runat="server" CssClass="aspNet-TextBox" />
                <asp:Label Text="Level (0-100):" AssociatedControlID="txtLevel" runat="server" CssClass="aspNet-Label" />
                <asp:TextBox ID="txtLevel" runat="server" CssClass="aspNet-TextBox" />
                <asp:Button ID="btnAdd" runat="server" Text="Add Skill" CssClass="aspNet-Button" OnClick="btnAdd_Click" />
            </asp:Panel>
        </form>
    </div>
</body>
</html>