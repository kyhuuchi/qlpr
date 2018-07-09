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
                var dict = js.Deserialize<List<Dictionary<string, string>>>(jsonString);
                foreach(var item in dict)
                {
                    test_sap.InnerHtml = test_sap.InnerHtml+item["matnr"]+"\n";
                }
                


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}