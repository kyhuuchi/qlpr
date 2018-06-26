using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Business;

namespace PRPO_Manage.Account
{
    public partial class QuanTri : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(CheckAdmin(Context.User.Identity.Name)==false)
            {
               
                Response.Redirect("/");
            }

        }
        public bool CheckAdmin(string TenDangNhap)
        {
            bool isAdmin = false;

            try
            {
                NguoiDung nguoidung = new NguoiDung().LayThongTinNguoiDung(TenDangNhap);
                if (nguoidung.Admin == true && nguoidung.Dang_Su_Dung==true)
                {
                    isAdmin = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isAdmin;
        }
    }
}