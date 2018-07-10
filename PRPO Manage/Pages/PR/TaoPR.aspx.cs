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
            CallSAP();
        }
        protected void CallSAP()
        {
            //string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=710000318";
            string url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=T100";
          
            try
            {
                WebRequest request = WebRequest.Create(url);
                //request.Credentials = new NetworkCredential("sapuser", "password");
                WebResponse ws = request.GetResponse();
                
                string jsonString = string.Empty;
                using (System.IO.StreamReader sreader = new System.IO.StreamReader(ws.GetResponseStream()))
                {
                    jsonString = sreader.ReadToEnd();
                }
                var js = new JavaScriptSerializer();

                var dict = js.Deserialize<List<VatTu>>(jsonString);
             
                List<SelectOptions> players = new List<SelectOptions>();
                foreach (var item in dict)
                {
                    SelectOptions p = new SelectOptions(Convert.ToInt64(item.Ma_Vat_Tu), item.Ma_Vat_Tu + "-" + item.Ten_Vat_Tu);
                    players.Add(p);
                   // vt_col.Add(Convert.ToInt32(test_sap.InnerHtml + item["matnr"]), test_sap.InnerHtml + item["maktx"]);
                }
                select_mavattu.DataSource = players;
                select_mavattu.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
    public class SelectOptions
    {
       
        public Int64 id { get; set; }
       
        public string text { get; set; }
        public SelectOptions(Int64 ids, string texts)
        {
            id = ids;
            text = texts;
        }

    }

}