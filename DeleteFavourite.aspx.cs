using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm25 : System.Web.UI.Page
    {
        int favouriteID = 0;
        DbLayer db = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            favouriteID = int.Parse(Request.Params[0]);
            if (favouriteID <= 0)
            {
                Response.Redirect("Favourites.aspx");
            }

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetAllFavouriteByID(favouriteID);
                sr.Read();
                tbShopName.Text = sr.GetString(0);
                tbShopSubName.Text = sr.GetString(1);
                tbShopIntroduce.Text = sr.GetString(2);
                tbShopAddress.Text = sr.GetString(3);
                tbShopPhone.Text = sr.GetString(4);
                tbShopImage.ImageUrl = sr.GetString(5);
                favouriteID = sr.GetInt32(6);
                sr.Close();
                sr = null;
            }
            else
            {
                SqlDataReader sr = db.GetAllFavouriteByID(favouriteID);
                sr.Read();
                favouriteID = sr.GetInt32(6);
                sr.Close();
                sr = null;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Favourites.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            db.deleteFavourite(favouriteID);
            db.closeConnection();
            Response.Redirect("Favourites.aspx");
        }
    }
}