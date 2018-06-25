using System;
using Business;
using ThuVien;
using System.Collections.Generic;
using System.Text;
namespace PRPO_Manage.Account
{
    public partial class DanhSachNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                List<PhongBan> pb = new PhongBan().LayDanhSachPhongBan(1,0,"","");
                StringBuilder str_option = new StringBuilder();
                foreach (PhongBan phongban in pb)
                {
                     str_option.AppendFormat("<option value='{0}'>{1}</option>", phongban.ID_PhongBan,phongban.Ten_Phong_Ban);
                }
                lit_phongban.Text = str_option.ToString();
            }
        }
    }
}