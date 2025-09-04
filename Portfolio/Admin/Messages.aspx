<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Portfolio.Admin.Messages" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Messages</title>
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
    z-index: -1;
    background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="19" width="2" height="40" fill="%2399badd"/><rect y="19" width="40" height="2" fill="%2399badd"/></svg>');
}

        .messages-container {
            background: #fff;
            max-width: 1000px;
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
        .messages-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .messages-grid th, .messages-grid td {
            border: 1px solid #ddd;
            padding: 10px 12px;
            text-align: left;
            vertical-align: top;
        }
        .messages-grid th {
            background: #0078d7;
            color: #fff;
        }
        .messages-grid tr:nth-child(even) {
            background: #f2f2f2;
        }
        .messages-grid tr:hover {
            background: #e6f0fa;
        }
        .messages-grid input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #0078d7;
            cursor: pointer;
        }
        .status-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: #0078d7;
        }
        .action-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
    gap: 12px;
}
.return-btn {
    border-style: none;
    background: #0078d7;
    color: #fff;
    padding: 9px 28px;
    border-radius: 4px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
    box-shadow: 0 1px 4px rgba(0,0,0,0.08);
    letter-spacing: 0.5px;
    line-height: 21px;
}
.return-btn:hover {
    background: #005fa3;
    box-shadow: 0 4px 12px rgba(0,120,215,0.15);
    text-decoration: none;
}
    </style>
</head>
<body>
    <div class="messages-container">
        <h2>Manage Messages</h2>
        <form id="form1" runat="server">
            <div class="action-bar">
    <asp:Button ID="btnReturnDashboard" runat="server" Text="← Return to Dashboard" CssClass="return-btn" OnClick="btnReturnDashboard_Click" />
</div>
            <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                CssClass="messages-grid">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    <asp:BoundField DataField="Message" HeaderText="Message" />
                    <asp:TemplateField HeaderText="Read?">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsRead" runat="server"
                                Checked='<%# Convert.ToBoolean(Eval("IsRead")) %>'
                                AutoPostBack="true"
                                OnCheckedChanged="chkIsRead_CheckedChanged"
                                CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMsgStatus" runat="server" ForeColor="Green" CssClass="status-label"></asp:Label>
        </form>
    </div>
</body>
</html>