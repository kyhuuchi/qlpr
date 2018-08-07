using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

using System.Threading.Tasks;
using DB;

namespace Business
{
    public class PO
    {
        private int _id_po;
        private int _so_po;
        private string _so_po_full;
        private int _nam;
        private DateTime _ngay_po;
        private int _thang_po;
        private int _id_nguoimuahang;
        private string _ten_nguoimuahang;
        private int _id_nguoiduyet_po;
        private string _ten_nguoiduyet_po;
        private int _so_ngay_tre;
        private int _id_phong_ban;
        private string _ten_phong_ban;
        private string _ten_nha_cung_cap;
        private string _ma_nha_cung_cap;
        private string _kho_nhan;
        private int _tinh_trang;

        public int ID_PO
        {
            get { return _id_po; }
            set { _id_po = value; }
        }
        public int So_PO
        {
            get { return _so_po; }
            set { _so_po = value; }
        }
        public string So_PO_Full
        {
            get { return _so_po_full; }
            set { _so_po_full = value; }
        }
        public int Nam
        {
            get { return _nam; }
            set { _nam = value; }
        }
        public DateTime Ngay_PO
        {
            get { return _ngay_po; }
            set { _ngay_po = value; }
        }
        public int Thang_PO
        {
            get { return _thang_po; }
            set { _thang_po = value; }
        }
        public int ID_NguoiMuaHang
        {
            get { return _id_nguoimuahang; }
            set { _id_nguoimuahang = value; }
        }
        public string Ten_NguoiMuaHang
        {
            get { return _ten_nguoimuahang; }
            set { _ten_nguoimuahang = value; }
        }
        public int ID_Nguoi_Duyet_PO
        {
            get { return _id_nguoiduyet_po; }
            set { _id_nguoiduyet_po = value; }
        }
        public string Ten_Nguoi_Duyet_PO
        {
            get { return _ten_nguoiduyet_po; }
            set { _ten_nguoiduyet_po = value; }
        }
        public int So_Ngay_tre
        {
            get { return _so_ngay_tre; }
            set { _so_ngay_tre = value; }
        }
        public int ID_Phong_Ban
        {
            get { return _id_phong_ban; }
            set { _id_phong_ban = value; }
        }
        public string Ten_Phong_Ban
        {
            get { return _ten_phong_ban; }
            set { _ten_phong_ban = value; }
        }
        public string Ten_Nha_Cung_Cap
        {
            get { return _ten_nha_cung_cap; }
            set { _ten_nha_cung_cap = value; }
        }
        public string Ma_Nha_Cung_Cap
        {
            get { return _ma_nha_cung_cap; }
            set { _ma_nha_cung_cap = value; }
        }
        public string Kho_Nhan
        {
            get { return _kho_nhan; }
            set { _kho_nhan = value; }
        }
        public int Tinh_Trang
        {
            get { return _tinh_trang; }
            set { _tinh_trang = value; }
        }

        //cac ham lien quan den PO
        public List<PO> LayDanhSachPO(int action, int id, int sopo, string sopo_full, int nam, string ngaypo,int thangpo,int id_nguoiphutrach,int id_nguoiduyet,int id_phongban,string nhacungcap,int songaytre,string manhacuangcap,string khonhan,int tinhtrang)
        {

            DateTime ngpo;

            DAC kn = new DAC();
            List<PO> po_col = new List<PO>();
            if (string.IsNullOrEmpty(ngaypo) == true)
            {
                ngpo = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngpo = Convert.ToDateTime(ngaypo);
            }
            
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@sopo", sopo);
            SqlParameter pm4 = new SqlParameter("@sopo_full", sopo_full);
            SqlParameter pm5 = new SqlParameter("@nam", nam);
            SqlParameter pm6 = new SqlParameter("@ngaypo", ngaypo);
            SqlParameter pm7 = new SqlParameter("@thangpo", thangpo);
            SqlParameter pm8 = new SqlParameter("@idnguoiphutrach", id_nguoiphutrach);
            SqlParameter pm9 = new SqlParameter("@idnguoiduyet", id_nguoiduyet);
            SqlParameter pm10 = new SqlParameter("@idphongban", id_phongban);
            SqlParameter pm11 = new SqlParameter("@nhacungcap", nhacungcap);
            SqlParameter pm12 = new SqlParameter("@songaytre", songaytre);
            SqlParameter pm13 = new SqlParameter("@manhacc", manhacuangcap);
            SqlParameter pm14 = new SqlParameter("@khonhan", khonhan);
            SqlParameter pm15 = new SqlParameter("@tinhtrang", tinhtrang);
            


            SqlParameter[] param = new SqlParameter[15] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12, pm13, pm14, pm15};
            DataTable tb = kn.get_by_procedure("proc_Action_PO", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PO po = new PO();
                    po.ID_PO = Convert.ToInt32(row["ID"]);
                    po.So_PO = Convert.ToInt32(row["SoPO"]);
                    //if (tb.Columns.Contains("TenVietTat") == true)
                    //{
                    //    po.Ten_PhongBan = row["TenVietTat"].ToString();
                    //}
                    po.So_PO_Full =row["SoPO_Full"].ToString();
                    po.Nam = Convert.ToInt32(row["Nam"]);
                    po.Ngay_PO = Convert.ToDateTime(row["NgayPO"]);
                    po.Thang_PO = Convert.ToInt32(row["ThangPO"]);
                    po.ID_NguoiMuaHang = Convert.ToInt32(row["ID_NguoiPhuTrachMuaHang"]);
                    po.Ten_NguoiMuaHang = row["NguoiPhuTrachMuaHang"].ToString();
                    po.ID_Nguoi_Duyet_PO= Convert.ToInt32(row["ID_NguoiDuyetPO"]);
                    po.Ten_Nguoi_Duyet_PO = row["NguoiPheDuyetPO"].ToString();
                    po.So_Ngay_tre= Convert.ToInt32(row["SoNgayTre"]);
                    po.ID_Phong_Ban = Convert.ToInt32(row["ID_PhongBan"]);
                    if(tb.Columns.Contains("TenPhongBan"))
                    {
                        po.Ten_Phong_Ban = row["TenPhongBan"].ToString();
                    }
                    
                    po.Ten_Nha_Cung_Cap = row["NhaCungCap"].ToString();
                    po.Ma_Nha_Cung_Cap = row["MaNhaCungCap"].ToString();
                    po.Kho_Nhan = row["KhoNhan"].ToString();
                    po.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                  
                    po_col.Add(po);

                }
            }
            return po_col;
        }
        public DataTable LayThongTinSoLuongPO(int tinhtrang)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@tinhtrang", tinhtrang);

            SqlParameter[] param = new SqlParameter[1] { pm};
            DataTable tb = kn.get_by_procedure("proc_ThongTinPO_TinhTrang", param);



            return tb;
        }
        public DataTable Update_TrangThaiVatTu_PR_ChiTiet(int id_pr_chitiet,int tinhtrang)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_pr_chi_tiet", id_pr_chitiet);
            SqlParameter pm2 = new SqlParameter("@tinhtrang", tinhtrang);
            
            SqlParameter[] param = new SqlParameter[2] { pm,pm2 };
            DataTable tb = kn.get_by_procedure("proc_Update_TrangThai_VatTu_PR_ChiTiet", param);



            return tb;
        }
        public DataTable PO_Resent(string sopo_full,string ghichu)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@so_po_full", sopo_full);
            SqlParameter pm2 = new SqlParameter("@ghichu", ghichu);
            SqlParameter[] param = new SqlParameter[2] { pm,pm2 };
            DataTable tb = kn.get_by_procedure("proc_Action_PO_Resent", param);



            return tb;
        }
    }
    public class PO_ChiTiet
    {
        private int _id_po_chi_tiet;
        private int _id_po;
        private string _ma_hang;
        private string _ten_hang;
        private string _dvt;
        private int _so_luong_po;
        private double _don_gia;
        private int _ti_gia;
        private double _thanh_tien;
        private int _tinh_trang_vat_tu;
        private int _id_pr_chi_tiet;
        private DateTime _ngay_mua_hang;
        private string _so_pr_full;

        public int ID_PO_Chi_Tiet
        {
            get { return _id_po_chi_tiet; }
            set { _id_po_chi_tiet = value; }
        }
        public int ID_PO
        {
            get { return _id_po; }
            set { _id_po = value; }
        }
        public string Ma_Hang
        {
            get { return _ma_hang; }
            set { _ma_hang = value; }
        }
        public string Ten_Hang
        {
            get { return _ten_hang; }
            set { _ten_hang = value; }
        }
        public string PO_ChiTiet_DVT
        {
            get { return _dvt; }
            set { _dvt = value; }
        }
        public int So_Luong_PO
        {
            get { return _so_luong_po; }
            set { _so_luong_po = value; }
        }
        public double PO_ChiTiet_Don_Gia
        {
            get { return _don_gia; }
            set { _don_gia = value; }
        }
        public int PO_ChiTiet_Ti_Gia
        {
            get { return _ti_gia; }
            set { _ti_gia = value; }
        }
        public double PO_ChiTiet_Thanh_Tien
        {
            get { return _thanh_tien; }
            set { _thanh_tien = value; }
        }
        public int PO_ChiTiet_Tinh_Trang
        {
            get { return _tinh_trang_vat_tu; }
            set { _tinh_trang_vat_tu = value; }
        }
        public int ID_PR_Chi_Tiet
        {
            get { return _id_pr_chi_tiet; }
            set { _id_pr_chi_tiet = value; }
        }
        public DateTime Ngay_Mua_Hang
        {
            get { return _ngay_mua_hang; }
            set { _ngay_mua_hang = value; }
        }
        public string So_PR_Full
        {
            get { return _so_pr_full; }
            set { _so_pr_full = value; }
        }
        //cac ham lien quan den PO Chi Tiet
        public List<PO_ChiTiet> LayDanhSachPOChiTiet(int action, int id, int idpo,string mahang,string tenhang,string dvt,int soluong,double dongia,int tigia,double thanhtien,int tinhtrangvt,int id_prchitiet,string ngaymuahang)
        {
            DateTime ngmuahang;
            if (string.IsNullOrEmpty(ngaymuahang) == true)
            {
                ngmuahang = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngmuahang = Convert.ToDateTime(ngaymuahang);
            }
            DAC kn = new DAC();
            List<PO_ChiTiet> pochitiet_col = new List<PO_ChiTiet>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idpo", idpo);
            SqlParameter pm4 = new SqlParameter("@mahang", mahang);
            SqlParameter pm5 = new SqlParameter("@tenhang", tenhang);
            SqlParameter pm6 = new SqlParameter("@dvt", dvt);
            SqlParameter pm7 = new SqlParameter("@soluongpo", soluong);
            SqlParameter pm8 = new SqlParameter("@dongia", dongia);
            SqlParameter pm9 = new SqlParameter("@tigia", tigia);
            SqlParameter pm10 = new SqlParameter("@thanhtien", thanhtien);
            SqlParameter pm11 = new SqlParameter("@tinhtrangvattu", tinhtrangvt);
            SqlParameter pm12 = new SqlParameter("@idpr_chitiet", id_prchitiet);
            SqlParameter pm13 = new SqlParameter("@ngaymuahang", ngaymuahang);
            SqlParameter[] param = new SqlParameter[13] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12,pm13};
            DataTable tb = kn.get_by_procedure("proc_Action_PO_ChiTiet", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PO_ChiTiet po_chitiet = new PO_ChiTiet();
                    po_chitiet.ID_PO_Chi_Tiet = Convert.ToInt32(row["ID"]);
                    po_chitiet.ID_PO = Convert.ToInt32(row["ID_PO"]);
                    //if (tb.Columns.Contains("SoPR_Full") == true)
                    //{
                       
                    //}
                    po_chitiet.So_PR_Full = row["SoPR_Full"].ToString();
                    po_chitiet.Ma_Hang = row["MaHang"].ToString();
                    po_chitiet.Ten_Hang = row["TenHang"].ToString();
                    po_chitiet.PO_ChiTiet_DVT = row["DVT"].ToString();
                    po_chitiet.So_Luong_PO = Convert.ToInt32(row["SoLuongPO"]);
                    po_chitiet.PO_ChiTiet_Don_Gia = Convert.ToDouble(row["DonGia"]);
                    po_chitiet.PO_ChiTiet_Ti_Gia = Convert.ToInt32(row["TiGia"]);
                    po_chitiet.PO_ChiTiet_Thanh_Tien = Convert.ToDouble(row["ThanhTien"]);
                    po_chitiet.PO_ChiTiet_Tinh_Trang = Convert.ToInt32(row["TinhTrangVatTu"]);
                    po_chitiet.ID_PR_Chi_Tiet = Convert.ToInt32(row["ID_PR_ChiTiet"]);
                    po_chitiet.Ngay_Mua_Hang=Convert.ToDateTime(row["NgayMuaHang"]);
                    pochitiet_col.Add(po_chitiet);

                }
            }
            return pochitiet_col;
        }
    }
}
