<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Contact.aspx.cs" Inherits="Portfolio.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-container">
        <h1>Get In Touch</h1>
        <div class="contact-content">
            <div class="contact-info">
                <h2>Contact Information</h2>
                <p><strong>Email:</strong> john.doe@example.com</p>
                <p><strong>Phone:</strong> (123) 456-7890</p>
                <p><strong>Location:</strong> New York, NY</p>
                <div class="social-links">
                  <a href="#" class="social-link" title="LinkedIn">
    <i class="bi bi-linkedin"></i> LinkedIn
</a>
<a href="#" class="social-link" title="GitHub">
    <i class="bi bi-github"></i> GitHub
</a>
<a href="#" class="social-link" title="Twitter">
    <i class="bi bi-twitter"></i> Twitter
</a> 
                </div>
            </div>
            <div class="contact-form">
                <h2>Send Me a Message</h2>
                <asp:Panel ID="pnlContact" runat="server" CssClass="contact-form">
                    <asp:TextBox ID="txtName" runat="server" CssClass="aspNet-TextBox" Placeholder="Your Name"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="aspNet-TextBox" Placeholder="Your Email"></asp:TextBox>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="aspNet-TextBox" Placeholder="Subject"></asp:TextBox>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="aspNet-TextBox" TextMode="MultiLine" Rows="5" Placeholder="Your Message"></asp:TextBox>
                    <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" CssClass="btn aspNet-Button" />
                    <asp:Label ID="lblContactStatus" runat="server" CssClass="aspNet-Label" ForeColor="Green"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>