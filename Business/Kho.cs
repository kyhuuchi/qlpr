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
    public class Kho
    {
        private int _id_kho;
        private string _so_nhap_kho;
        private int _so_luong;
        private int _so_ngay_tre;
        private DateTime _ngay_nhap_kho;
        private int _id_po;
        private int _id_po_chi_tiet;
        private string _so_po_full;
        private string _so_pr_full;

        public int ID_Kho
        {
            get { return _id_kho; }
            set { _id_kho = value; }
        }
        public string So_Nhap_Kho
        {
            get { return _so_nhap_kho; }
            set { _so_nhap_kho = value; }
        }
        public int So_Luong
        {
            get { return _so_luong; }
            set { _so_luong= value; }
        }
        public int So_Ngay_Tre
        {
            get { return _so_ngay_tre; }
            set { _so_ngay_tre = value; }
        }
        public DateTime Ngay_Nhap_Kho
        {
            get { return _ngay_nhap_kho; }
            set { _ngay_nhap_kho = value; }
        }
        public int ID_PO
        {
            get { return _id_po; }
            set { _id_po = value; }
        }
        public int ID_PO_Chi_Tiet
        {
            get { return _id_po_chi_tiet; }
            set { _id_po_chi_tiet = value; }
        }
        public string So_PO_Full
        {
            get { return _so_po_full; }
            set { _so_po_full = value; }
        }
        public string So_PR_Full
        {
            get { return _so_pr_full; }
            set { _so_pr_full = value; }
        }
        //** Cac ham lien quan  **//
        public List<Kho> LayDanhSachKho(int action, int id, string sonhapkho, int soluong,string ngaynhapkho, int id_po, int id_po_chi_tiet)
        {

            DateTime ngnhapkho;

            DAC kn = new DAC();
            List<Kho> kho_col = new List<Kho>();
            if (string.IsNullOrEmpty(ngaynhapkho) == true)
            {
                ngnhapkho = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
            else
            {
                ngnhapkho = Convert.ToDateTime(ngaynhapkho);
            }

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@sonhapkho", sonhapkho);
            SqlParameter pm4 = new SqlParameter("@soluong", soluong);
            SqlParameter pm5 = new SqlParameter("@ngaynhapkho", ngaynhapkho);
            SqlParameter pm6 = new SqlParameter("@id_po", id_po); 
            SqlParameter pm7 = new SqlParameter("@id_po_chitiet", id_po_chi_tiet); 
             SqlParameter[] param = new SqlParameter[7] { pm, pm2, pm3, pm4, pm5, pm6, pm7 };
            DataTable tb = kn.get_by_procedure("proc_Action_Kho", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    Kho kho = new Kho();
                    kho.ID_Kho = Convert.ToInt32(row["ID"]);
                    kho.So_Nhap_Kho = row["SoNhapKho"].ToString();
                    
                    kho.So_Luong = Convert.ToInt32(row["SoLuong"]);
                    kho.Ngay_Nhap_Kho = Convert.ToDateTime(row["NgayNhapKho"]);
                    kho.ID_PO = Convert.ToInt32(row["ID_PO"]);
                    kho.ID_PO_Chi_Tiet = Convert.ToInt32(row["ID_PO_ChiTiet"]);
                    kho.So_PO_Full = row["SoPO_Full"].ToString();
                    kho.So_PR_Full = row["SoPR_Full"].ToString();
                    kho_col.Add(kho);

                }
            }
            return kho_col;
        }
    }
}
