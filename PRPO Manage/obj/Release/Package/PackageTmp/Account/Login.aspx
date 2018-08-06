<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PRPO_Manage.Account.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- LOGIN FORM -->
    <div style="margin: auto; top: 0; right: 0; bottom: 0; left: 0; width: 910px; height: 341px;text-align:center;">
        <img style="display:inline-block;padding:150px;width:600px;" src="/Images/manufacturing.png" />
    </div>
    <div class="text-center" style="">
        <div class="logo"></div>
        <!-- Main Form -->
        <div class="login-form-1">
            <div id="login-form" class="text-left">
              
                <div class="main-login-form">
                    <div class="login-group">
                        <div class="form-group">
                            <!--label for="lg_username" class="sr-only">Tên Đăng Nhập</label-->
                            <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="form-control" placeholder="Tên đăng nhập"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegTenDangNhap" CssClass="error" ControlToValidate="txtTenDangNhap" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <!--label for="lg_password" class="sr-only">Mật khẩu</label-->
                            <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" CssClass="form-control" placeholder="Mật khẩu"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RegPassWord" CssClass="error" ControlToValidate="txtMatKhau" runat="server" ErrorMessage="*" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group login-group-checkbox">
                            <!--input type="checkbox" id="lg_remember" name="lg_remember"-->
                            <asp:CheckBox ID="chkRemember" runat="server" />
                            <label for="ContentPlaceHolder1_chkRemember">remember</label>
                        </div>
                    </div>
                    <!--button type="submit" class="login-button" onclick="btLogin_Click"><i class="fa fa-chevron-right"></i></!--button-->
                    <asp:Button ID="btLogin" runat="server" CssClass="login-button" OnClick="btLogin_Click" Text=">" ValidationGroup="Login" />
                </div>
                  <div class="login-form-main-message">
                    <asp:Literal ID="lbError" runat="server"></asp:Literal>
                </div>
             <%--   <div class="etc-login-form">
                </div>--%>
            </div>
        </div>
        <!-- end:Main Form -->
    </div>
</asp:Content>
