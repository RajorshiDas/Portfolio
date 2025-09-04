<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProjects.aspx.cs" Inherits="Portfolio.Admin.ManageProjects" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Projects</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e0eafc 0%, #cfdef3 100%);
            min-height: 100vh;
            margin: 0;
            padding: 0;
            position: relative;
        }

        /* Subtle grid pattern in background only */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            pointer-events: none;
            opacity: 0.15;
            z-index: 0;
            background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="19" width="2" height="40" fill="%2399badd"/><rect y="19" width="40" height="2" fill="%2399badd"/></svg>');
        }

        .projects-container {
            background: #fff;
            max-width: 1000px;
            margin: 40px auto;
            padding: 30px 40px 20px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            position: relative;
            z-index: 1; /* keeps content above grid */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }

        .projects-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff; /* ensures grid doesn’t show inside cells */
        }

        .projects-grid th, .projects-grid td {
            border: 1px solid #ddd;
            padding: 10px 12px;
            text-align: left;
            vertical-align: middle;
            background-color: #fff; /* fixes grid showing inside table */
        }

        .projects-grid th {
            background: #0078d7;
            color: #fff;
        }

        .projects-grid tr:nth-child(even) {
            background: #f9f9f9;
        }

        .projects-grid tr:hover {
            background: #e6f0fa;
        }

        .projects-grid img {
            border-radius: 4px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.10);
        }

        /* Button styling */
        .projects-grid button,
        .projects-grid input[type="submit"],
        .projects-grid input[type="button"] {
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

        .projects-grid button:hover,
        .projects-grid input[type="submit"]:hover,
        .projects-grid input[type="button"]:hover {
            background: #005fa3;
        }

        /* Delete button */
        .projects-grid input[type="submit"][value="Delete"] {
            background: #d9534f;
        }
        .projects-grid input[type="submit"][value="Delete"]:hover {
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
    <div class="projects-container">
        <h2>Manage Projects</h2>
        <form id="form1" runat="server">
            <asp:GridView 
                ID="gvProjects" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                CssClass="projects-grid"
                OnRowEditing="gvProjects_RowEditing"
                OnRowUpdating="gvProjects_RowUpdating"
                OnRowCancelingEdit="gvProjects_RowCancelingEdit"
                OnRowDeleting="gvProjects_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Url" HeaderText="URL" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgProject" runat="server" ImageUrl='<%# Eval("Image") %>' Width="100" Height="70" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuEditImage" runat="server" />
                            <br />
                            <asp:Image ID="imgEditPreview" runat="server" ImageUrl='<%# Eval("Image") %>' Width="100" Height="70" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green" CssClass="status-label"></asp:Label>
        </form>
    </div>
</body>
</html>
