using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DB;
namespace Business
{
    public class ModuleQuyen
    {
        private int _id_module_quyen;
        private int _id_nguoi_dung;
        private string _ten_nguoi_dung;
        private string _module;
        private int _id_quyen;
        private string _ten_quyen;
        public int ID_Module_Quyen
        {
            get { return _id_module_quyen; }
            set { _id_module_quyen = value; }
        }
        public int ID_Nguoi_Dung
        {
            get { return _id_nguoi_dung; }
            set { _id_nguoi_dung = value; }
        }
        public string Ten_Nguoi_Dung
        {
            get { return _ten_nguoi_dung; }
            set { _ten_nguoi_dung = value; }
        }
        public string Module
        {
            get { return _module; }
            set { _module = value; }
        }
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
        //Cac ham xu ly phong ban
        public ModuleQuyen()
        { }
        public List<ModuleQuyen> LayDanhSachModuleQuyen(int action, int id_module_quyen, int id_nguoidung, string module,int id_quyen)
        {
            DAC kn = new DAC();
            List<ModuleQuyen> quyen_col = new List<ModuleQuyen>();
            SqlParameter pm = new SqlParameter("@action", action);
            SqlParameter pm2 = new SqlParameter("@id", id_module_quyen);
            SqlParameter pm3 = new SqlParameter("@id_nguoidung", id_nguoidung);
            SqlParameter pm4 = new SqlParameter("@module", module);
            SqlParameter pm5 = new SqlParameter("@id_quyen", id_quyen);
            SqlParameter[] param = new SqlParameter[5] { pm, pm2, pm3, pm4,pm5 };
            DataTable tb = kn.get_by_procedure("proc_Action_ModuleQuyen", param);
            if (tb != null)
            {
                foreach (DataRow row in tb.Rows)
                {
                    ModuleQuyen module_quyen = new ModuleQuyen();
                    module_quyen.ID_Module_Quyen = Convert.ToInt16(row["ID"]);
                    module_quyen.Ten_Nguoi_Dung = row["TenHienThi"].ToString();
                    module_quyen.Module = row["Module"].ToString();
                    module_quyen.Ten_Quyen = row["TenQuyen"].ToString();

                    quyen_col.Add(module_quyen);

                }
            }
            return quyen_col;
        }
    }
}
