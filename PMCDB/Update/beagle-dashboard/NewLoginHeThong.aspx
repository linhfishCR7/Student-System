<%@ Page Title="" Language="C#" MasterPageFile="~/NewLogin.Master" AutoEventWireup="true" CodeBehind="NewLoginHeThong.aspx.cs" Inherits="PMCDB.Update.beagle_dashboard.NewLoginHeThong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12"
        Width="100%" TitleText="" RememberMeSet="True"
        PasswordLabelText="Password:" LoginButtonText="Login" RememberMeText="Remember me."
        UserNameLabelText="User:" OnAuthenticate="Login1_Authenticate1">
        <LayoutTemplate>
            <div class="form-group">
                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group row login-tools">
                <div class="col-6 login-remember">
                    <div class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox" id="checkbox1">
                        <label class="custom-control-label" for="checkbox1">Remember Me</label>
                    </div>
                </div>
                <div class="col-6 login-forgot-password"><a href="pages-forgot-password.html">Forgot Password?</a></div>
            </div>
            <div class="form-group login-submit">
                <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-primary btn-xl" Text="Login" ValidationGroup="Login1" /></div>
        </LayoutTemplate>
        <LoginButtonStyle CssClass="btn btn-primary btn-xl" />
        <TextBoxStyle CssClass="form-control" />
    </asp:Login>
</asp:Content>
