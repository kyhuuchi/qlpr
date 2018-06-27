using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using DB;

namespace Business
{
    public class Quyen
    {
        private int _id_quyen;
        private string _ten_quyen;
        private string _ma_quyen;
        public int ID_Quyen
        {
            get { return _id_quyen; }
            set { _id_quyen = value; }
        }
        public string Ten_Quyen
        {
            get { return _ten_quyen; }
            set { _ten_quyen = value; }
        }
        public string Ma_Quyen
        {
            get { return _ma_quyen; }
            set { _ma_quyen = value; }
        }
        //Cac ham xu ly phong ban
        public Quyen()
        { }
        public List<Quyen> LayDanhSachQuyen(int action, int id_quyen, string tenquyen, string maquyen)
        {
            DAC kn = new DAC();
            List<Quyen> quyen_col = new List<Quyen>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id_quyen);
            SqlParameter pm3 = new SqlParameter("@tenquyen", tenquyen);
            SqlParameter pm4 = new SqlParameter("@maquyen", maquyen);

            SqlParameter[] param = new SqlParameter[4] { pm, pm2, pm3, pm4 };
            DataTable tb = kn.get_by_procedure("proc_Action_Quyen", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    Quyen quyen = new Quyen();
                    quyen.ID_Quyen = Convert.ToInt16(row["ID"]);
                    quyen.Ten_Quyen = row["TenQuyen"].ToString();
                    quyen.Ma_Quyen = row["MaQuyen"].ToString();

                    quyen_col.Add(quyen);

                }
            }
            return quyen_col;
        }
    }
}
