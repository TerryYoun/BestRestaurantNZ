using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BestRestaurantNZ
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            String strCookieNmae = "";

            try
            {
                strCookieNmae = Request.Cookies["user"].Value;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            // Please need to modify connection string
            SqlConnection con = new SqlConnection("Data Source=09196482-YOUN;Initial Catalog=dbBrnz;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblShop where 1=1", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Please need to modify connection string
            SqlConnection con = new SqlConnection("Data Source=09196482-YOUN;Initial Catalog=dbBrnz;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblShop where 1=1 and shopRegion like '" + DropDownList1.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }
}