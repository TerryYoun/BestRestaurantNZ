using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        DbLayer db = null;
        int menuID = 0;
        int shopID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }

            menuID = int.Parse(Request.Params[0]);
            if (menuID <= 0)
            {
                Response.Redirect("Menu.aspx");
            }

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetMenuByID(menuID);
                sr.Read();
                shopID = sr.GetInt32(1);
                tbMenuName.Text = sr.GetString(2);
                tbMenuPrice.Text = sr.GetDouble(3).ToString();
                tbMenuDesc.Text = sr.GetString(4);
                if(sr.GetString(5).Equals("1"))
                    tbMenuPromo.Text = "TRUE";
                else
                    tbMenuPromo.Text = "FALSE";
                tbMenuPromoPrice.Text = sr.GetDouble(6).ToString();
                Image1.ImageUrl = sr.GetString(7);
                sr.Close();
                sr = null;
            }
            else
            {
                SqlDataReader sr = db.GetMenuByID(menuID);
                sr.Read();
                shopID = sr.GetInt32(1);
                sr.Close();
                sr = null;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            db.DeleteMenu(menuID);
            db.closeConnection();
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }
    }
}