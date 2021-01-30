using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace BestRestaurantNZ
{
    public partial class WebForm18 : System.Web.UI.Page
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
                tbRegName.Text = sr.GetString(3);
                tbRegEmail.Text = sr.GetString(1);
                DropDownList1.SelectedValue = sr.GetString(5);
                sr.Close();
                sr = null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DbLayer db = new DbLayer();

            String name = tbRegName.Text;
            String email = tbRegEmail.Text;
            string pwd = "";

            String region = DropDownList1.Text;

            // Validation UserID
            bool bCheckID = db.checkUserID(email);
            /*
            if (!bCheckID)
            {
                string script = "alert(\"The username already exists. Please use a different username.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            } //A1contact!  
            */

            int id = db.getMaxUser();
            db.UpdateUser(id, email, name, region);

            //Response.Cookies["user"].Value = email;
            //Response.Cookies["user"].Expires = DateTime.Now.AddDays(3);
            Response.Redirect("Customer.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}