using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThuVien;
using Business;


namespace PRPO_Manage.Account
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("/");
            }

        }
        public bool CheckLogin(string TenDangNhap, string MatKhau, ref string userData, ref string MessageError)
        {
            bool isOk = false;
            
            try
            {
                NguoiDung nguoidung = new NguoiDung().LayThongTinNguoiDung(TenDangNhap);
                
                               
                if (!string.IsNullOrEmpty(TenDangNhap) && !string.IsNullOrEmpty(MatKhau))
                {
                    if(nguoidung.Dang_Su_Dung==true)
                    {
                        isOk = LDAP.AuthenticateUser("", TenDangNhap, MatKhau);
                        if (isOk)
                        {
                            userData = LibEncrypt.Encrypt(nguoidung.ID_NguoiDung + "," + nguoidung.Ten_Dang_Nhap + "," + nguoidung.Email + "," + nguoidung.Ten_Hien_Thi, true);
                        }
                    }
                    
            
                }
            }
            catch (Exception ex)
            {
                lbError.Text = "<span class=\"error\">Hệ thống đang bảo trì</span>";
            }
            return isOk;
        }
        protected void btLogin_Click(object sender, EventArgs e)
        {
            string ErrorMessage = string.Empty;
            string userData = string.Empty;
            if (CheckLogin(txtTenDangNhap.Text, txtMatKhau.Text, ref userData, ref ErrorMessage))
            {
                //
                bool IsRemember = chkRemember.Checked;
                Function.Authentication(txtTenDangNhap.Text, IsRemember, userData);
                // 4. Do the redirect. 
                String returnUrl;
                // the login is successful
                //string RawURL = HttpContext.Current.Request.RawUrl;
                if (Request.QueryString["ReturnUrl"] == null)
                {
                    returnUrl = "/";
                }

                //login not unsuccessful 
                else
                {
                    returnUrl = Request.QueryString["ReturnUrl"];
                    if (returnUrl == "/") returnUrl = "/";
                }
                Response.Redirect(returnUrl);

            }
            else
            {
                lbError.Text = "<span class=\"error\">Tên đăng nhập/mật khẩu không đúng hoặc tài khoản không còn được sử dụng.</span>";
                
            }
        }
    }
}