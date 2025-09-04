<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashborad.aspx.cs" Inherits="Portfolio.Admin.Dashborad" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
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
            max-width: 900px;
            margin: 60px auto 40px auto;
            padding: 36px 40px 32px 40px;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            position: relative;
            z-index: 1;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 32px;
            letter-spacing: 1px;
        }
        .dashboard-sections {
            display: flex;
            flex-wrap: wrap;
            gap: 32px;
            justify-content: center;
            margin-bottom: 32px;
        }
        .dashboard-card {
            background: #f8fbff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            padding: 32px 28px 24px 28px;
            min-width: 220px;
            max-width: 240px;
            flex: 1 1 220px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            transition: box-shadow 0.2s, transform 0.2s;
        }
        .dashboard-card:hover {
            box-shadow: 0 6px 24px rgba(0,120,215,0.10);
            transform: translateY(-2px) scale(1.02);
        }
        .dashboard-card h3 {
            margin: 0 0 10px 0;
            color: #0078d7;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .dashboard-card .count {
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin-bottom: 18px;
            margin-top: 2px;
        }
        .dashboard-card .manage-link {
            display: inline-block;
            margin-bottom: 14px;
            color: #333;
            background: #eaf3fb;
            padding: 7px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: background 0.2s, color 0.2s;
        }
        .dashboard-card .manage-link:hover {
            background: #0078d7;
            color: #fff;
        }
        .dashboard-card .add-btn {
            display: inline-block;
            background: #28a745;
            color: #fff;
            border: none;
            padding: 9px 28px;
            border-radius: 4px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
        }
        .dashboard-card .add-btn:hover {
            background: #218838;
        }
        .dashboard-container .aspNet-Button,
        .dashboard-container input[type="submit"],
        .dashboard-container button {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background: #d9534f;
            color: #fff;
            padding: 12px 0;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 32px;
            transition: background 0.2s;
        }
        .dashboard-container .aspNet-Button:hover,
        .dashboard-container input[type="submit"]:hover,
        .dashboard-container button:hover {
            background: #b52a25;
        }
        @media (max-width: 1000px) {
            .dashboard-sections {
                flex-direction: column;
                gap: 18px;
            }
            .dashboard-card {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <form id="form1" runat="server">
            <h2>Welcome to the Admin Dashboard</h2>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="aspNet-Button" OnClick="btnLogout_Click" Width="154px" />
            <div class="dashboard-sections">
                <div class="dashboard-card">
                    <h3>Education</h3>
                    <asp:Label ID="lblEducationCount" runat="server" CssClass="count" />
                    <a href="ManageEducation.aspx" class="manage-link">Manage</a>
                    <a href="AddEducation.aspx" class="add-btn">+ Add</a>
                </div>
                <div class="dashboard-card">
                    <h3>Skills</h3>
                    <asp:Label ID="lblSkillsCount" runat="server" CssClass="count" />
                    <a href="ManageSkills.aspx" class="manage-link">Manage</a>
                    <a href="AddSkill.aspx" class="add-btn">+ Add</a>
                </div>
                <div class="dashboard-card">
                    <h3>Projects</h3>
                    <asp:Label ID="lblProjectsCount" runat="server" CssClass="count" />
                    <a href="ManageProjects.aspx" class="manage-link">Manage</a>
                    <a href="AddProject.aspx" class="add-btn">+ Add</a>
                </div>
                <div class="dashboard-card">
                    <h3>Messages</h3>
                    <asp:Label ID="lblMessagesCount" runat="server" CssClass="count" />
                    <a href="Messages.aspx" class="manage-link" style="background:#0078d7;color:#fff;">View</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>