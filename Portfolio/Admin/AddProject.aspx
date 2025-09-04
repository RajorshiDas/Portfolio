<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="Portfolio.Admin.AddProject" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Project</title>
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
        .project-form-container {
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
        .project-form-container label {
            display: block;
            margin-bottom: 6px;
            color: #444;
            font-weight: 500;
        }
        .project-form-container input[type="text"],
        .project-form-container input[type="file"],
        .project-form-container textarea {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            box-sizing: border-box;
        }
        .project-form-container input[type="submit"],
        .project-form-container button,
        .project-form-container .aspNet-Button {
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
        .project-form-container input[type="submit"]:hover,
        .project-form-container button:hover,
        .project-form-container .aspNet-Button:hover {
            background: #005fa3;
        }
        .project-form-container .status-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="project-form-container">
        <form id="form1" runat="server">
            <h2>Add Project</h2>
            <label>Title</label>
            <asp:TextBox ID="txtTitle" runat="server" Placeholder="Title"></asp:TextBox><br />
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description"></asp:TextBox><br />
            <label>Project Image</label>
            <asp:FileUpload ID="fuImage" runat="server" /><br />
            <label>Project URL</label>
            <asp:TextBox ID="txtUrl" runat="server" Placeholder="Project URL"></asp:TextBox><br />
            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="aspNet-Button" OnClick="btnAdd_Click" /><br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green" CssClass="status-label"></asp:Label>
        </form>
    </div>
</body>
</html>