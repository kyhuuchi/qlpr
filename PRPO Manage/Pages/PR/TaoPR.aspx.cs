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


namespace PRPO_Manage.Pages.PR
{
   
    public partial class TaoPR : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                CallSAP();
                //CallFileJSON();
            }
            
        }
        protected void CallSAP()
        {
            //string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=710000318";
            //string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=T100";
            string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=TALL";

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
                txt_vattu.Value = jsonString;
                var dict = js.Deserialize<List<SelectOptions>>(jsonString);
                
                StringBuilder str_option_vattu = new StringBuilder();
                str_option_vattu.Append("<option></option>");
                List<SelectOptions> players = new List<SelectOptions>();
                foreach (var item in dict)
                {
                    str_option_vattu.AppendFormat("<option value='{0}'>{1}</option>", Convert.ToInt64(item.mvt), item.mvt + "--" + item.tvt);
                }
                lit_vattu.Text = str_option_vattu.ToString();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void CallFileJSON()
        {
            string jsonString = string.Empty;
            using (System.IO.StreamReader sreader = new System.IO.StreamReader("G:/du an/DuyTan/qlpr/PRPO Manage/Pages/PR/ListVatTu.json"))
            {
                jsonString = sreader.ReadToEnd();
            }
            var js = new JavaScriptSerializer();
            txt_vattu.Value = jsonString;
            var dict = js.Deserialize<List<SelectOptions>>(jsonString);

            StringBuilder str_option_vattu = new StringBuilder();
            str_option_vattu.Append("<option></option>");
            List<SelectOptions> players = new List<SelectOptions>();
            foreach (var item in dict)
            {
                str_option_vattu.AppendFormat("<option value='{0}'>{1}</option>", Convert.ToInt64(item.mvt), item.mvt + "--" + item.tvt);
            }
            lit_vattu.Text = str_option_vattu.ToString();
        }
    }
    public class SelectOptions
    {
        public string mvt { get; set; }
        //public string bismt { get; set; }
        public string tvt { get; set; }
        public string dvt { get; set; }
        public string dvt1 { get; set; }
        public string nvt { get; set; }
        public string nvt1 { get; set; }

    }

}