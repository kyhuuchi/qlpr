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
        //private Int64 _id_vat_tu;

        public string matnr { get; set; }
        public string bismt { get; set; }
        public string maktx { get; set; }
        public string meins { get; set; }
        public string mseht { get; set; }
        public string matkl { get; set; }
        public string wgbez { get; set; }

        public string Ma_Vat_Tu
        {
            get { return matnr; }
            set { matnr = value; }
        }
        public string Ma_Vat_Tu_Cu
        {
            get { return bismt; }
            set { bismt = value; }
        }
        public string Ten_Vat_Tu
        {
            get { return maktx; }
            set { maktx = value; }
        }
        public string Don_Vi_Tinh
        {
            get { return meins; }
            set { meins = value; }
        }
        public string Mseht
        {
            get { return mseht; }
            set { mseht = value; }
        }
        public string Matkl
        {
            get { return matkl; }
            set { matkl = value; }
        }
        public string Wgbez
        {
            get { return wgbez; }
            set { wgbez = value; }
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
                   // vt.ID_Vat_Tu = Convert.ToInt64(row["id"]);
                    
                    vattu_col.Add(vt);

                }
            }
            return vattu_col;
        }
    }
}
