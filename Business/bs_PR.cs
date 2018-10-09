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
        private string _ten_phongban;
        private int _so_pr;
        private string _so_pr_full;
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
        private string _ten_nguoi_de_xuat;
        private int _tinh_trang;
        private string _pr_scan_file;
        private bool _sent_mail;

        private string _tieu_de_1;
        private string _tieu_de_2;
        private string _tieu_de_3;
        private string _tieu_de_4;
        private string _tieu_de_5;
        private string _tieu_de_6;

        private double _ngan_sach_duoc_duyet_1;
        private double _ngan_sach_duoc_duyet_2;
        private double _ngan_sach_duoc_duyet_3;
        private double _ngan_sach_duoc_duyet_4;
        private double _ngan_sach_duoc_duyet_5;
        private double _ngan_sach_duoc_duyet_6;

        private double _de_xuat_lan_nay_1;
        private double _de_xuat_lan_nay_2;
        private double _de_xuat_lan_nay_3;
        private double _de_xuat_lan_nay_4;
        private double _de_xuat_lan_nay_5;
        private double _de_xuat_lan_nay_6;

        private double _luy_ke_1;
        private double _luy_ke_2;
        private double _luy_ke_3;
        private double _luy_ke_4;
        private double _luy_ke_5;
        private double _luy_ke_6;

        private double _thua_thieu_1;
        private double _thua_thieu_2;
        private double _thua_thieu_3;
        private double _thua_thieu_4;
        private double _thua_thieu_5;
        private double _thua_thieu_6;

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
        public string Ten_PhongBan
        {
            get { return _ten_phongban; }
            set { _ten_phongban = value; }
        }
        public int So_PR
        {
            get { return _so_pr; }
            set { _so_pr = value; }
        }
        public string So_PR_Full
        {
            get { return _so_pr_full; }
            set { _so_pr_full = value; }
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
        public string Ten_Nguoi_De_Xuat
        {
            get { return _ten_nguoi_de_xuat; }
            set { _ten_nguoi_de_xuat = value; }
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
        public string Tieu_De_1
        {
            get { return _tieu_de_1; }
            set { _tieu_de_1 = value; }
        }
        public string Tieu_De_2
        {
            get { return _tieu_de_2; }
            set { _tieu_de_2 = value; }
        }
        public string Tieu_De_3
        {
            get { return _tieu_de_3; }
            set { _tieu_de_3 = value; }
        }
        public string Tieu_De_4
        {
            get { return _tieu_de_4; }
            set { _tieu_de_4 = value; }
        }
        public string Tieu_De_5
        {
            get { return _tieu_de_5; }
            set { _tieu_de_5 = value; }
        }
        public string Tieu_De_6
        {
            get { return _tieu_de_6; }
            set { _tieu_de_6 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_1
        {
            get { return _ngan_sach_duoc_duyet_1; }
            set { _ngan_sach_duoc_duyet_1 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_2
        {
            get { return _ngan_sach_duoc_duyet_2; }
            set { _ngan_sach_duoc_duyet_2 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_3
        {
            get { return _ngan_sach_duoc_duyet_3; }
            set { _ngan_sach_duoc_duyet_3 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_4
        {
            get { return _ngan_sach_duoc_duyet_4; }
            set { _ngan_sach_duoc_duyet_4 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_5
        {
            get { return _ngan_sach_duoc_duyet_5; }
            set { _ngan_sach_duoc_duyet_5 = value; }
        }
        public double Ngan_Sach_Duoc_Duyet_6
        {
            get { return _ngan_sach_duoc_duyet_6; }
            set { _ngan_sach_duoc_duyet_6 = value; }
        }
        public double De_Xuat_Lan_Nay_1
        {
            get { return _de_xuat_lan_nay_1; }
            set { _de_xuat_lan_nay_1 = value; }
        }
        public double De_Xuat_Lan_Nay_2
        {
            get { return _de_xuat_lan_nay_2; }
            set { _de_xuat_lan_nay_2 = value; }
        }
        public double De_Xuat_Lan_Nay_3
        {
            get { return _de_xuat_lan_nay_3; }
            set { _de_xuat_lan_nay_3 = value; }
        }
        public double De_Xuat_Lan_Nay_4
        {
            get { return _de_xuat_lan_nay_4; }
            set { _de_xuat_lan_nay_4 = value; }
        }
        public double De_Xuat_Lan_Nay_5
        {
            get { return _de_xuat_lan_nay_5; }
            set { _de_xuat_lan_nay_5 = value; }
        }
        public double De_Xuat_Lan_Nay_6
        {
            get { return _de_xuat_lan_nay_6; }
            set { _de_xuat_lan_nay_6 = value; }
        }
        public double Luy_Ke_1
        {
            get { return _luy_ke_1; }
            set { _luy_ke_1 = value; }
        }
        public double Luy_Ke_2
        {
            get { return _luy_ke_2; }
            set { _luy_ke_2 = value; }
        }
        public double Luy_Ke_3
        {
            get { return _luy_ke_3; }
            set { _luy_ke_3 = value; }
        }
        public double Luy_Ke_4
        {
            get { return _luy_ke_4; }
            set { _luy_ke_4 = value; }
        }
        public double Luy_Ke_5
        {
            get { return _luy_ke_5; }
            set { _luy_ke_5 = value; }
        }
        public double Luy_Ke_6
        {
            get { return _luy_ke_6; }
            set { _luy_ke_6 = value; }
        }
        public double Thua_Thieu_1
        {
            get { return _thua_thieu_1; }
            set { _thua_thieu_1 = value; }
        }
        public double Thua_Thieu_2
        {
            get { return _thua_thieu_2; }
            set { _thua_thieu_2 = value; }
        }
        public double Thua_Thieu_3
        {
            get { return _thua_thieu_3; }
            set { _thua_thieu_3 = value; }
        }
        public double Thua_Thieu_4
        {
            get { return _thua_thieu_4; }
            set { _thua_thieu_4 = value; }
        }
        public double Thua_Thieu_5
        {
            get { return _thua_thieu_5; }
            set { _thua_thieu_5 = value; }
        }
        public double Thua_Thieu_6
        {
            get { return _thua_thieu_6; }
            set { _thua_thieu_6 = value; }
        }
        public List<PR> LayDanhSachPR(int action,int id, int id_phongban,int sopr,string sopr_full, int nam,string congdung, string ngaytao,int thangtao,int tongsoluongyeucau,double tongtien,string ghichu, string ngayduyet,int id_nguoiduyet,int id_nguoidexuat, int tinhtrang,string prscanfile, bool sendmail, string tieude1, string tieude2, string tieude3, string tieude4, string tieude5, string tieude6, double ngansachduocduyet1, double ngansachduocduyet2, double ngansachduocduyet3, double ngansachduocduyet4, double ngansachduocduyet5, double ngansachduocduyet6, double dexuatlannay1, double dexuatlannay2, double dexuatlannay3, double dexuatlannay4, double dexuatlannay5, double dexuatlannay6, double luyke1, double luyke2, double luyke3, double luyke4, double luyke5, double luyke6, double thuathieu1, double thuathieu2, double thuathieu3, double thuathieu4, double thuathieu5, double thuathieu6)
        {

            DateTime ngtao,ngduyet;

            DAC kn = new DAC();
            List<PR> pr_col = new List<PR>();
            if(string.IsNullOrEmpty(ngaytao)==true)
            {
                ngtao = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngtao=Convert.ToDateTime(ngaytao);
            }
            if (string.IsNullOrEmpty(ngayduyet) == true)
            {
                ngduyet = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngduyet = Convert.ToDateTime(ngayduyet);
            }
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idphongban", id_phongban);
            SqlParameter pm4 = new SqlParameter("@sopr", sopr);
            SqlParameter pm5 = new SqlParameter("@sopr_full", sopr_full);
            SqlParameter pm6 = new SqlParameter("@nam",nam);
            SqlParameter pm7 = new SqlParameter("@congdung", congdung);
            SqlParameter pm8 = new SqlParameter("@ngaytao", ngtao);
            SqlParameter pm9 = new SqlParameter("@thangtao", thangtao);
            SqlParameter pm10 = new SqlParameter("@tongsoluongyeucau", tongsoluongyeucau);
            SqlParameter pm11 = new SqlParameter("@tongtien", tongtien);
            SqlParameter pm12 = new SqlParameter("@ghichu", ghichu);
            SqlParameter pm13 = new SqlParameter("@ngayduyet", ngduyet);
            SqlParameter pm14 = new SqlParameter("@idnguoiduyet", id_nguoiduyet);
            SqlParameter pm15 = new SqlParameter("@idnguoidexuat", id_nguoidexuat);
            SqlParameter pm16 = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm17 = new SqlParameter("@prscanfile", prscanfile);
            SqlParameter pm18 = new SqlParameter("@sendmail", sendmail);
            SqlParameter pm19 = new SqlParameter("@tieude1", tieude1);
            SqlParameter pm20 = new SqlParameter("@tieude2", tieude2);
            SqlParameter pm21 = new SqlParameter("@tieude3", tieude3);
            SqlParameter pm22 = new SqlParameter("@tieude4", tieude4);
            SqlParameter pm23 = new SqlParameter("@tieude5", tieude5);
            SqlParameter pm24 = new SqlParameter("@tieude6", tieude6);
            SqlParameter pm25 = new SqlParameter("@ngansachduocduyet1", ngansachduocduyet1);
            SqlParameter pm26 = new SqlParameter("@ngansachduocduyet2", ngansachduocduyet2);
            SqlParameter pm27 = new SqlParameter("@ngansachduocduyet3", ngansachduocduyet3);
            SqlParameter pm28 = new SqlParameter("@ngansachduocduyet4", ngansachduocduyet4);
            SqlParameter pm29 = new SqlParameter("@ngansachduocduyet5", ngansachduocduyet5);
            SqlParameter pm30 = new SqlParameter("@ngansachduocduyet6", ngansachduocduyet6);
            SqlParameter pm31 = new SqlParameter("@dexuatlannay1", dexuatlannay1);
            SqlParameter pm32 = new SqlParameter("@dexuatlannay2", dexuatlannay2);
            SqlParameter pm33 = new SqlParameter("@dexuatlannay3", dexuatlannay3);
            SqlParameter pm34 = new SqlParameter("@dexuatlannay4", dexuatlannay4);
            SqlParameter pm35 = new SqlParameter("@dexuatlannay5", dexuatlannay5);
            SqlParameter pm36 = new SqlParameter("@dexuatlannay6", dexuatlannay6);
            SqlParameter pm37 = new SqlParameter("@luyke1", luyke1);
            SqlParameter pm38 = new SqlParameter("@luyke2", luyke2);
            SqlParameter pm39 = new SqlParameter("@luyke3", luyke3);
            SqlParameter pm40 = new SqlParameter("@luyke4", luyke4);
            SqlParameter pm41 = new SqlParameter("@luyke5", luyke5);
            SqlParameter pm42 = new SqlParameter("@luyke6", luyke6);
            SqlParameter pm43 = new SqlParameter("@thuathieu1", thuathieu1);
            SqlParameter pm44 = new SqlParameter("@thuathieu2", thuathieu2);
            SqlParameter pm45 = new SqlParameter("@thuathieu3", thuathieu3);
            SqlParameter pm46 = new SqlParameter("@thuathieu4", thuathieu4);
            SqlParameter pm47 = new SqlParameter("@thuathieu5", thuathieu5);
            SqlParameter pm48 = new SqlParameter("@thuathieu6", thuathieu6);


            SqlParameter[] param = new SqlParameter[48] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12, pm13, pm14, pm15, pm16, pm17, pm18, pm19, pm20, pm21, pm22, pm23, pm24, pm25, pm26, pm27, pm28, pm29, pm30, pm31, pm32, pm33, pm34, pm35, pm36, pm37, pm38, pm39, pm40, pm41, pm42, pm43, pm44, pm45, pm46, pm47, pm48 };
            DataTable tb = kn.get_by_procedure("proc_Action_PR", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PR pr = new PR();
                    pr.ID_PR= Convert.ToInt32(row["ID"]);
                    pr.ID_PhongBan = Convert.ToInt32(row["ID_PhongBan"]);
                    if (tb.Columns.Contains("TenVietTat")==true)
                    {
                        pr.Ten_PhongBan = row["TenVietTat"].ToString();
                    }
                    pr.So_PR = Convert.ToInt32(row["SoPR"]);
                    pr.So_PR_Full = row["SoPR_Full"].ToString();
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
                    if(tb.Columns.Contains("TenHienThi")==true)
                    {
                        pr.Ten_Nguoi_De_Xuat = row["TenHienThi"].ToString();
                    }
                
                    pr.Tinh_Trang = Convert.ToInt32(row["TinhTrang"]);
                    if(!row.IsNull("PRScanFile"))
                    {
                        pr.PR_Scan_File = row["PRScanFile"].ToString();
                    }
                    pr.Sent_Mail = Convert.ToBoolean(row["SendMail"]);

                    if (!row.IsNull("TieuDe1"))
                    {
                        pr.Tieu_De_1= row["TieuDe1"].ToString();
                    }
                    if (!row.IsNull("TieuDe2"))
                    {
                        pr.Tieu_De_2 = row["TieuDe2"].ToString();
                    }
                    if (!row.IsNull("TieuDe3"))
                    {
                        pr.Tieu_De_3 = row["TieuDe3"].ToString();
                    }
                    if (!row.IsNull("TieuDe4"))
                    {
                        pr.Tieu_De_4 = row["TieuDe4"].ToString();
                    }
                    if (!row.IsNull("TieuDe5"))
                    {
                        pr.Tieu_De_5 = row["TieuDe5"].ToString();
                    }
                    if (!row.IsNull("TieuDe6"))
                    {
                        pr.Tieu_De_6 = row["TieuDe6"].ToString();
                    }
                    if (!row.IsNull("NganSachDuocDuyet1"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_1 = Convert.ToDouble(row["NganSachDuocDuyet1"]);
                    }
                    if (!row.IsNull("NganSachDuocDuyet2"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_2 = Convert.ToDouble(row["NganSachDuocDuyet2"]);
                    }
                    if (!row.IsNull("NganSachDuocDuyet3"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_3 = Convert.ToDouble(row["NganSachDuocDuyet3"]);
                    }
                    if (!row.IsNull("NganSachDuocDuyet4"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_4 = Convert.ToDouble(row["NganSachDuocDuyet4"]);
                    }
                    if (!row.IsNull("NganSachDuocDuyet5"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_5 = Convert.ToDouble(row["NganSachDuocDuyet5"]);
                    }
                    if (!row.IsNull("NganSachDuocDuyet6"))
                    {
                        pr.Ngan_Sach_Duoc_Duyet_6 = Convert.ToDouble(row["NganSachDuocDuyet6"]);
                    }
                    if (!row.IsNull("DeXuatLanNay1"))
                    {
                        pr.De_Xuat_Lan_Nay_1 = Convert.ToDouble(row["DeXuatLanNay1"]);
                    }
                    if (!row.IsNull("DeXuatLanNay2"))
                    {
                        pr.De_Xuat_Lan_Nay_2 = Convert.ToDouble(row["DeXuatLanNay2"]);
                    }
                    if (!row.IsNull("DeXuatLanNay3"))
                    {
                        pr.De_Xuat_Lan_Nay_3 = Convert.ToDouble(row["DeXuatLanNay3"]);
                    }
                    if (!row.IsNull("DeXuatLanNay4"))
                    {
                        pr.De_Xuat_Lan_Nay_4 = Convert.ToDouble(row["DeXuatLanNay4"]);
                    }
                    if (!row.IsNull("DeXuatLanNay5"))
                    {
                        pr.De_Xuat_Lan_Nay_5 = Convert.ToDouble(row["DeXuatLanNay5"]);
                    }
                    if (!row.IsNull("DeXuatLanNay6"))
                    {
                        pr.De_Xuat_Lan_Nay_6 = Convert.ToDouble(row["DeXuatLanNay6"]);
                    }
                    if (!row.IsNull("LuyKe1"))
                    {
                        pr.Luy_Ke_1 = Convert.ToDouble(row["LuyKe1"]);
                    }
                    if (!row.IsNull("LuyKe2"))
                    {
                        pr.Luy_Ke_2 = Convert.ToDouble(row["LuyKe2"]);
                    }
                    if (!row.IsNull("LuyKe3"))
                    {
                        pr.Luy_Ke_3 = Convert.ToDouble(row["LuyKe3"]);
                    }
                    if (!row.IsNull("LuyKe4"))
                    {
                        pr.Luy_Ke_4 = Convert.ToDouble(row["LuyKe4"]);
                    }
                    if (!row.IsNull("LuyKe5"))
                    {
                        pr.Luy_Ke_5 = Convert.ToDouble(row["LuyKe5"]);
                    }
                    if (!row.IsNull("LuyKe6"))
                    {
                        pr.Luy_Ke_6 = Convert.ToDouble(row["LuyKe6"]);
                    }
                    if (!row.IsNull("ThuaThieu1"))
                    {
                        pr.Thua_Thieu_1 = Convert.ToDouble(row["ThuaThieu1"]);
                    }
                    if (!row.IsNull("ThuaThieu2"))
                    {
                        pr.Thua_Thieu_2 = Convert.ToDouble(row["ThuaThieu2"]);
                    }
                    if (!row.IsNull("ThuaThieu3"))
                    {
                        pr.Thua_Thieu_3= Convert.ToDouble(row["ThuaThieu3"]);
                    }
                    if (!row.IsNull("ThuaThieu4"))
                    {
                        pr.Thua_Thieu_4 = Convert.ToDouble(row["ThuaThieu4"]);
                    }
                    if (!row.IsNull("ThuaThieu5"))
                    {
                        pr.Thua_Thieu_5 = Convert.ToDouble(row["ThuaThieu5"]);
                    }
                    if (!row.IsNull("ThuaThieu6"))
                    {
                        pr.Thua_Thieu_6 = Convert.ToDouble(row["ThuaThieu6"]);
                    }
                    pr_col.Add(pr);

                }
            }
            return pr_col;
        }

        public DataTable LayThongTinSoLuongPR(int tinhtrang, int id_bp, bool muahang, bool kho)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm2 = new SqlParameter("@id_bp", id_bp);
            SqlParameter pm3 = new SqlParameter("@muahang", muahang);
            SqlParameter pm4 = new SqlParameter("@kho", kho);

            SqlParameter[] param = new SqlParameter[4] { pm,pm2,pm3,pm4};
            DataTable tb = kn.get_by_procedure("proc_ThongTinPR_TinhTrang", param);

    

            return tb;
        }
        public DataTable PheDuyetPR(int id, DateTime ngayduyet,DateTime ngaynhan,int idnguoiduyet,int tinhtrang,string prscanfile)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id", id);
            SqlParameter pm2= new SqlParameter("@ngayduyet", ngayduyet);
            SqlParameter pm3 = new SqlParameter("@ngaynhan", ngaynhan);
            SqlParameter pm4 = new SqlParameter("@idnguoiduyet", idnguoiduyet);
            SqlParameter pm5 = new SqlParameter("@tinhtrang", tinhtrang);
            SqlParameter pm6 = new SqlParameter("@prscanfile", prscanfile);

            SqlParameter[] param = new SqlParameter[6] { pm, pm2, pm3, pm4, pm5, pm6 };
            DataTable tb = kn.get_by_procedure("proc_DuyetPR", param);



            return tb;
        }
        public DataTable DongPR(string so_pr_full)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@so_pr_full", so_pr_full);

            SqlParameter[] param = new SqlParameter[1] { pm};
            DataTable tb = kn.get_by_procedure("proc_Action_DongPR", param);

            return tb;
        }
        public DataTable BaoCaoSoLuongPRTheoThangTheoDonVi(int id_phongban, string tungay, string denngay)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
            SqlParameter pm2 = new SqlParameter("@tungay", tungay);
            SqlParameter pm3 = new SqlParameter("@denngay", denngay);
            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3 };
         
            DataTable tb = kn.get_by_procedure("proc_report_BaoCaoSoLuongPRTheoThangTheoDonVi", param);

            return tb;
        }
        public DataTable BaoCaoTrePR(int id_phongban, string tungay, string denngay)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
            SqlParameter pm2 = new SqlParameter("@tungay", tungay);
            SqlParameter pm3 = new SqlParameter("@denngay", denngay);
            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3 };

            DataTable tb = kn.get_by_procedure("proc_report_trePR", param);

            return tb;
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
        private string _so_pr_full;
        private DateTime _ngay_duyet_pr;
        private int _lead_time;
        private int _so_luong_con_lai;
        private int _nhom_mua_id;
        private string _nhom_mua_name;
        private string _nguoi_phu_trach_mua_hang;
        private int _vat;
        private bool _gia_nhap_tay;

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
        public string So_PR_Full
        {
            get { return _so_pr_full; }
            set { _so_pr_full = value; }
        }
        public DateTime Ngay_Duyet_PR
        {
            get { return _ngay_duyet_pr; }
            set { _ngay_duyet_pr = value; }
        }
        public int Lead_Time
        {
            get { return _lead_time; }
            set { _lead_time = value; }
        }
        public int So_Luong_Con_Lai
        {
            get { return _so_luong_con_lai; }
            set { _so_luong_con_lai = value; }
        }
        public int Nhom_Mua_ID
        {
            get { return _nhom_mua_id; }
            set { _nhom_mua_id = value; }
        }
        public string Nhom_Mua_Name
        {
            get { return _nhom_mua_name; }
            set { _nhom_mua_name = value; }
        }
        public string Nguoi_Phu_Trach_Mua_Hang
        {
            get { return _nguoi_phu_trach_mua_hang; }
            set { _nguoi_phu_trach_mua_hang = value; }
        }
        public int VAT
        {
            get { return _vat; }
            set { _vat = value; }
        }
        public bool GiaNhapTay
        {
            get { return _gia_nhap_tay; }
            set { _gia_nhap_tay = value; }
        }
        public List<PR_ChiTiet> LayDanhSachPR_ChTiet(int action, int id, int idpr, string mahang, string tenhang, string dvt, int tonkho, int soluongyeucau, double dongia, int tigia, double thanhtientamung, string nhacungcap, int tinhtrangvattu, string ngaycanhang, string thoigiansudung, string congdung,int leadtime, int nhommuaid, string nhommuaname,int vat, bool gianhaptay)
        {
            DateTime ngaych;
            if (string.IsNullOrEmpty(ngaycanhang) == true)
            {
                ngaych = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngaych = Convert.ToDateTime(ngaycanhang);
            }
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
            SqlParameter pm14 = new SqlParameter("@ngaycanhang", Convert.ToDateTime(ngaych));
            SqlParameter pm15 = new SqlParameter("@thoigiansudung", thoigiansudung);
            SqlParameter pm16 = new SqlParameter("@congdung", congdung);
            SqlParameter pm17 = new SqlParameter("@leadtime", leadtime);
            SqlParameter pm18 = new SqlParameter("@nhommuaid", nhommuaid);
            SqlParameter pm19 = new SqlParameter("@nhommuaname", nhommuaname);
            SqlParameter pm20 = new SqlParameter("@vat", vat);
            SqlParameter pm21 = new SqlParameter("@gianhaptay", gianhaptay);

            SqlParameter[] param = new SqlParameter[21] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9, pm10, pm11, pm12, pm13, pm14, pm15, pm16,pm17,pm18,pm19,pm20,pm21};
            DataTable tb = kn.get_by_procedure("proc_Action_PR_ChiTiet", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PR_ChiTiet pr_chitiet = new PR_ChiTiet();
                    pr_chitiet.ID_PR_Chi_Tiet= Convert.ToInt32(row["ID"]);
                    pr_chitiet.ID_PR = Convert.ToInt32(row["ID_PR"]);
                    pr_chitiet.Ma_Hang = row["MaHang"].ToString();
                    pr_chitiet.Ten_Hang = row["TenHang"].ToString();
                    pr_chitiet.DVT = row["DVT"].ToString();
                    pr_chitiet.Ton_Kho = Convert.ToInt32(row["TonKho"]);
                    pr_chitiet.So_Luong_Yeu_cau = Convert.ToInt32(row["SoLuongYeuCau"]);
                    pr_chitiet.Don_Gia = Convert.ToDouble(row["DonGia"]);
                    pr_chitiet.Ti_Gia = Convert.ToInt32(row["TiGia"]);
                    pr_chitiet.Thanh_Tien_Tam_Ung = Convert.ToDouble(row["ThanhTienTamUng"]);
                    pr_chitiet.Nha_Cung_cap = row["NhaCungCap"].ToString();
                    pr_chitiet.Tinh_Trang_Vat_Tu = Convert.ToInt32(row["TinhTrangVatTu"]);
                    pr_chitiet.Ngay_Can_Hang = Convert.ToDateTime(row["NgayCanHang"]);
                    pr_chitiet.Thoi_Gian_Xu_Dung = row["ThoiGianSuDung"].ToString();
                    pr_chitiet.Cong_Dung = row["CongDung"].ToString();
                    pr_chitiet.Lead_Time= Convert.ToInt32(row["LeadTime"]);
                    pr_chitiet.So_Luong_Con_Lai = Convert.ToInt32(row["SoLuongConLai"]);
                    pr_chitiet.Nhom_Mua_ID = 0;
                    if (!row.IsNull("NhomMuaID"))
                    {
                        pr_chitiet.Nhom_Mua_ID = Convert.ToInt32(row["NhomMuaID"]);
                    }
                   
                    if(row["NhomMuaName"]!=null)
                    {
                        pr_chitiet.Nhom_Mua_Name = row["NhomMuaName"].ToString();
                    }
                    else
                    {
                        pr_chitiet.Nhom_Mua_Name = "";
                    }
                    pr_chitiet.Nguoi_Phu_Trach_Mua_Hang = "";
                    if (!row.IsNull("NguoiPTMuaHang"))
                    {
                        pr_chitiet.Nguoi_Phu_Trach_Mua_Hang = row["NguoiPTMuaHang"].ToString();
                    }
                    pr_chitiet.VAT = 0;
                    if (!row.IsNull("VAT"))
                    {
                        pr_chitiet.VAT = Convert.ToInt32(row["VAT"].ToString());
                    }
                    pr_chitiet.GiaNhapTay = false;
                    if (!row.IsNull("GiaNhapTay"))
                    {
                        pr_chitiet.GiaNhapTay = Convert.ToBoolean(row["GiaNhapTay"]);
                    }
                    pr_Chitiet_col.Add(pr_chitiet);

                }
            }
            return pr_Chitiet_col;
        }
        public List<PR_ChiTiet> LayDanhSachPR_ChTiet_DaDuyet(int id_phongban)
        {
            DAC kn = new DAC();
            List<PR_ChiTiet> pr_Chitiet_col = new List<PR_ChiTiet>();

            SqlParameter pm = new SqlParameter("@id_phongban", id_phongban);
            //SqlParameter pm2 = new SqlParameter("@tinhtrangvattu", tinhtrangvattu);
           

            SqlParameter[] param = new SqlParameter[1] { pm};
            DataTable tb = kn.get_by_procedure("proc_LayDS_PR_PRChiTiet_DaDuyet", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PR_ChiTiet pr_chitiet = new PR_ChiTiet();
                    pr_chitiet.ID_PR_Chi_Tiet = Convert.ToInt32(row["ID"]);
                    pr_chitiet.ID_PR = Convert.ToInt32(row["ID_PR"]);
                    pr_chitiet.Ma_Hang = row["MaHang"].ToString();
                    pr_chitiet.Ten_Hang = row["TenHang"].ToString();
                    pr_chitiet.DVT = row["DVT"].ToString();
                    pr_chitiet.Ton_Kho = Convert.ToInt32(row["TonKho"]);
                    pr_chitiet.So_Luong_Yeu_cau = Convert.ToInt32(row["SoLuongYeuCau"]);
                    pr_chitiet.Don_Gia = Convert.ToDouble(row["DonGia"]);
                    pr_chitiet.Ti_Gia = Convert.ToInt32(row["TiGia"]);
                    pr_chitiet.Thanh_Tien_Tam_Ung = Convert.ToDouble(row["ThanhTienTamUng"]);
                    pr_chitiet.Nha_Cung_cap = row["NhaCungCap"].ToString();
                    pr_chitiet.Tinh_Trang_Vat_Tu = Convert.ToInt32(row["TinhTrangVatTu"]);
                    pr_chitiet.Ngay_Can_Hang = Convert.ToDateTime(row["NgayCanHang"]);
                    pr_chitiet.Thoi_Gian_Xu_Dung = row["ThoiGianSuDung"].ToString();
                    pr_chitiet.Cong_Dung = row["CongDung"].ToString();
                    pr_chitiet.So_PR_Full= row["SoPR_Full"].ToString();
                    pr_chitiet.Ngay_Duyet_PR= Convert.ToDateTime(row["NgayDuyet"]);
                    pr_chitiet.Lead_Time = Convert.ToInt32(row["leadtime"]);
                    pr_chitiet.So_Luong_Con_Lai = Convert.ToInt32(row["SoLuongConLai"]);

                    pr_chitiet.Nguoi_Phu_Trach_Mua_Hang = "";
                    if (!row.IsNull("NguoiPTMuaHang"))
                    {
                        pr_chitiet.Nguoi_Phu_Trach_Mua_Hang = row["NguoiPTMuaHang"].ToString();
                    }
                    pr_chitiet.VAT = 0;
                    if (!row.IsNull("VAT"))
                    {
                        pr_chitiet.VAT = Convert.ToInt32(row["VAT"].ToString());
                    }
                    pr_chitiet.GiaNhapTay = false;
                    if (!row.IsNull("GiaNhapTay"))
                    {
                        pr_chitiet.GiaNhapTay = Convert.ToBoolean(row["GiaNhapTay"]);
                    }
                    pr_Chitiet_col.Add(pr_chitiet);

                }
            }
            return pr_Chitiet_col;
        }
        public DataTable UpdateNguoiMuaHang(int id_pr_chitiet, string nguoimuahang)
        {
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@id_pr_chitiet", id_pr_chitiet);
            SqlParameter pm2 = new SqlParameter("@nguoimuahang", nguoimuahang);
       

            SqlParameter[] param = new SqlParameter[2] { pm, pm2};
            DataTable tb = kn.get_by_procedure("proc_Update_NguoiMuaHang", param);



            return tb;
        }
    }
}
