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
        private DateTime _ngay_duyet_po;
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
        private string _ghi_chu;
        private int _tinh_trang;
        private int _tinh_trang_nhap_kho;
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
        public DateTime Ngay_Duyet_PO
        {
            get { return _ngay_duyet_po; }
            set { _ngay_duyet_po = value; }
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
        public string Ghi_Chu
        {
            get { return _ghi_chu; }
            set { _ghi_chu = value; }
        }
        public int Tinh_Trang
        {
            get { return _tinh_trang; }
            set { _tinh_trang = value; }
        }
        public int Tinh_Trang_Nhap_Kho
        {
            get { return _tinh_trang_nhap_kho; }
            set { _tinh_trang_nhap_kho = value; }
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
                    if(!row.IsNull("NgayDuyetPO"))
                    {
                        po.Ngay_Duyet_PO = Convert.ToDateTime(row["NgayDuyetPO"]);
                    }
                    else
                    {
                        po.Ngay_Duyet_PO = DateTime.Now;
                    }
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
                    if (tb.Columns.Contains("GhiChu"))
                    {
                        if(row["GhiChu"]!=null)
                        {
                            po.Ghi_Chu = row["GhiChu"].ToString();
                        }
                        else
                        {
                            po.Ghi_Chu = "";
                        }
                    }
                    po.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                    po.Tinh_Trang_Nhap_Kho = Convert.ToInt32(row["TinhTrangNhapKho"]);
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
        public DataTable Update_TrangThaiVatTu_PR_ChiTiet(int id_pr_chitiet,int tinhtrang,int soluongpo)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_pr_chi_tiet", id_pr_chitiet);
            SqlParameter pm2 = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm3 = new SqlParameter("@soluongpo", soluongpo);
            SqlParameter[] param = new SqlParameter[3] { pm,pm2, pm3 };
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
        //** Lay thong tin nguoi duyet theo dieu kien gia tri PO
        public DataTable LayIDNguoiDuyetTheoGiaTriPO(string dk)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@dk", dk);

            SqlParameter[] param = new SqlParameter[1] { pm };
            DataTable tb = kn.get_by_procedure("proc_LayThongTinNguoiDuyetTheoCauHinh", param);

            return tb;
        }
        public DataTable LayThongTinSoLuongNhapKho(int tinhtrang,int id_bp)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm2 = new SqlParameter("@id_bp", id_bp);

            SqlParameter[] param = new SqlParameter[2] { pm, pm2 };
            DataTable tb = kn.get_by_procedure("proc_ThongTinKho_TinhTrang", param);



            return tb;
        }
        public DataTable Update_TinhTrangNhapKho(int id_po, int tinhtrangnhapkho,int tinhtrangdongPO,int tinhtrangdongPR)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_po", id_po);
            SqlParameter pm2 = new SqlParameter("@tinhtrangnhapkho", tinhtrangnhapkho);
            SqlParameter pm3 = new SqlParameter("@tinhtrangdongPO", tinhtrangdongPO);
            SqlParameter pm4 = new SqlParameter("@tinhtrangdongPR", tinhtrangdongPR);

            SqlParameter[] param = new SqlParameter[4] { pm, pm2,pm3,pm4 };
            DataTable tb = kn.get_by_procedure("proc_Update_TinhTrangNhapKho", param);



            return tb;
        }
        public List<PO> LayDanhSachPO_TheoTinhTrangNhapKho(int tinhtrang, int tinhtrangnhapkho,int idphongban)
        {
            DAC kn = new DAC();
            List<PO> po_col = new List<PO>();
            SqlParameter pm = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm2 = new SqlParameter("@tinhtrangnhapkho", tinhtrangnhapkho);
            SqlParameter pm3 = new SqlParameter("@idphongban", idphongban);

            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3};
            DataTable tb = kn.get_by_procedure("proc_DanhSachPO_PhieuNhapKho", param);
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
                    po.So_PO_Full = row["SoPO_Full"].ToString();
                    po.Nam = Convert.ToInt32(row["Nam"]);
                    po.Ngay_PO = Convert.ToDateTime(row["NgayPO"]);
                    po.Thang_PO = Convert.ToInt32(row["ThangPO"]);
                    po.ID_NguoiMuaHang = Convert.ToInt32(row["ID_NguoiPhuTrachMuaHang"]);
                    po.Ten_NguoiMuaHang = row["NguoiPhuTrachMuaHang"].ToString();
                    po.ID_Nguoi_Duyet_PO = Convert.ToInt32(row["ID_NguoiDuyetPO"]);
                    po.Ten_Nguoi_Duyet_PO = row["NguoiPheDuyetPO"].ToString();
                    po.So_Ngay_tre = Convert.ToInt32(row["SoNgayTre"]);
                    po.ID_Phong_Ban = Convert.ToInt32(row["ID_PhongBan"]);
                    if (tb.Columns.Contains("TenPhongBan"))
                    {
                        po.Ten_Phong_Ban = row["TenPhongBan"].ToString();
                    }

                    po.Ten_Nha_Cung_Cap = row["NhaCungCap"].ToString();
                    po.Ma_Nha_Cung_Cap = row["MaNhaCungCap"].ToString();
                    po.Kho_Nhan = row["KhoNhan"].ToString();
                    if (tb.Columns.Contains("GhiChu"))
                    {
                        if (row["GhiChu"] != null)
                        {
                            po.Ghi_Chu = row["GhiChu"].ToString();
                        }
                        else
                        {
                            po.Ghi_Chu = "";
                        }
                    }
                    po.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                    po.Tinh_Trang_Nhap_Kho = Convert.ToInt32(row["TinhTrangNhapKho"]);
                    po_col.Add(po);

                }
            }
            return po_col;
        }
        public DataTable BaoCaoSoLuongPOTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
            SqlParameter pm2 = new SqlParameter("@tungay", tungay);
            SqlParameter pm3 = new SqlParameter("@denngay", denngay);
            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3 };

            DataTable tb = kn.get_by_procedure("proc_report_BaoCaoSoLuongPOTheoThangTheoDonVi", param);

            return tb;
        }
        public DataTable BaoCaoDoanhSoPOTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
            SqlParameter pm2 = new SqlParameter("@tungay", tungay);
            SqlParameter pm3 = new SqlParameter("@denngay", denngay);
            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3 };

            DataTable tb = kn.get_by_procedure("proc_report_BaoCaoDoanhSoPOTheoThangTheoDonVi", param);

            return tb;
        }
        public DataTable BaoCaoDoanhSoPODetail(int id_phongban)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
          
            SqlParameter[] param = new SqlParameter[1] { pm};

            DataTable tb = kn.get_by_procedure("proc_report_BaoCaoDoanhSoPO_Detail", param);

            return tb;
        }
        public DataTable BaoCaoTrePO(int id_phongban, string denngay)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);

            SqlParameter pm2 = new SqlParameter("@denngay", denngay);
            SqlParameter[] param = new SqlParameter[2] { pm, pm2 };

            DataTable tb = kn.get_by_procedure("proc_report_trePO", param);

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
        private int _so_luong_con_lai;
        private string _nguoi_phu_trach_mua_hang;
        private string _nha_cung_cap;
        private string _thoi_gian_su_dung;
        private string _cong_dung;
        private int _lead_time;
        private int _vat;
        private bool _gia_nhap_tay;
        private double _FRB0;
        private double _FRB1;
        private int _FRB2;
        private double _FRB3;
        private double _FRC0;
        private double _FRC1;
        private bool _PBXX;
        private double _RB01;
        private double _RB02;
        private double _ZB00;
        private double _ZB01;
        private int _ZB02;
        private double _ZDP1;
        private int _ZIPT;
        private double _ZISR;
        private int _ZMST;
        
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
        public int So_Luong_Con_Lai
        {
            get { return _so_luong_con_lai; }
            set { _so_luong_con_lai = value; }
        }
        public string Nguoi_Phu_Trach_Mua_Hang
        {
            get { return _nguoi_phu_trach_mua_hang; }
            set { _nguoi_phu_trach_mua_hang = value; }
        }
        public string Nha_Cung_Cap
        {
            get { return _nha_cung_cap; }
            set { _nha_cung_cap = value; }
        }
        public string Thoi_Gian_Su_Dung
        {
            get { return _thoi_gian_su_dung; }
            set { _thoi_gian_su_dung = value; }
        }
        public string Cong_Dung
        {
            get { return _cong_dung; }
            set { _cong_dung = value; }
        }
        public int Lead_Time
        {
            get { return _lead_time; }
            set { _lead_time = value; }
        }
        public int VAT
        {
            get { return _vat; }
            set { _vat = value; }
        }
        public double FRB0
        {
            get { return _FRB0; }
            set { _FRB0 = value; }
        }
        public double FRB1
        {
            get { return _FRB1; }
            set { _FRB1 = value; }
        }
        public int FRB2
        {
            get { return _FRB2; }
            set { _FRB2 = value; }
        }
        public double FRB3
        {
            get { return _FRB3; }
            set { _FRB3 = value; }
        }
        public double FRC0
        {
            get { return _FRC0; }
            set { _FRC0 = value; }
        }
        public double FRC1
        {
            get { return _FRC1; }
            set { _FRC1 = value; }
        }
        public bool PBXX
        {
            get { return _PBXX; }
            set { _PBXX = value; }
        }
        public double RB01
        {
            get { return _RB01; }
            set { _RB01 = value; }
        }
        public double RB02
        {
            get { return _RB02; }
            set { _RB02 = value; }
        }
        public double ZB00
        {
            get { return _ZB00; }
            set { _ZB00 = value; }
        }
        public double ZB01
        {
            get { return _ZB01; }
            set { _ZB01 = value; }
        }
        public int ZB02
        {
            get { return _ZB02; }
            set { _ZB02 = value; }
        }
        public double ZDP1
        {
            get { return _ZDP1; }
            set { _ZDP1 = value; }
        }
        public int ZIPT
        {
            get { return _ZIPT; }
            set { _ZIPT = value; }

        }
        public double ZISR
        {
            get { return _ZISR; }
            set { _ZISR = value; }
        }
        public int ZMST
        {
            get { return _ZMST; }
            set { _ZMST = value; }
        }
        //cac ham lien quan den PO Chi Tiet
        public List<PO_ChiTiet> LayDanhSachPOChiTiet(int action, int id, int idpo,string mahang,string tenhang,string dvt,int soluong,double dongia,int tigia,double thanhtien,int tinhtrangvt,int id_prchitiet,string ngaymuahang,string nguoiptmuahang,double FRB0, double FRB1, int FRB2, double FRB3, double FRC0, double FRC1, bool PBXX, double RB01, double RB02, double ZB00, double ZB01, int ZB02, double ZDP1, int ZIPT, double ZISR, int ZMST)
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
            SqlParameter pm14 = new SqlParameter("@nguoiptmuahang", nguoiptmuahang);
            SqlParameter pm15 = new SqlParameter("@FRB0", FRB0);
            SqlParameter pm16 = new SqlParameter("@FRB1", FRB1);
            SqlParameter pm17 = new SqlParameter("@FRB2", FRB2);
            SqlParameter pm18 = new SqlParameter("@FRB3", FRB3);
            SqlParameter pm19 = new SqlParameter("@FRC0", FRC0);
            SqlParameter pm20 = new SqlParameter("@FRC1", FRC1);
            SqlParameter pm21 = new SqlParameter("@PBXX", PBXX);
            SqlParameter pm22 = new SqlParameter("@RB01", RB01);
            SqlParameter pm23 = new SqlParameter("@RB02", RB02);
            SqlParameter pm24 = new SqlParameter("@ZB00", ZB00);
            SqlParameter pm25 = new SqlParameter("@ZB01", ZB01);
            SqlParameter pm26 = new SqlParameter("@ZB02", ZB02);
            SqlParameter pm27 = new SqlParameter("@ZDP1", ZDP1);
            SqlParameter pm28 = new SqlParameter("@ZIPT", ZIPT);
            SqlParameter pm29 = new SqlParameter("@ZISR", ZISR);
            SqlParameter pm30 = new SqlParameter("@ZMST", ZMST);

            SqlParameter[] param = new SqlParameter[30] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12,pm13,pm14, pm15, pm16, pm17, pm18, pm19, pm20, pm21, pm22, pm23, pm24, pm25, pm26, pm27, pm28, pm29, pm30 };
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
                    po_chitiet.So_Luong_Con_Lai = Convert.ToInt32(row["SoLuongConLai"]);
                    po_chitiet.Nguoi_Phu_Trach_Mua_Hang = "";
                    if (!row.IsNull("NguoiPTMuaHang"))
                    {
                        po_chitiet.Nguoi_Phu_Trach_Mua_Hang = row["NguoiPTMuaHang"].ToString();
                    }
                    po_chitiet.Nha_Cung_Cap = "";
                    if (!row.IsNull("NhaCungCap"))
                    {
                        po_chitiet.Nha_Cung_Cap = row["NhaCungCap"].ToString();
                    }
                    po_chitiet.Thoi_Gian_Su_Dung = "";
                    if (!row.IsNull("ThoiGianSuDung"))
                    {
                        po_chitiet.Thoi_Gian_Su_Dung = row["ThoiGianSuDung"].ToString();
                    }
                    po_chitiet.Cong_Dung = "";
                    if (!row.IsNull("CongDung"))
                    {
                        po_chitiet.Cong_Dung = row["CongDung"].ToString();
                    }
                    po_chitiet.Lead_Time = 0;
                    if (!row.IsNull("LeadTime"))
                    {
                        po_chitiet.Lead_Time = Convert.ToInt32(row["LeadTime"]);
                    }
                    po_chitiet.VAT = 0;
                    if (!row.IsNull("VAT"))
                    {
                        po_chitiet.VAT = Convert.ToInt32(row["VAT"]);
                    }
                    po_chitiet.FRB0 = 0;
                    if (!row.IsNull("FRB0"))
                    {
                        po_chitiet.FRB0 = Convert.ToDouble(row["FRB0"]);
                    }
                    po_chitiet.FRB1 = 0;
                    if (!row.IsNull("FRB1"))
                    {
                        po_chitiet.FRB1 = Convert.ToDouble(row["FRB1"]);
                    }
                    po_chitiet.FRB2 = 0;
                    if (!row.IsNull("FRB2"))
                    {
                        po_chitiet.FRB2 = Convert.ToInt32(row["FRB2"]);
                    }
                    po_chitiet.FRB3 = 0;
                    if (!row.IsNull("FRB3"))
                    {
                        po_chitiet.FRB3 = Convert.ToDouble(row["FRB3"]);
                    }
                    po_chitiet.FRC0 = 0;
                    if (!row.IsNull("FRC0"))
                    {
                        po_chitiet.FRC0 = Convert.ToDouble(row["FRC0"]);
                    }
                    po_chitiet.FRC1 = 0;
                    if (!row.IsNull("FRC1"))
                    {
                        po_chitiet.FRC1 = Convert.ToDouble(row["FRC1"]);
                    }
                    po_chitiet.PBXX = false;
                    if (!row.IsNull("PBXX"))
                    {
                        po_chitiet.PBXX = Convert.ToBoolean(row["PBXX"]);
                    }
                    po_chitiet.RB01 = 0;
                    if (!row.IsNull("RB01"))
                    {
                        po_chitiet.RB01 = Convert.ToDouble(row["RB01"]);
                    }
                    po_chitiet.RB02= 0;
                    if (!row.IsNull("RB02"))
                    {
                        po_chitiet.RB02 = Convert.ToDouble(row["RB02"]);
                    }
                    po_chitiet.ZB00 = 0;
                    if (!row.IsNull("ZB00"))
                    {
                        po_chitiet.ZB00 = Convert.ToDouble(row["ZB00"]);
                    }
                    po_chitiet.ZB01 = 0;
                    if (!row.IsNull("ZB01"))
                    {
                        po_chitiet.ZB01 = Convert.ToDouble(row["ZB01"]);
                    }
                    po_chitiet.ZB02 = 0;
                    if (!row.IsNull("ZB02"))
                    {
                        po_chitiet.ZB02 = Convert.ToInt32(row["ZB02"]);
                    }
                    po_chitiet.ZDP1 = 0;
                    if (!row.IsNull("ZDP1"))
                    {
                        po_chitiet.ZDP1 = Convert.ToDouble(row["ZDP1"]);
                    }
                    po_chitiet.ZIPT = 0;
                    if (!row.IsNull("ZIPT"))
                    {
                        po_chitiet.ZIPT = Convert.ToInt32(row["ZIPT"]);
                    }
                    po_chitiet.ZISR = 0;
                    if (!row.IsNull("ZISR"))
                    {
                        po_chitiet.ZISR = Convert.ToInt32(row["ZISR"]);
                    }
                    po_chitiet.ZMST = 0;
                    if (!row.IsNull("ZMST"))
                    {
                        po_chitiet.ZMST = Convert.ToInt32(row["ZMST"]);
                    }
                    pochitiet_col.Add(po_chitiet);

                }
            }
            return pochitiet_col;
        }
        public DataTable Update_SoLuongConLaiSauKhiNhapKho(int id_po_chi_tiet, int soluongconlai)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_po_chi_tiet", id_po_chi_tiet);
            SqlParameter pm2 = new SqlParameter("@soluongconlai", soluongconlai);

            SqlParameter[] param = new SqlParameter[2] { pm, pm2 };
            DataTable tb = kn.get_by_procedure("proc_Update_soLuongConLai_PO_ChiTiet", param);



            return tb;
        }
       
    }
}
