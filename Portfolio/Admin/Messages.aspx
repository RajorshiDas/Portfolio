<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Portfolio.Admin.Messages" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Messages</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" DataKeyNames="Id">
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
        <asp:Label ID="lblMsgStatus" runat="server" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>