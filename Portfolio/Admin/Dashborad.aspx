<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashborad.aspx.cs" Inherits="Portfolio.Admin.Dashborad" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
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
        .dashboard-container {
            background: #fff;
            max-width: 420px;
            margin: 60px auto 40px auto;
            padding: 32px 40px 28px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            position: relative;
            z-index: 1;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 28px;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        ul li {
            margin-bottom: 16px;
            text-align: center;
        }
        ul li:last-child {
            margin-bottom: 0;
        }
        ul li a {
            display: inline-block;
            padding: 10px 28px;
            background: #0078d7;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
        }
        ul li a:hover {
            background: #005fa3;
            box-shadow: 0 2px 8px rgba(0,0,0,0.10);
        }
        .dashboard-container .aspNet-Button,
        .dashboard-container input[type="submit"],
        .dashboard-container button {
            width: 100%;
            background: #d9534f;
            color: #fff;
            border: none;
            padding: 12px 0;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 24px;
            transition: background 0.2s;
        }
        .dashboard-container .aspNet-Button:hover,
        .dashboard-container input[type="submit"]:hover,
        .dashboard-container button:hover {
            background: #b52a25;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <form id="form1" runat="server">
            <h2>Welcome to the Admin Dashboard</h2>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="aspNet-Button" OnClick="btnLogout_Click" />
            <ul>
                <li><a href="AddEducation.aspx">Add Education</a></li>
                <li><a href="ManageEducation.aspx">Manage Education</a></li>
                <li><a href="AddSkill.aspx">Add Skill</a></li>
                <li><a href="ManageSkills.aspx">Manage Skills</a></li>
                <li><a href="AddProject.aspx">Add Project</a></li>
                <li><a href="ManageProjects.aspx">Manage Projects</a></li>
                <li><a href="Messages.aspx">View Messages</a></li>
            </ul>
        </form>
    </div>
</body>
</html>