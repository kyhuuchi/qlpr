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
    public class VatTu
    {
        private Int64 _id_vat_tu;
        public Int64 ID_Vat_Tu
        {
            get { return _id_vat_tu; }
            set { _id_vat_tu = value; }
        }
        //Cac ham xu ly phong ban
        public VatTu()
        { }
        public List<VatTu> LayDanhSacVatTu(int action, int id_vattu)
        {
            DAC kn = new DAC();
            List<VatTu> vattu_col = new List<VatTu>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id_vattu);
          

            SqlParameter[] param = new SqlParameter[2] { pm, pm2};
            DataTable tb = kn.get_by_procedure("proc_Action_VatTu", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    VatTu vt = new VatTu();
                    vt.ID_Vat_Tu = Convert.ToInt64(row["id"]);
                    
                    vattu_col.Add(vt);

                }
            }
            return vattu_col;
        }
    }
}
