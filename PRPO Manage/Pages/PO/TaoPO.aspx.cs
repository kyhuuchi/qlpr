using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Text;

namespace PRPO_Manage.Pages.PO
{
    public partial class TaoPO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                CallFileJSON_NCC();
            }
        }
        protected void CallFileJSON_NCC()
        {
            string jsonString = string.Empty;
            using (System.IO.StreamReader sreader = new System.IO.StreamReader(@"D:\SourceCode\PRPO Manage\qlpr\PRPO Manage\Pages\ListNhaCC.json"))
            {
                jsonString = sreader.ReadToEnd();
            }
            var js = new JavaScriptSerializer();
            txt_ncc.Value = jsonString;
            var dict = js.Deserialize<List<SelectOptionsNCC>>(jsonString);

            StringBuilder str_option_vattu = new StringBuilder();
            str_option_vattu.Append("<option></option>");
            List<SelectOptionsNCC> players = new List<SelectOptionsNCC>();
            foreach (var item in dict)
            {
                str_option_vattu.AppendFormat("<option value='{0}'>{1}</option>", Convert.ToInt64(item.matnr), item.matnr + "--" + item.maktx);
            }
            lit_nhacc.Text = str_option_vattu.ToString();
        }
    }
    public class SelectOptionsNCC
    {
        public string MaNCC { get; set; }
        public string TenNCC { get; set; }
      

    }
}