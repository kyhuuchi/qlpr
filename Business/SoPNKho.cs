using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB;
using System.Data;
using System.Data.SqlClient;

namespace Business
{
    public class SoPNKho
    {
        private int id_so_phieu_nhap;
        private int _id_phong_ban;
        private string _phong_ban;
        private int _so_phieu_nhap_kho;
        private int _nam;
        public int ID_So_Phieu_Nhap
        {
            get { return id_so_phieu_nhap; }
            set { id_so_phieu_nhap = value; }
        }
        public int ID_Phong_Ban
        {
            get { return _id_phong_ban; }
            set { _id_phong_ban = value; }
        }
        public string Phong_Ban
        {
            get { return _phong_ban; }
            set { _phong_ban = value; }
        }
        public int So_Phieu_Nhap_Kho
        {
            get { return _so_phieu_nhap_kho; }
            set { _so_phieu_nhap_kho = value; }
        }
        public int Nam
        {
            get { return _nam; }
            set { _nam = value; }
        }
        ///Cac ham xu ly
        ///

        public List<SoPNKho> Action_SoPNKho(int action, int id, int idphongban, int sophieunhap, int nam)
        {
            
            DAC kn = new DAC();
            List<SoPNKho> sopnkho_col = new List<SoPNKho>();

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idphongban", idphongban);
            SqlParameter pm4 = new SqlParameter("@sophieunhap", sophieunhap);
            SqlParameter pm5 = new SqlParameter("@nam", nam);
            SqlParameter[] param = new SqlParameter[5] { pm, pm2, pm3, pm4, pm5 };
            DataTable tb = kn.get_by_procedure("proc_Action_So_PhieuNhapKho", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    SoPNKho sp = new SoPNKho();
                    sp.ID_So_Phieu_Nhap = Convert.ToInt32(tb.Rows[0]["ID"]);
                    sp.Phong_Ban = tb.Rows[0]["TenVietTat"].ToString();
                    sp.So_Phieu_Nhap_Kho = Convert.ToInt32(tb.Rows[0]["SoPNKho"]);
                    sp.Nam = Convert.ToInt32(tb.Rows[0]["Nam"]);


                    sopnkho_col.Add(sp);

                }
            }
            return sopnkho_col;
        }
        //public DataTable Check_SoPNKho(int sophieunhap, int idphongban, int nam)
        //{
        //    DAC kn = new DAC();

        //    SqlParameter pm = new SqlParameter("@sophieunhap", sophieunhap);
        //    SqlParameter pm2 = new SqlParameter("@idphongban", idphongban);
        //    SqlParameter pm3 = new SqlParameter("@nam", nam);
        //    SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3 };
        //    DataTable data = kn.get("select * from Func_CheckSoPO(@sopo,@idphongban,@nam)", param);
        //    return data;
        //}
    }
}
