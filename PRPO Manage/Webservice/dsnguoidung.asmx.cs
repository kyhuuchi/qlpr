﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Business;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace PRPO_Manage.Webservice
{
    /// <summary>
    /// Summary description for dsnguoidung
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class dsnguoidung : System.Web.Services.WebService
    {

        [WebMethod]
        public void LayDSNguoiDung()
        {
            NguoiDung nguoidung = new NguoiDung();
            List<NguoiDung> tb= nguoidung.LayDanhSachNguoiDung(1,0,"","","","",DateTime.Now,0,false);
            var js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(tb));
        }
    }
}
