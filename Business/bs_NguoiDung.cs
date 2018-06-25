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
    public class NguoiDung
    {
        private int _id_nguoi_dung;
        private string _ten_hien_thi;
        private string _ten_dang_nhap;
        
        private int _id_phong_ban;
        private string _phong_ban;
        private string _email;
        private DateTime _ngay_tao;
        private int _quan_ly;
        private bool _dang_nhap_domain;
        private bool _dang_su_dung;
        private bool _admin;
        
        public int ID_NguoiDung
        {
            get
            {
                return _id_nguoi_dung;
            }
            set
            {
                _id_nguoi_dung=value;
            }
        }
        public string Ten_Hien_Thi
        {
            get
            {
                return _ten_hien_thi;
            }
            set
            {
                _ten_hien_thi = value;
            }

        }
        public string Ten_Dang_Nhap
        {
            get
            {
                return _ten_dang_nhap;
            }
            set
            {
                _ten_dang_nhap = value;
            }

        }
        
        public int ID_Phong_Ban
        {
            get
            {
                return _id_phong_ban;
            }
            set
            {
                _id_phong_ban = value;
            }
        }
        public string Phong_Ban
        {
            get
            {
                return _phong_ban;
            }
            set
            {
                _phong_ban = value;
            }
        }
        public string Email
        {
            get
            {
                return _email;
            }
            set
            {
                _email = value;
            }
        }
        public DateTime Ngay_Tao
        {
            get
            {
                return _ngay_tao;
            }
            set
            {
                _ngay_tao = value;
            }
        }
        
       
        public int Quan_Ly
        {
            get
            {
                return _quan_ly;
            }
            set
            {
                _quan_ly = value;
            }
        }
        public bool Dang_Nhap_Domain
        {
            get
            {
                return _dang_nhap_domain;
            }
            set
            {
                _dang_nhap_domain = value;
            }
        }
        public bool Dang_Su_Dung
        {
            get
            {
                return _dang_su_dung;
            }
            set
            {
                _dang_su_dung = value;
            }
        }
        public bool Admin
        {
            get
            {
                return _admin;
            }
            set
            {
                _admin = value;
            }
        }

        //Cac ham xu ly nguoi dung
        public NguoiDung()
        { }
        public NguoiDung LayThongTinNguoiDung(string tendangnhap)
        {
            NguoiDung nd = new NguoiDung();
            DAC kn = new DAC();
            
            SqlParameter pm = new SqlParameter("@tendangnhap", tendangnhap);
            SqlParameter[] param = new SqlParameter[1] {pm};
            DataTable tb= kn.get_by_procedure("proc_CheckAccount",param);
            if(tb!=null)
            {
                nd.ID_NguoiDung = Convert.ToInt16(tb.Rows[0]["ID"]);
                nd.Admin = Convert.ToBoolean( tb.Rows[0]["Admin"]);
                nd.Dang_Nhap_Domain= Convert.ToBoolean(tb.Rows[0]["DangNhapDomain"]);
                nd.Dang_Su_Dung = Convert.ToBoolean(tb.Rows[0]["DangSuDung"]);
                nd.Email = tb.Rows[0]["Email"].ToString();
                nd.ID_Phong_Ban= Convert.ToInt32(tb.Rows[0]["ID_PhongBan"]);
                nd.Ngay_Tao = Convert.ToDateTime(tb.Rows[0]["NgayTao"]);
                nd.Quan_Ly = Convert.ToInt16(tb.Rows[0]["QuanLy"]);
                nd.Ten_Hien_Thi = tb.Rows[0]["TenHienThi"].ToString();
                nd.Ten_Dang_Nhap = tb.Rows[0]["TenDangNhap"].ToString();
            }
            return nd;
        }
        public List<NguoiDung> LayDanhSachNguoiDung(int action,int id_nguoidung,string tendangnhap,string tenhienthi, string id_phongban, string email, DateTime ngaytao,int quanly, bool admin)
        {
            DAC kn = new DAC();
            List<NguoiDung> nguoidungs = new List<NguoiDung>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id_nguoidung", id_nguoidung);
            SqlParameter pm3 = new SqlParameter("@tendangnhap", tendangnhap);
            SqlParameter pm4 = new SqlParameter("@tenhienthi", tenhienthi);
            SqlParameter pm5 = new SqlParameter("@id_phongban", id_phongban);
            SqlParameter pm6 = new SqlParameter("@email", email);
            SqlParameter pm7 = new SqlParameter("@ngaytao", ngaytao);
            SqlParameter pm8 = new SqlParameter("@quanly", quanly);
            SqlParameter pm9 = new SqlParameter("@admin", admin);
            SqlParameter[] param = new SqlParameter[9] { pm, pm2, pm3, pm4, pm5, pm6, pm7, pm8, pm9 };
            DataTable tb = kn.get_by_procedure("proc_Action_NguoiDung", param);
            if(tb!=null)
            {
                foreach(DataRow row in tb.Rows)
                {
                    NguoiDung nguoidung = new NguoiDung();
                    nguoidung.Admin = Convert.ToBoolean(row["Admin"]);
                    nguoidung.Dang_Nhap_Domain = Convert.ToBoolean(row["DangNhapDomain"]);
                    nguoidung.Dang_Su_Dung = Convert.ToBoolean(row["DangSuDung"]);
                    nguoidung.Email = row["Email"].ToString();
                    nguoidung.ID_NguoiDung = Convert.ToInt16(row["ID"]);
                    nguoidung.ID_Phong_Ban = Convert.ToInt32(row["ID_PhongBan"]);
                    nguoidung.Phong_Ban = row["PhongBan"].ToString();
                    nguoidung.Ngay_Tao = Convert.ToDateTime(row["NgayTao"]);
                    nguoidung.Quan_Ly = Convert.ToInt16(row["QuanLy"]);
                    nguoidung.Ten_Dang_Nhap = row["TenDangNhap"].ToString();
                    nguoidung.Ten_Hien_Thi = row["TenHienThi"].ToString();

                    nguoidungs.Add(nguoidung);

                }
            }
            return nguoidungs;  
        }

    }
    
}
