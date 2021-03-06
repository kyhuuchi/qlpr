﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using System.Text;
using Newtonsoft.Json;

namespace PRPO_Manage.Pages.PR
{
    public partial class SuaPR : System.Web.UI.Page
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
            //sring url = "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=TALL";
            string url = "http://prd-app1.duytan.local:8100/sap/bc/ywsgpoitems?sap-client=900&MA=TALL";
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
                
                //var js = new JavaScriptSerializer();
                txt_vattu.Value = jsonString;
                //var dict = js.Deserialize<List<SelectOptions>>(jsonString);
                var dict = JsonConvert.DeserializeObject<List<SelectOptions>>(jsonString);
                StringBuilder str_option_vattu = new StringBuilder();
                str_option_vattu.Append("<option></option>");
                str_option_vattu.Append("<option  value='0'>Không mã</option>");
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
   
}