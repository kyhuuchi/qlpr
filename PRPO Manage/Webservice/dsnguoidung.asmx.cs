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
using Newtonsoft.Json;

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
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void LayDSNguoiDuyet()
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb = nguoidung.LayDanhSachNguoiDung(1, 0, "", "", "", "", false, true, false, false, false, "", false);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void LayThongTinNguoiDung(string tendangnhap)
        {
            NguoiDung nguoidung = new NguoiDung();
            NguoiDung nd = nguoidung.LayThongTinNguoiDung(tendangnhap);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(nd));
        }
        [WebMethod]
        public void LayDanhSachNguoiMuaHang()
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> nd = nguoidung.LayDanhSachNguoiMuaHang();
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(nd));
        }
        
       [WebMethod]
        public void ThemMoiNguoiDung(int action, int id_nguoidung, string tendangnhap,string tenhienthi,int id_phongban, string email, bool dangsudung,bool quanly,bool admin, bool quanlykho, bool quanlymuahang,string matkhau,bool domain)
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb=nguoidung.LayDanhSachNguoiDung(action,id_nguoidung,tendangnhap,tenhienthi,Convert.ToString(id_phongban),email,dangsudung,quanly,admin,quanlykho,quanlymuahang,matkhau, domain);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
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
            Context.Response.Write(JsonConvert.SerializeObject(tb));
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
            Context.Response.Write(JsonConvert.SerializeObject(tb));
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
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }

        [WebMethod]
        public void ThemMoiModuleQuyen(int action, int id_modulequyen,int id_nguoidung, string module, int id_quyen)
        {
            ModuleQuyen modulequyen = new ModuleQuyen();
            List<ModuleQuyen> tb = modulequyen.LayDanhSachModuleQuyen(action, id_modulequyen,id_nguoidung,module,id_quyen);
        }
        [WebMethod]
        public void CheckQuyen(int id_nguoidung)
        {
            ModuleQuyen modulequyen = new ModuleQuyen();
            List<ModuleQuyen> tb = modulequyen.CheckQuyen(id_nguoidung);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void LaySoPR(int phongban, int nam)
        {
            SoPR sopr = new SoPR();
            sopr = sopr.LaySoPR(phongban,nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(sopr));
        }
        [WebMethod]
        public void Action_SoPR(int action, int id, int idphongban, int sopr, int nam)
        {
            SoPR spr = new SoPR();
            List<SoPR> tb = spr.Action_SoPR(action, id, idphongban, sopr, nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        
        [WebMethod]
        public void ActionPR(int action, int id, int id_phongban, int sopr,string sopr_full, int nam, string congdung, string ngaytao, int thangtao, int tongsoluongyeucau, double tongtien, string ghichu, string ngayduyet, int id_nguoiduyet, int id_nguoidexuat, int tinhtrang, string prscanfile, bool sendmail,string tieude1, string tieude2, string tieude3, string tieude4, string tieude5, string tieude6,double ngansachduocduyet1, double ngansachduocduyet2, double ngansachduocduyet3, double ngansachduocduyet4, double ngansachduocduyet5, double ngansachduocduyet6,double dexuatlannay1, double dexuatlannay2, double dexuatlannay3, double dexuatlannay4, double dexuatlannay5, double dexuatlannay6,double luyke1, double luyke2, double luyke3, double luyke4, double luyke5, double luyke6,double thuathieu1, double thuathieu2, double thuathieu3, double thuathieu4, double thuathieu5, double thuathieu6)
        {
            PR pr = new PR();
            List<PR> tb = pr.LayDanhSachPR(action, id, id_phongban, sopr,sopr_full, nam, congdung, ngaytao, thangtao, tongsoluongyeucau, tongtien, ghichu, ngayduyet, id_nguoiduyet, id_nguoidexuat, tinhtrang,prscanfile,sendmail,tieude1,tieude2, tieude3, tieude4, tieude5, tieude6,ngansachduocduyet1,ngansachduocduyet2,ngansachduocduyet3,ngansachduocduyet4,ngansachduocduyet5,ngansachduocduyet6, dexuatlannay1, dexuatlannay2, dexuatlannay3, dexuatlannay4, dexuatlannay5, dexuatlannay6,luyke1, luyke2, luyke3, luyke4, luyke5, luyke6,thuathieu1, thuathieu2, thuathieu3, thuathieu4, thuathieu5, thuathieu6);
            
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        
        
        [WebMethod]
        public void ActionPR_ChiTiet(int action, int id, int idpr, string mahang, string tenhang, string dvt, int tonkho, int soluongyeucau, double dongia, int tigia, double thanhtientamung, string nhacungcap, int tinhtrangvattu, string ngaycanhang, string thoigiansudung, string congdung,int leadtime,int nhommuaid,string nhommuaname,int vat,bool gianhaptay)
        {
            PR_ChiTiet pr_chitiet = new PR_ChiTiet();
            List<PR_ChiTiet> tb = pr_chitiet.LayDanhSachPR_ChTiet(action, id, idpr, mahang, tenhang, dvt, tonkho, soluongyeucau, dongia, tigia, thanhtientamung, nhacungcap, tinhtrangvattu, ngaycanhang, thoigiansudung, congdung, leadtime,nhommuaid,nhommuaname,vat, gianhaptay);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void UpdateNguoiMuaHang(int id_pr_chitiet, string nguoimuahang)
        {
            PR_ChiTiet pr_chitiet = new PR_ChiTiet();
            DataTable tb = pr_chitiet.UpdateNguoiMuaHang(id_pr_chitiet,nguoimuahang);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
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
          
            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void DongPR(string so_pr_full)
        {
            PR pr = new PR();
            DataTable tb = pr.DongPR(so_pr_full);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        /// <summary>
        /// Cac webservice lien quan den PO
        /// </summary>

        [WebMethod]
        public void LaySoPO(int phongban, int nam)
        {
            SoPO sopo = new SoPO();
            sopo = sopo.LaySoPO(phongban, nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(sopo));
        }
        [WebMethod]
        public void LayDSPO(int action, int id, int sopo, string sopo_full, int nam, string ngaypo, int thangpo, int id_nguoiphutrach, int id_nguoiduyet, int id_phongban, string nhacungcap, int songaytre, string manhacuangcap, string khonhan, int tinhtrang)
        {
            PO po = new PO();
            List<PO> tb = po.LayDanhSachPO(action, id, sopo, sopo_full, nam, ngaypo, thangpo, id_nguoiphutrach, id_nguoiduyet, id_phongban, nhacungcap, songaytre, manhacuangcap, khonhan, tinhtrang);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void Action_SoPO(int action, int id, int idphongban, int sopo, int nam)
        {
            SoPO spo = new SoPO();
            List<SoPO> tb = spo.Action_SoPO(action, id, idphongban, sopo, nam);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void LayDS_PRChiTiet_DaDuyet(int id_phongban)
        {
            PR_ChiTiet pr_chitiet = new PR_ChiTiet();
            List<PR_ChiTiet> tb = pr_chitiet.LayDanhSachPR_ChTiet_DaDuyet(id_phongban);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void Action_POChiTiet(int action, int id, int idpo, string mahang, string tenhang, string dvt, int soluong, double dongia, int tigia, double thanhtien, int tinhtrangvt, int id_prchitiet,string ngaymuahang, string nguoiptmuahang)
        {
            PO_ChiTiet po_chitiet = new PO_ChiTiet();
            List<PO_ChiTiet> tb = po_chitiet.LayDanhSachPOChiTiet(action, id, idpo, mahang, tenhang, dvt, soluong, dongia, tigia, thanhtien, tinhtrangvt, id_prchitiet, ngaymuahang, nguoiptmuahang);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void ThongTinPO_TinhTrang(int tinhtrang)
        {
            PO po = new PO();
            DataTable tb = po.LayThongTinSoLuongPO(tinhtrang);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void UpdateTinhTrangPRChiTiet(int id_pr_chitiet, int tinhtrang, int soluongpo)
        {
            PO po = new PO();
            DataTable tb = po.Update_TrangThaiVatTu_PR_ChiTiet(id_pr_chitiet,tinhtrang, soluongpo);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void UpdatePOResent(string sopo_full, string ghichu)
        {
            PO po = new PO();
            DataTable tb = po.PO_Resent(sopo_full, ghichu);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void ThongTinNguoiDuyetTheoGiatriPO(string dk)
        {
            PO po = new PO();
            DataTable tb = po.LayIDNguoiDuyetTheoGiaTriPO(dk);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void CheckSoPO(int sopo, int idphongban, int nam)
        {
            SoPO po = new SoPO();
            DataTable tb = po.Check_SoPO(sopo, idphongban, nam);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void CheckSoPR(int sopr, int idphongban, int nam)
        {
            SoPR po = new SoPR();
            DataTable tb = po.Check_SoPR(sopr, idphongban, nam);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void LayDSPO_TheoTinhTrangNhapKho(int tinhtrang, int tinhtrangnhapkho, int idphongban)
        {
            PO po = new PO();
            List<PO> tb = po.LayDanhSachPO_TheoTinhTrangNhapKho(tinhtrang, tinhtrangnhapkho,idphongban);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        //********************//
        //** Kho **//
        [WebMethod]
        public void ThongTinKho_TinhTrang(int tinhtrang, int id_bp)
        {
            PO po = new PO();
            DataTable tb = po.LayThongTinSoLuongNhapKho(tinhtrang, id_bp);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void Action_Kho(int action, int id, string sonhapkho, int soluong, string ngaynhapkho, int id_po,int id_po_chi_tiet,int id_phongban)
        {
            Kho kho = new Kho();
            List<Kho> tb = kho.LayDanhSachKho(action, id, sonhapkho, soluong, ngaynhapkho, id_po, id_po_chi_tiet, id_phongban);
            
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }

        [WebMethod]
        public void Action_SoPhieuNhapKho(int action, int id, int idphongban, int sophieunhap, int nam)
        {
            SoPNKho sophieunhapkho = new SoPNKho();
            List<SoPNKho> tb = sophieunhapkho.Action_SoPNKho(action, id, idphongban, sophieunhap,nam);

            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void UpdateTinhTrangNhapKho(int id_po, int tinhtrangnhapkho, int tinhtrangdongPO, int tinhtrangdongPR)
        {
            PO po = new PO();
            DataTable tb = po.Update_TinhTrangNhapKho(id_po, tinhtrangnhapkho, tinhtrangdongPO, tinhtrangdongPR);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void UpdateSoLuongConLaiSauNhapKho(int id_po_chi_tiet, int soluongconlai)
        {
            PO_ChiTiet pochitiet = new PO_ChiTiet();
            DataTable tb = pochitiet.Update_SoLuongConLaiSauKhiNhapKho(id_po_chi_tiet, soluongconlai);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }

        //********************//

        //****** Report ***//
        [WebMethod]
        public void ReportDSPhongBan(int id_phongban, string tungay, string denngay)
        {
            PhongBan pb = new PhongBan();
            List<PhongBan> tb = pb.ReportDanhSachPhongBan(id_phongban, tungay, denngay);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void BaoCaoSoLuongPRTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            PR pr = new PR();
            DataTable tb = pr.BaoCaoSoLuongPRTheoThangTheoDonVi(id_phongban, tungay, denngay);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void BaoCaoSoLuongPOTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            PO pr = new PO();
            DataTable tb = pr.BaoCaoSoLuongPOTheoThangTheoDonVi(id_phongban, tungay, denngay);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void ReportDanhSachPhongBan_DoanhSo(int id_phongban, string tungay, string denngay)
        {
            PhongBan pb = new PhongBan();
            List<PhongBan> tb = pb.ReportDanhSachPhongBan_DoanhSo(id_phongban, tungay, denngay);
            var js = new JavaScriptSerializer();
            Context.Response.Write(JsonConvert.SerializeObject(tb));
        }
        [WebMethod]
        public void BaoCaoDoanhSoPOTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            PO pr = new PO();
            DataTable tb = pr.BaoCaoDoanhSoPOTheoThangTheoDonVi(id_phongban, tungay, denngay);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        
        [WebMethod]
        public void BaoCaoDoanhSoPODetail(int id_phongban)
        {
            PO pr = new PO();
            DataTable tb = pr.BaoCaoDoanhSoPODetail(id_phongban);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void BaoCaoDoanhSoNhapKhoTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            Kho kho = new Kho();
            DataTable tb = kho.BaoCaoDoanhSoNhapKhoTheoThangTheoDonVi(id_phongban, tungay, denngay);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void BaoCaoDoanhSoNhapKhoDetail(int id_phongban)
        {
            Kho kho = new Kho();
            DataTable tb = kho.BaoCaoDoanhSoNhapKhoDetail(id_phongban);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        [WebMethod]
        public void BaoCaoTre(int id_phongban, string tungay, string denngay)
        {
            PR pr = new PR();
            DataTable tb = pr.BaoCaoTrePR(id_phongban, tungay, denngay);
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

            Context.Response.Write(JsonConvert.SerializeObject(parentRow));
        }
        //********************//
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
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void CheckGiaLiveSAP(string mahang)
        {
            string url = "http://prd-app1.duytan.local:8100/sap/bc/ywsgpoitems?sap-client=900&MA="+mahang;
            System.Net.WebRequest request = WebRequest.Create(url);
            
            //request.Credentials = new NetworkCredential("sapuser", "password");
            WebResponse ws = request.GetResponse();

            string jsonString = string.Empty;
            using (System.IO.StreamReader sreader = new System.IO.StreamReader(ws.GetResponseStream()))
            {
                jsonString = sreader.ReadToEnd();
            }
            Context.Response.Write(JsonConvert.SerializeObject(jsonString));
        }

    }
}
