<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSkills.aspx.cs" Inherits="Portfolio.Admin.ManageSkills" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Skills</title>
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
            z-index: 0;
            background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="19" width="2" height="40" fill="%2399badd"/><rect y="19" width="40" height="2" fill="%2399badd"/></svg>');
        }
        .skills-container {
            background: #fff;
            max-width: 800px;
            margin: 60px auto 40px auto;
            padding: 30px 40px 20px 40px;
            border-radius: 14px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            position: relative;
            z-index: 1;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }
        .skills-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .skills-grid th, .skills-grid td {
            border: 1px solid #ddd;
            padding: 10px 12px;
            text-align: left;
        }
        .skills-grid th {
            background: #0078d7;
            color: #fff;
        }
        .skills-grid tr:nth-child(even) {
            background: #f2f2f2;
        }
        .skills-grid tr:hover {
            background: #e6f0fa;
        }
        .skills-grid button,
        .skills-grid input[type="submit"],
        .skills-grid input[type="button"] {
            background: #0078d7;
            color: #fff;
            border: none;
            padding: 6px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 6px;
            transition: background 0.2s;
        }
        .skills-grid button:last-child,
        .skills-grid input[type="submit"]:last-child,
        .skills-grid input[type="button"]:last-child {
            margin-right: 0;
        }
        .skills-grid button:hover,
        .skills-grid input[type="submit"]:hover,
        .skills-grid input[type="button"]:hover {
            background: #005fa3;
        }
        .skills-grid button[commandname="Delete"],
        .skills-grid input[type="submit"][value="Delete"],
        .skills-grid input[type="button"][value="Delete"] {
            background: #d9534f;
        }
        .skills-grid button[commandname="Delete"]:hover,
        .skills-grid input[type="submit"][value="Delete"]:hover,
        .skills-grid input[type="button"][value="Delete"]:hover {
            background: #b52a25;
        }
        .status-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="skills-container">
        <h2>Manage Skills</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvSkills" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="skills-grid"
                OnRowEditing="gvSkills_RowEditing"
                OnRowCancelingEdit="gvSkills_RowCancelingEdit"
                OnRowUpdating="gvSkills_RowUpdating"
                OnRowDeleting="gvSkills_RowDeleting"
                OnRowDataBound="gvSkills_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <%# Eval("Category") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditCategory" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Skill Name" />
                    <asp:BoundField DataField="Level" HeaderText="Level" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="status-label" />
        </form>
    </div>
</body>
</html>