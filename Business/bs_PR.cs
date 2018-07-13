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
        public List<PR> LayDanhSachPR(int action,int id, int id_phongban,int sopr, int nam,string congdung, DateTime ngaytao,int thangtao,int tongsoluongyeucau,double tongtien,string ghichu, DateTime ngayduyet,int id_nguoiduyet,int id_nguoidexuat, int tinhtrang,string prscanfile, bool sendmail)
        {

            
            DAC kn = new DAC();
            List<PR> pr_col = new List<PR>();

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idphongban", id_phongban);
            SqlParameter pm4 = new SqlParameter("@sopr", sopr);
            SqlParameter pm5 = new SqlParameter("@nam",nam);
            SqlParameter pm6 = new SqlParameter("@congdung", congdung);
            SqlParameter pm7 = new SqlParameter("@ngaytao", ngaytao);
            SqlParameter pm8 = new SqlParameter("@thangtao", thangtao);
            SqlParameter pm9 = new SqlParameter("@tongsoluongyeucau", tongsoluongyeucau);
            SqlParameter pm10 = new SqlParameter("@tongtien", tongtien);
            SqlParameter pm11 = new SqlParameter("@ghichu", ghichu);
            SqlParameter pm12 = new SqlParameter("@ngayduyet", ngayduyet);
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
                    pr.ID_PhongBan = Convert.ToInt32(row["ID_PhongBan"]);
                    pr.So_PR = Convert.ToInt32(row["SoPR"]);
                    pr.Nam= Convert.ToInt32(row["Nam"]);
                    pr.Cong_Dung = row["CongDung"].ToString();
                    pr.Ngay_Tao = Convert.ToDateTime(row["NgayTao"]);
                    pr.Thang_Tao = Convert.ToInt32(row["ThangTao"]);
                    pr.Tong_So_Luong_Yeu_cau = Convert.ToInt32(row["TongSoLuongYeuCau"]);
                    pr.Tong_Tien = Convert.ToDouble(row["TongTien"]);
                    pr.Ghi_Chu=row["GhiChu"].ToString();
                    pr.Ngay_Duyet = Convert.ToDateTime(row["NgayDuyet"]);
                    pr.ID_Nguoi_Duyet = Convert.ToInt32(row["ID_NguoiDuyet"]);
                    pr.ID_Nguoi_De_Xuat = Convert.ToInt32(row["ID_NguoiDeXuat"]);
                    pr.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                    pr.PR_Scan_File = row["PRScanFile"].ToString();
                    pr.Sent_Mail = Convert.ToBoolean(row["SendMail"]);
                    pr_col.Add(pr);

                }
            }
            return pr_col;
        }
    }
}
