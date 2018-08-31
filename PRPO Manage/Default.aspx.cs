using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRPO_Manage
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if(!WindowsIdentity.GetCurrent().IsAuthenticated)
            {
                Response.Redirect("/Account/Login?ReturnUrl=%2fDefault");
            }
        }
    }
}