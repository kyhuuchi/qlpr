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
    public class SoPR
    {
        private int _id_so_pr;
        private int _id_phong_ban;
        private string _phong_ban;
        private int _so_pr;
        private int _nam;

        public int ID_So_PR
        {
            get { return _id_so_pr; }
            set { _id_so_pr = value; }
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

        ///Cac ham xu ly
        ///
        public SoPR LaySoPR(int phongban, int nam)
        {
            SoPR sopr = new SoPR();
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@action", 1);
            SqlParameter pm2 = new SqlParameter("@id", 1);
            SqlParameter pm3 = new SqlParameter("@idphongban", phongban);
            SqlParameter pm4 = new SqlParameter("@sopr", 1);
            SqlParameter pm5 = new SqlParameter("@nam", nam);
            SqlParameter[] param = new SqlParameter[5] { pm,pm2,pm3,pm4,pm5 };
            DataTable tb = kn.get_by_procedure("proc_Action_So_PR", param);
            if (tb != null )
            {
                if(tb.Rows.Count > 0)
                {
                    sopr.ID_So_PR = Convert.ToInt32(tb.Rows[0]["ID"]);
                    sopr.Phong_Ban = tb.Rows[0]["TenVietTat"].ToString();
                    sopr.So_PR = Convert.ToInt32(tb.Rows[0]["SoPR"]);
                    sopr.Nam = Convert.ToInt32(tb.Rows[0]["Nam"]);
                }
                
              
            }
            return sopr;
        }
    }
}
