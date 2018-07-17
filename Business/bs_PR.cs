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
    public class PR
    {
        private int _id_pr;
        private int _id_phongban;
        private int _so_pr;
        private int _nam;
        private string _cong_dung;
        private DateTime _ngay_tao;
        private int _thang_tao;
        private int _tong_so_luong_yeu_cau;
        private double _tong_tien;
        private string _ghi_chu;
        private DateTime _ngay_duyet;
        private int _id_nguoi_duyet;
        private int _id_nguoi_de_xuat;
        private int _tinh_trang;
        private string _pr_scan_file;
        private bool _sent_mail;

        public int ID_PR
        {
            get{ return _id_pr; }
            set{ _id_pr = value; }
        }
        public int ID_PhongBan
        {
            get { return _id_phongban; }
            set { _id_phongban = value; }
        }
        public int So_PR
        {
            get { return _so_pr; }
            set { _so_pr = value; }
        }
        public int Nam
        {
            get { return _nam; }
            set { _nam = value; }
        }
        public string Cong_Dung
        {
            get { return _cong_dung; }
            set { _cong_dung = value; }
        }
        public DateTime Ngay_Tao
        {
            get { return _ngay_tao; }
            set { _ngay_tao = value; }
        }
        public int Thang_Tao
        {
            get { return _thang_tao; }
            set { _thang_tao = value; }
        }
        public int Tong_So_Luong_Yeu_cau
        {
            get { return _tong_so_luong_yeu_cau; }
            set { _tong_so_luong_yeu_cau = value; }
        }
        public double Tong_Tien
        {
            get { return _tong_tien; }
            set { _tong_tien = value; }
        }
        public string Ghi_Chu
        {
            get { return _ghi_chu; }
            set { _ghi_chu = value; }
        }
        public DateTime Ngay_Duyet
        {
            get { return _ngay_duyet; }
            set { _ngay_duyet = value; }
        }
        public int ID_Nguoi_Duyet
        {
            get { return _id_nguoi_duyet; }
            set { _id_nguoi_duyet = value; }
        }
        public int ID_Nguoi_De_Xuat
        {
            get { return _id_nguoi_de_xuat; }
            set { _id_nguoi_de_xuat = value; }
        }
        public int Tinh_Trang
        {
            get { return _tinh_trang; }
            set { _tinh_trang = value; }
        }
        public string PR_Scan_File
        {
            get { return _pr_scan_file; }
            set { _pr_scan_file = value; }
        }
        public bool Sent_Mail
        {
            get { return _sent_mail; }
            set { _sent_mail = value; }
        }
        public List<PR> LayDanhSachPR(int action,int id, int id_phongban,int sopr, int nam,string congdung, string ngaytao,int thangtao,int tongsoluongyeucau,double tongtien,string ghichu, string ngayduyet,int id_nguoiduyet,int id_nguoidexuat, int tinhtrang,string prscanfile, bool sendmail)
        {

            
            DAC kn = new DAC();
            List<PR> pr_col = new List<PR>();

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idphongban", id_phongban);
            SqlParameter pm4 = new SqlParameter("@sopr", sopr);
            SqlParameter pm5 = new SqlParameter("@nam",nam);
            SqlParameter pm6 = new SqlParameter("@congdung", congdung);
            SqlParameter pm7 = new SqlParameter("@ngaytao", Convert.ToDateTime(ngaytao));
            SqlParameter pm8 = new SqlParameter("@thangtao", thangtao);
            SqlParameter pm9 = new SqlParameter("@tongsoluongyeucau", tongsoluongyeucau);
            SqlParameter pm10 = new SqlParameter("@tongtien", tongtien);
            SqlParameter pm11 = new SqlParameter("@ghichu", ghichu);
            SqlParameter pm12 = new SqlParameter("@ngayduyet", Convert.ToDateTime(ngayduyet));
            SqlParameter pm13 = new SqlParameter("@idnguoiduyet", id_nguoiduyet);
            SqlParameter pm14 = new SqlParameter("@idnguoidexuat", id_nguoidexuat);
            SqlParameter pm15 = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm16 = new SqlParameter("@prscanfile", prscanfile);
            SqlParameter pm17 = new SqlParameter("@sendmail", sendmail);
            SqlParameter[] param = new SqlParameter[17] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12, pm13, pm14, pm15, pm16, pm17 };
            DataTable tb = kn.get_by_procedure("proc_Action_PR", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PR pr = new PR();
                    pr.ID_PR= Convert.ToInt32(row["ID"]);
                    pr.ID_PhongBan = Convert.ToInt32(row["ID_PhongBan"]);
                    pr.So_PR = Convert.ToInt32(row["SoPR"]);
                    pr.Nam= Convert.ToInt32(row["Nam"]);
                    pr.Cong_Dung = row["CongDung"].ToString();
                    pr.Ngay_Tao = Convert.ToDateTime(row["NgayTao"]);
                    pr.Thang_Tao = Convert.ToInt32(row["ThangTao"]);
                    pr.Tong_So_Luong_Yeu_cau = Convert.ToInt32(row["TongSoLuongYeuCau"]);
                    pr.Tong_Tien = Convert.ToDouble(row["TongTien"]);
                    if(!row.IsNull("GhiChu"))
                    {
                        pr.Ghi_Chu = row["GhiChu"].ToString();
                    }
                    
                    if(!row.IsNull("NgayDuyet"))
                    {
                        pr.Ngay_Duyet = Convert.ToDateTime(row["NgayDuyet"]);
                    }

                    if(!row.IsNull("ID_NguoiDuyet"))
                    {
                        pr.ID_Nguoi_Duyet = Convert.ToInt32(row["ID_NguoiDuyet"]);
                    }
                    
                    pr.ID_Nguoi_De_Xuat = Convert.ToInt32(row["ID_NguoiDeXuat"]);
                    pr.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                    if(!row.IsNull("PRScanFile"))
                    {
                        pr.PR_Scan_File = row["PRScanFile"].ToString();
                    }
                    
                    pr.Sent_Mail = Convert.ToBoolean(row["SendMail"]);
                    pr_col.Add(pr);

                }
            }
            return pr_col;
        }
       
    }
    public class PR_ChiTiet
    {
        private int _id_pr_chitiet;
        private int _id_pr;
        private string _ma_hang;
        private string _ten_hang;
        private string _dvt;
        private int _ton_kho;
        private int _so_luong_yeu_cau;
        private double _don_gia;
        private int _ti_gia;
        private double _thanh_tien_tam_ung;
        private string _nha_cung_cap;
        private int _tinh_trang_vat_tu;
        private DateTime _ngay_can_hang;
        private string _thoi_gian_su_dung;
        private string _cong_dung;

        public int ID_PR_Chi_Tiet
        {
            get { return _id_pr_chitiet; }
            set { _id_pr_chitiet = value; }
        }
        public int ID_PR
        {
            get { return _id_pr; }
            set { _id_pr = value; }
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
        public string DVT
        {
            get { return _dvt; }
            set { _dvt = value; }
        }
        public int Ton_Kho
        {
            get { return _ton_kho; }
            set { _ton_kho = value; }
        }
        public int So_Luong_Yeu_cau
        {
            get { return _so_luong_yeu_cau; }
            set { _so_luong_yeu_cau = value; }
        }
        public double Don_Gia
        {
            get { return _don_gia; }
            set { _don_gia = value; }
        }
        public int Ti_Gia
        {
            get { return _ti_gia; }
            set { _ti_gia = value; }
        }
        public double Thanh_Tien_Tam_Ung
        {
            get { return _thanh_tien_tam_ung; }
            set { _thanh_tien_tam_ung = value; }
        }
        public string Nha_Cung_cap
        {
            get { return _nha_cung_cap; }
            set { _nha_cung_cap = value; }
        }
        public int Tinh_Trang_Vat_Tu
        {
            get { return _tinh_trang_vat_tu ; }
            set { _tinh_trang_vat_tu = value; }
        }
        public DateTime Ngay_Can_Hang
        {
            get { return _ngay_can_hang; }
            set { _ngay_can_hang = value; }
        }
        public string Thoi_Gian_Xu_Dung
        {
            get { return _thoi_gian_su_dung; }
            set { _thoi_gian_su_dung = value; }
        }
        public string Cong_Dung
        {
            get { return _cong_dung; }
            set { _cong_dung = value; }
        }
        public List<PR_ChiTiet> LayDanhSachPR_ChTiet(int action, int id, int idpr, string mahang, string tenhang, string dvt, int tonkho, int soluongyeucau, double dongia, int tigia, double thanhtientamung, string nhacungcap, int tinhtrangvattu, string ngaycanhang, string thoigiansudung, string congdung)
        {


            DAC kn = new DAC();
            List<PR_ChiTiet> pr_Chitiet_col = new List<PR_ChiTiet>();

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idpr", idpr);
            SqlParameter pm4 = new SqlParameter("@mahang", mahang);
            SqlParameter pm5 = new SqlParameter("@tenhang", tenhang);
            SqlParameter pm6 = new SqlParameter("@dvt", dvt);
            SqlParameter pm7 = new SqlParameter("@tonkho", tonkho);
            SqlParameter pm8 = new SqlParameter("@soluongyeucau", soluongyeucau);
            SqlParameter pm9 = new SqlParameter("@dongia", dongia);
            SqlParameter pm10 = new SqlParameter("@tigia", tigia);
            SqlParameter pm11 = new SqlParameter("@thanhtientamung", thanhtientamung);
            SqlParameter pm12 = new SqlParameter("@nhacungcap", nhacungcap);
            SqlParameter pm13 = new SqlParameter("@tinhtrangvattu", tinhtrangvattu);
            SqlParameter pm14 = new SqlParameter("@ngaycanhang", Convert.ToDateTime(ngaycanhang));
            SqlParameter pm15 = new SqlParameter("@thoigiansudung", thoigiansudung);
            SqlParameter pm16 = new SqlParameter("@congdung", congdung);
            
            SqlParameter[] param = new SqlParameter[16] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12, pm13, pm14, pm15, pm16};
            DataTable tb = kn.get_by_procedure("proc_Action_PR_ChiTiet", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PR_ChiTiet pr_chitiet = new PR_ChiTiet();
                    pr_chitiet.ID_PR = Convert.ToInt32(row["ID_PR"]);
                    pr_chitiet.Ma_Hang = row["MaHang"].ToString();
                    pr_chitiet.Ten_Hang = row["TenHang"].ToString();
                    pr_chitiet.DVT = row["DVT"].ToString();
                    pr_chitiet.Ton_Kho = Convert.ToInt32(row["TonKho"]);
                    pr_chitiet.So_Luong_Yeu_cau = Convert.ToInt32(row["SoLuongYeuCau"]);
                    pr_chitiet.Don_Gia = Convert.ToInt32(row["DonGia"]);
                    pr_chitiet.Ti_Gia = Convert.ToInt32(row["TiGia"]);
                    pr_chitiet.Thanh_Tien_Tam_Ung = Convert.ToDouble(row["ThanhTienTamUng"]);
                    pr_chitiet.Nha_Cung_cap = row["NhaCungCap"].ToString();
                    pr_chitiet.Tinh_Trang_Vat_Tu = Convert.ToInt32(row["TinhTrangVatTu"]);
                    pr_chitiet.Ngay_Can_Hang = Convert.ToDateTime(row["NgayCanHang"]);
                    pr_chitiet.Thoi_Gian_Xu_Dung = row["ThoiGianSuDung"].ToString();
                    pr_chitiet.Cong_Dung = row["CongDung"].ToString();
                    
                    pr_Chitiet_col.Add(pr_chitiet);

                }
            }
            return pr_Chitiet_col;
        }
    }
}
