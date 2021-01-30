using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BestRestaurantNZ
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }
        }

      
    }
}