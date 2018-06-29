using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Business;

namespace PRPO_Manage.Account
{
    public partial class DanhSachModuleQuyen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                LoadQuyen();
                LoadNguoiDung();
            }
        }
        /// <summary>
        /// Load thong tin danh sach quyen tren he thong
        /// </summary>
        private void LoadQuyen()
        {
            StringBuilder str_chk = new StringBuilder();
            Quyen bs_quyen = new Quyen();
            List<Quyen> quyen_col= bs_quyen.LayDanhSachQuyen(1,0,"","");
            foreach(Quyen quyen in quyen_col)
            {
                //str_chk.AppendFormat("<div class='checkbox'><label><input type = 'checkbox' name='chk' id='chk_{0}' value='{1}'/>{2}</label></div>", quyen.Ma_Quyen, quyen.ID_Quyen, quyen.Ten_Quyen);
                str_chk.AppendFormat("<option value='{0}'>{1}</option>", quyen.ID_Quyen, quyen.Ten_Quyen);
            }
            lit_quyentruycap.Text = str_chk.ToString();
            
                                
        }
        private void LoadNguoiDung()
        {
            StringBuilder str_nguoidung = new StringBuilder();
            NguoiDung bs_nguoidung = new NguoiDung();
            List<NguoiDung> nguoidung_col = bs_nguoidung.LayDanhSachNguoiDung(1,0,"","","","",false,false,false);
            foreach (NguoiDung nd in nguoidung_col)
            {
                str_nguoidung.AppendFormat("<option value='{0}'>{1}</option>", nd.ID_NguoiDung,nd.Ten_Hien_Thi);
            }
            lit_nguoidung.Text = str_nguoidung.ToString();
        }

    }
}