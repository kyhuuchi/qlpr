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
        private int _sent_mail;

        public int ID_PR
        {
            get{ return _id_pr; }
            set{ _id_pr = value; }
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
        public int Sent_Mail
        {
            get { return _sent_mail; }
            set { _sent_mail = value; }
        }
        //public PR LayThongTinNguoiDung(string tendangnhap)
        //{
        //    NguoiDung nd = new NguoiDung();
        //    DAC kn = new DAC();

        //    SqlParameter pm = new SqlParameter("@tendangnhap", tendangnhap);
        //    SqlParameter[] param = new SqlParameter[1] { pm };
        //    DataTable tb = kn.get_by_procedure("proc_CheckAccount", param);
        //    if (tb != null || tb.Rows.Count > 0)
        //    {
        //        nd.ID_NguoiDung = Convert.ToInt16(tb.Rows[0]["ID"]);
        //        nd.Admin = Convert.ToBoolean(tb.Rows[0]["Admin"]);
        //        nd.Dang_Nhap_Domain = Convert.ToBoolean(tb.Rows[0]["DangNhapDomain"]);
        //        nd.Dang_Su_Dung = Convert.ToBoolean(tb.Rows[0]["DangSuDung"]);
        //        nd.Email = tb.Rows[0]["Email"].ToString();
        //        nd.ID_Phong_Ban = Convert.ToInt32(tb.Rows[0]["ID_PhongBan"]);
        //        nd.Phong_Ban = tb.Rows[0]["PhongBan"].ToString();
        //        nd.Ngay_Tao = Convert.ToDateTime(tb.Rows[0]["NgayTao"]);
        //        nd.Quan_Ly = Convert.ToBoolean(tb.Rows[0]["QuanLy"]);
        //        nd.Ten_Hien_Thi = tb.Rows[0]["TenHienThi"].ToString();
        //        nd.Ten_Dang_Nhap = tb.Rows[0]["TenDangNhap"].ToString();
        //    }
        //    return nd;
        //}
    }
}
