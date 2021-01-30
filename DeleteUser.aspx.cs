using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        DbLayer db = null;
        int userID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }

            userID = int.Parse(Request.Params[0]);
            if (userID <= 0)
            {
                Response.Redirect("Customer.aspx");
            }

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetUserByID(userID);
                sr.Read();
                tbUserName.Text = sr.GetString(3);
                tbEmail.Text = sr.GetString(1);
                tbRegion.Text = sr.GetString(5);
                sr.Close();
                sr = null;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            db.DeleteUser(userID);
            db.closeConnection();
            Response.Redirect("Customer.aspx");
        }
    }
}