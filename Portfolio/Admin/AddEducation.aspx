<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEducation.aspx.cs" Inherits="Portfolio.Admin.AddEducation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Education</title>
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

.education-form-container {
    background: #fff;
    max-width: 400px;
    margin: 40px auto;
    padding: 30px 40px 20px 40px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    position: relative;
    z-index: 1; /* ensures form is above background grid */
}

.education-form-container asp\:TextBox,
.education-form-container input[type="text"],
.education-form-container textarea {
    width: 100%;
    padding: 10px 12px;
    margin-bottom: 18px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 15px;
    box-sizing: border-box;
    background-color: #fff; /* fixes grid appearing inside */
    position: relative;
    z-index: 2;
}

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }
        .education-form-container asp\:TextBox,
        .education-form-container input[type="text"],
        .education-form-container textarea {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
        }
        .education-form-container asp\:Button,
        .education-form-container input[type="submit"] {
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
        .education-form-container asp\:Button:hover,
        .education-form-container input[type="submit"]:hover {
            background: #005fa3;
        }
    </style>
</head>
<body>
    <div class="education-form-container">
        <form id="form1" runat="server">
            <h2>Add Education</h2>
            <asp:TextBox ID="txtDegree" runat="server" Placeholder="Degree"></asp:TextBox><br />
            <asp:TextBox ID="txtInstitution" runat="server" Placeholder="Institution"></asp:TextBox><br />
            <asp:TextBox ID="txtYear" runat="server" Placeholder="Year"></asp:TextBox><br />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Description"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </form>
    </div>
</body>
</html>