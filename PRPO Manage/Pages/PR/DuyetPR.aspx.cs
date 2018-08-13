using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using Business;
using System.Data;

namespace PRPO_Manage.Pages.PR
{
    public partial class DuyetPR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btt_OK_Click(object sender, EventArgs e)
        {
            //Access the File using the Name of HTML INPUT File.
            HttpPostedFile postedFile = Request.Files["uploadfile"];

            //Check if File is available.
            if (postedFile != null && postedFile.ContentLength > 0)
            {
                //Save the File.
                string filePath = Server.MapPath("~/upload/") + Path.GetFileName(postedFile.FileName);
                postedFile.SaveAs(filePath);
                try
                {
                    string value = id_nguoi_duyet.Value;


                    Business.PR pr = new Business.PR();
                    DataTable tb = pr.PheDuyetPR(Convert.ToInt32(id_pr.Value), Convert.ToDateTime(ngayduyetpr_hid.Value), Convert.ToDateTime(ngaynhanpr_hid.Value), Convert.ToInt32(value), 3, postedFile.FileName);
                    Response.Write("<script language='javascript'>alert('Đã cập nhật thông tin phê duyệt của PR');window.location.href='../../default.aspx';</script>");
                    
                }
                catch (Exception ex)
                {
                    Context.Response.Write(ex.ToString());
                }
            }
        }
    }
}