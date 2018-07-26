using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Business;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Net;
using System.Web.Script.Services;

namespace PRPO_Manage.Webservice
{
    /// <summary>
    /// Summary description for dsnguoidung
    /// </summary>
    [WebService(Namespace = "http://duytan.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class dsnguoidung : System.Web.Services.WebService
    {
        /// <summary>
        /// Cac service lien quan den nguoi dung
        /// </summary>
        [WebMethod]
        public void LayDSNguoiDung()
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb= nguoidung.LayDanhSachNguoiDung(1,0,"","","","",false,false,false, false, false,"",false);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }

        [WebMethod]
        public void LayThongTinNguoiDung(string tendangnhap)
        {
            NguoiDung nguoidung = new NguoiDung();
            NguoiDung nd = nguoidung.LayThongTinNguoiDung(tendangnhap);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(nd));
        }
        [WebMethod]
        public void ThemMoiNguoiDung(int action, int id_nguoidung, string tendangnhap,string tenhienthi,int id_phongban, string email, bool dangsudung,bool quanly,bool admin, bool quanlykho, bool quanlymuahang,string matkhau,bool domain)
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb=nguoidung.LayDanhSachNguoiDung(action,id_nguoidung,tendangnhap,tenhienthi,Convert.ToString(id_phongban),email,dangsudung,quanly,admin,quanlykho,quanlymuahang,matkhau, domain);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }
        /// <summary>
        /// Cac service lien quan den phong ban
        /// </summary>
        [WebMethod]
        public void LayDSPhongBan()
        {
            PhongBan pb = new PhongBan();
            List<PhongBan> tb = pb.LayDanhSachPhongBan(1, 0, "", "");
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }

        [WebMethod]
        public void ThemMoiPhongBan(int action, int id_phongban, string tenphongban, string tenviettat)
        {
            PhongBan pb = new PhongBan();
            List<PhongBan> tb = pb.LayDanhSachPhongBan(action, id_phongban, tenphongban, tenviettat);
        }
        /// <summary>
        /// Cac service lien quan den quyen truy cap
        /// </summary>
        [WebMethod]
        public void LayDSQuyen()
        {
            Quyen quyen = new Quyen();
            List<Quyen> tb = quyen.LayDanhSachQuyen(1, 0, "", "");
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }

        [WebMethod]
        public void ThemMoiQuyen(int action, int id_quyen, string tenquyen, string maquyen)
        {
            Quyen quyen = new Quyen();
            List<Quyen> tb = quyen.LayDanhSachQuyen(action, id_quyen, tenquyen, maquyen);
        }
        /// <summary>
        /// Cac service lien quan den phan quyen truy cap Module
        /// </summary>
        [WebMethod]
        public void LayDSModuleQuyen()
        {
            ModuleQuyen modulequyen = new ModuleQuyen();
            List<ModuleQuyen> tb = modulequyen.LayDanhSachModuleQuyen(1, 0, 0, "",0);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }

        [WebMethod]
        public void ThemMoiModuleQuyen(int action, int id_modulequyen,int id_nguoidung, string module, int id_quyen)
        {
            ModuleQuyen modulequyen = new ModuleQuyen();
            List<ModuleQuyen> tb = modulequyen.LayDanhSachModuleQuyen(action, id_modulequyen,id_nguoidung,module,id_quyen);
        }

        [WebMethod]
        public void LaySoPR(int phongban, int nam)
        {
            SoPR sopr = new SoPR();
            sopr = sopr.LaySoPR(phongban,nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(sopr));
        }
        [WebMethod]
        public void Action_SoPR(int action, int id, int idphongban, int sopr, int nam)
        {
            SoPR spr = new SoPR();
            List<SoPR> tb = spr.Action_SoPR(action, id, idphongban, sopr, nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }
        
        [WebMethod]
        public void ActionPR(int action, int id, int id_phongban, int sopr,string sopr_full, int nam, string congdung, string ngaytao, int thangtao, int tongsoluongyeucau, double tongtien, string ghichu, string ngayduyet, int id_nguoiduyet, int id_nguoidexuat, int tinhtrang, string prscanfile, bool sendmail,string tieude1, string tieude2, string tieude3, string tieude4, string tieude5, string tieude6,double ngansachduocduyet1, double ngansachduocduyet2, double ngansachduocduyet3, double ngansachduocduyet4, double ngansachduocduyet5, double ngansachduocduyet6,double dexuatlannay1, double dexuatlannay2, double dexuatlannay3, double dexuatlannay4, double dexuatlannay5, double dexuatlannay6,double luyke1, double luyke2, double luyke3, double luyke4, double luyke5, double luyke6,double thuathieu1, double thuathieu2, double thuathieu3, double thuathieu4, double thuathieu5, double thuathieu6)
        {
            PR pr = new PR();
            List<PR> tb = pr.LayDanhSachPR(action, id, id_phongban, sopr,sopr_full, nam, congdung, ngaytao, thangtao, tongsoluongyeucau, tongtien, ghichu, ngayduyet, id_nguoiduyet, id_nguoidexuat, tinhtrang,prscanfile,sendmail,tieude1,tieude2, tieude3, tieude4, tieude5, tieude6,ngansachduocduyet1,ngansachduocduyet2,ngansachduocduyet3,ngansachduocduyet4,ngansachduocduyet5,ngansachduocduyet6, dexuatlannay1, dexuatlannay2, dexuatlannay3, dexuatlannay4, dexuatlannay5, dexuatlannay6,luyke1, luyke2, luyke3, luyke4, luyke5, luyke6,thuathieu1, thuathieu2, thuathieu3, thuathieu4, thuathieu5, thuathieu6);
            
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }
        
        
        [WebMethod]
        public void ActionPR_ChiTiet(int action, int id, int idpr, string mahang, string tenhang, string dvt, int tonkho, int soluongyeucau, double dongia, int tigia, double thanhtientamung, string nhacungcap, int tinhtrangvattu, string ngaycanhang, string thoigiansudung, string congdung)
        {
            PR_ChiTiet pr_chitiet = new PR_ChiTiet();
            List<PR_ChiTiet> tb = pr_chitiet.LayDanhSachPR_ChTiet(action, id, idpr, mahang, tenhang, dvt, tonkho, soluongyeucau, dongia, tigia, thanhtientamung, nhacungcap, tinhtrangvattu, ngaycanhang, thoigiansudung, congdung);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }
        [WebMethod]
        public void ThongTinPR_TinhTrang(int tinhtrang, int id_bp,bool muahang,bool kho)
        {
            PR pr = new PR();
            DataTable tb = pr.LayThongTinSoLuongPR(tinhtrang,id_bp,muahang,kho);
            var js = new JavaScriptSerializer();
          
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in tb.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in tb.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
          
            Context.Response.Write(js.Serialize(parentRow));
        }

        [WebMethod]
        public void LaySoPO(int phongban, int nam)
        {
            SoPO sopo = new SoPO();
            sopo = sopo.LaySoPO(phongban, nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(sopo));
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ServiceTimVatTu()
        {
            string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=TALL";
            System.Net.WebRequest request = WebRequest.Create(url);
            //request.Credentials = new NetworkCredential("sapuser", "password");
            WebResponse ws = request.GetResponse();
            using (System.IO.StreamReader sreader = new System.IO.StreamReader(ws.GetResponseStream()))
            {
                Context.Response.Write(sreader.ReadToEnd());
                //var js = new JavaScriptSerializer();
                //Context.Response.Write(js.Serialize(sreader.ReadToEnd())); 
            }
        }

    }
}
