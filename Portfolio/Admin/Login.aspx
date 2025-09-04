<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Portfolio.Admin.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
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
        .login-form-container {
            background: #fff;
            max-width: 350px;
            margin: 60px auto 40px auto;
            padding: 30px 40px 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            position: relative;
            z-index: 1;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }
        .login-form-container label,
        .login-form-container .aspNet-Label {
            display: block;
            margin-bottom: 6px;
            color: #444;
            font-weight: 500;
        }
        .login-form-container input[type="text"],
        .login-form-container input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
        }
        .login-form-container input[type="submit"],
        .login-form-container button,
        .login-form-container .aspNet-Button {
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
        .login-form-container input[type="submit"]:hover,
        .login-form-container button:hover,
        .login-form-container .aspNet-Button:hover {
            background: #005fa3;
        }
        .login-form-container .status-label {
            display: block;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-form-container">
        <form id="form1" runat="server">
            <h2>Admin Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="status-label" />
            <asp:Label Text="Username:" runat="server" CssClass="aspNet-Label" />
            <asp:TextBox ID="txtUsername" runat="server" />
            <asp:Label Text="Password:" runat="server" CssClass="aspNet-Label" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="aspNet-Button" OnClick="btnLogin_Click" />
        </form>
    </div>
</body>
</html>