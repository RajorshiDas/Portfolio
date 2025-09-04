<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEducation.aspx.cs" Inherits="Portfolio.Admin.ManageEducation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Education</title>
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
    z-index: -1;
    background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="19" width="2" height="40" fill="%2399badd"/><rect y="19" width="40" height="2" fill="%2399badd"/></svg>');
}
        .education-container {
            background: #fff;
            max-width: 900px;
            margin: 40px auto;
            padding: 30px 40px 20px 40px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
             z-index: 1; /* keeps content above grid */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }
        .education-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .education-grid th, .education-grid td {
            border: 1px solid #ddd;
            padding: 10px 12px;
            text-align: left;
        }
        .education-grid th {
            background: #0078d7;
            color: #fff;
        }
        .education-grid tr:nth-child(even) {
            background: #f2f2f2;
        }
        .education-grid tr:hover {
            background: #e6f0fa;
        }
        /* Button styling for GridView action buttons */
        .education-grid button,
        .education-grid input[type="submit"],
        .education-grid input[type="button"] {
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
        .education-grid button:last-child,
        .education-grid input[type="submit"]:last-child,
        .education-grid input[type="button"]:last-child {
            margin-right: 0;
        }
        .education-grid button:hover,
        .education-grid input[type="submit"]:hover,
        .education-grid input[type="button"]:hover {
            background: #005fa3;
        }
        /* Optional: Different color for Delete button */
        .education-grid button[commandname="Delete"],
        .education-grid input[type="submit"][value="Delete"],
        .education-grid input[type="button"][value="Delete"] {
            background: #d9534f;
        }
        .education-grid button[commandname="Delete"]:hover,
        .education-grid input[type="submit"][value="Delete"]:hover,
        .education-grid input[type="button"][value="Delete"]:hover {
            background: #b52a25;
        }
    </style>
</head>
<body>
    <div class="education-container">
        <h2>Manage Education</h2>
        <form id="form1" runat="server">
            <asp:GridView ID="gvEducation" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="education-grid"
                OnRowEditing="gvEducation_RowEditing" OnRowUpdating="gvEducation_RowUpdating"
                OnRowCancelingEdit="gvEducation_RowCancelingEdit" OnRowDeleting="gvEducation_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Degree" HeaderText="Degree" />
                    <asp:BoundField DataField="Institution" HeaderText="Institution" />
                    <asp:BoundField DataField="Year" HeaderText="Year" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Actions" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>