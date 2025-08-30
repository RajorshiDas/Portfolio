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
                    <a href="#" class="social-link">LinkedIn</a>
                    <a href="#" class="social-link">GitHub</a>
                    <a href="#" class="social-link">Twitter</a>
                </div>
            </div>
            
            <div class="contact-form">
                <h2>Send Me a Message</h2>
                <asp:Panel ID="contactFormPanel" runat="server">
                    <div class="form-field">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" placeholder="Your name" required />
                    </div>
                    <div class="form-field">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="you@example.com" required />
                    </div>
                    <div class="form-field">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="5" placeholder="How can I help?" required></textarea>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn">Send</button>
                    </div>
                    <div id="contactStatus" aria-live="polite"></div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>