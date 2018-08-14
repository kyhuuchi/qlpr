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
    public class SoPO
    {
        private int _id_so_po;
        private int _id_phong_ban;
        private string _phong_ban;
        private int _so_po;
        private int _nam;

        public int ID_So_PO
        {
            get { return _id_so_po; }
            set { _id_so_po = value; }
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
        public int So_PO
        {
            get { return _so_po; }
            set { _so_po = value; }
        }
        public int Nam
        {
            get { return _nam; }
            set { _nam = value; }
        }

        ///Cac ham xu ly
        ///
        public SoPO LaySoPO(int phongban, int nam)
        {
            SoPO sopo = new SoPO();
            DAC kn = new DAC();

            SqlParameter pm = new SqlParameter("@action", 1);
            SqlParameter pm2 = new SqlParameter("@id", 1);
            SqlParameter pm3 = new SqlParameter("@idphongban", phongban);
            SqlParameter pm4 = new SqlParameter("@sopo", 1);
            SqlParameter pm5 = new SqlParameter("@nam", nam);
            SqlParameter[] param = new SqlParameter[5] { pm, pm2, pm3, pm4, pm5 };
            DataTable tb = kn.get_by_procedure("proc_Action_So_PO", param);
            if (tb != null)
            {
                if (tb.Rows.Count > 0)
                {
                    sopo.ID_So_PO = Convert.ToInt32(tb.Rows[0]["ID"]);
                    sopo.Phong_Ban = tb.Rows[0]["TenVietTat"].ToString();
                    sopo.So_PO = Convert.ToInt32(tb.Rows[0]["SoPO"]);
                    sopo.Nam = Convert.ToInt32(tb.Rows[0]["Nam"]);
                }


            }
            return sopo;
        }
        public List<SoPO> Action_SoPO(int action, int id, int idphongban, int sopo, int nam)
        {
            SoPO sopo2 = new SoPO();
            DAC kn = new DAC();
            List<SoPO> sopo_col = new List<SoPO>();

            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id);
            SqlParameter pm3 = new SqlParameter("@idphongban", idphongban);
            SqlParameter pm4 = new SqlParameter("@sopo", sopo);
            SqlParameter pm5 = new SqlParameter("@nam", nam);
            SqlParameter[] param = new SqlParameter[5] { pm, pm2, pm3, pm4, pm5 };
            DataTable tb = kn.get_by_procedure("proc_Action_So_PO", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    SoPO sp = new SoPO();
                    sp.ID_So_PO = Convert.ToInt32(tb.Rows[0]["ID"]);
                    sp.Phong_Ban = tb.Rows[0]["TenVietTat"].ToString();
                    sp.So_PO = Convert.ToInt32(tb.Rows[0]["SoPO"]);
                    sp.Nam = Convert.ToInt32(tb.Rows[0]["Nam"]);

                    sopo_col.Add(sp);

                }
            }
            return sopo_col;
        }
        public DataTable Check_SoPO(int sopo, int idphongban,int nam)
        {
            DAC kn = new DAC();
            
            SqlParameter pm = new SqlParameter("@sopo", sopo);
            SqlParameter pm2 = new SqlParameter("@idphongban", idphongban);
            SqlParameter pm3 = new SqlParameter("@nam", nam);
            SqlParameter[] param = new SqlParameter[3] { pm, pm2, pm3};
            DataTable data = kn.get("select * from Func_CheckSoPO(@sopo,@idphongban,@nam)", param);
            return data;
        }
    }
}
