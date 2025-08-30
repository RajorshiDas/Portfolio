<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProjects.aspx.cs" Inherits="Portfolio.Admin.ManageProjects" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Projects</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView 
            ID="gvProjects" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="Id" 
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


                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
        
        <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>
