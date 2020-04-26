<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="PMCDB.Admin.LoginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item mauxanh" style="text-align: center;">
            Admin
        </div>
        <div class="list-group-item">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12" 
                        Width="100%" TitleText="" RememberMeSet="True" 
                        PasswordLabelText="Password:" LoginButtonText="Login" RememberMeText="Remember me." UserNameLabelText="User:" 
                        OnAuthenticate="Login1_Authenticate1">
                        <LoginButtonStyle CssClass="btn mauxanh"/>    
                        <TextBoxStyle CssClass="form-control input-sm" />
                    </asp:Login>
                </div>
            </div>
        </div>      
    </div>
</asp:Content>