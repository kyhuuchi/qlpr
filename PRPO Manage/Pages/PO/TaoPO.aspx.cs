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
               // CallSAP_NCC();
                CallFileJSON_NCC();
            }
        }
        protected void CallSAP_NCC()
        {
            //string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=NCC";
            string url = "http://prd-app1.duytan.local:8100/sap/bc/ywsgpoitems?sap-client=900&MA=NCC";
            
            try
            {
                System.Net.WebRequest request = WebRequest.Create(url);
                //request.Credentials = new NetworkCredential("sapuser", "password");
                WebResponse ws = request.GetResponse();

                string jsonString = string.Empty;
                using (System.IO.StreamReader sreader = new System.IO.StreamReader(ws.GetResponseStream()))
                {
                    jsonString = sreader.ReadToEnd();
                }
                var js = new JavaScriptSerializer();
                txt_ncc.Value = jsonString;
                var dict = js.Deserialize<List<SelectOptionsNCC>>(jsonString);

                StringBuilder str_option_ncc = new StringBuilder();
                str_option_ncc.Append("<option></option>");

                List<SelectOptionsNCC> players = new List<SelectOptionsNCC>();
                foreach (var item in dict)
                {
                    str_option_ncc.AppendFormat("<option value='{0}'>{1}</option>", Convert.ToInt64(item.id), item.id + "--" + item.tn);
                }
                lit_nhacc.Text = str_option_ncc.ToString();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void CallFileJSON_NCC()
        {
            string jsonString = string.Empty;
            using (System.IO.StreamReader sreader = new System.IO.StreamReader(@"G:\du an\DuyTan\qlpr\PRPO Manage\Pages\ListNhaCC.json"))
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
                str_option_vattu.AppendFormat("<option value='{0}'>{1}</option>", Convert.ToInt64(item.id), item.id + "--" + item.tn);
            }
            lit_nhacc.Text = str_option_vattu.ToString();
        }
    }
    public class SelectOptionsNCC
    {
        public string id { get; set; }
        public string tn { get; set; }
      

    }
}