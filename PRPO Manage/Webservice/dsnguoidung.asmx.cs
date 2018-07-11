﻿using System;
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
            List<NguoiDung> tb= nguoidung.LayDanhSachNguoiDung(1,0,"","","","",false,false,false);
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
        public void ThemMoiNguoiDung(int action, int id_nguoidung, string tendangnhap,string tenhienthi,int id_phongban, string email, bool dangsudung,bool quanly,bool admin  )
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb=nguoidung.LayDanhSachNguoiDung(action,id_nguoidung,tendangnhap,tenhienthi,Convert.ToString(id_phongban),email,dangsudung,quanly,admin);
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
        public void LaySoPR(string phongban, int nam)
        {
            SoPR sopr = new SoPR();
            sopr = sopr.LaySoPR(phongban,nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(sopr));
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
