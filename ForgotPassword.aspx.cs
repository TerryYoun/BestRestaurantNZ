using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace BestRestaurantNZ
{
    public partial class WebForm26 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmailLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotRegister.aspx");
        }
    }
}