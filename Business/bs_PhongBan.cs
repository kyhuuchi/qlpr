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
    class PhongBan
    {
        private int _id_phong_ban;
        private string _ten_phong_ban;
        private string _ten_viet_tat;
        public int ID_PhongBan
        {
            get { return _id_phong_ban; }
            set { _id_phong_ban = value; }
        }
        public string Ten_Phong_Ban
        {
            get { return _ten_phong_ban; }
            set { _ten_phong_ban = value; }
        }
        public string Ten_Viet_Tat
        {
            get { return _ten_viet_tat; }
            set { _ten_viet_tat = value; }
        }
        //Cac ham xu ly phong ban
        public PhongBan ()
        { }
        public List<PhongBan> LayDanhSachPhongBan(int action, int id_phongban, string tenphongban, string tenviettat)
        {
            DAC kn = new DAC();
            List<PhongBan> phongbans = new List<PhongBan>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id_phongban);
            SqlParameter pm3 = new SqlParameter("@tenphongban", tenphongban);
            SqlParameter pm4 = new SqlParameter("@tenviettat", tenviettat);
            
            SqlParameter[] param = new SqlParameter[4] { pm, pm2, pm3, pm4};
            DataTable tb = kn.get_by_procedure("proc_Action_PhongBan", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    PhongBan phongban = new PhongBan();
                    phongban.ID_PhongBan = Convert.ToInt16(row["ID"]);
                    phongban.Ten_Phong_Ban = row["TenPhongBan"].ToString();
                    phongban.Ten_Viet_Tat = row["TenVietTat"].ToString();

                    phongbans.Add(phongban);

                }
            }
            return phongbans;
        }
    }
}
