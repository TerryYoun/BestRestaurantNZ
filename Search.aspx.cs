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
    public partial class WebForm2 : System.Web.UI.Page
    {
        DbLayer db = null;
        String userName = "";

        public object LinkButton1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {
                userName = Request.Cookies["user"].Value;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            if (!this.IsPostBack)
            {
                String query = " SELECT " +
               " a.shopID,  " +
               " a.shopName,  " +
               " a.shopSubName,  " +
               " a.shopIntroduce,  " +
               " a.shopImage,  " +
               " ISNULL(tmp.favouriteShopID, 0) as favouriteShopID,     " +
               " ISNULL(tmp.favouriteShopID2, 0) as favouriteShopID2,   " +
               " tmp.favouriteID,  " +
               " tmp.userEmail " +
               "  from( " +
                   " select * from ( SELECT " +
                       " shopID, " +
                       " shopName, " +
                       " shopSubName, " +
                       " shopIntroduce, " +
                       " shopImage, " +
                       " ISNULL(favouriteShopID, '') as favouriteShopID, " +
                       " case when userEmail!= '" + userName + "' then 0 when userEmail is null then 2 else 1 End as favouriteShopID2, " +
                       " favouriteID,  " +
                       " userEmail " +
                       " FROM( " +
                           " SELECT shopID, " +
                               " shopName, " +
                               " shopSubName, " +
                               " shopIntroduce, " +
                               " shopImage, " +
                               " favouriteShopID, " +
                               " favouriteID, " +
                               " userEmail " +
                               " FROM( " +
                                   " SELECT a.shopID, " +
                                       " a.shopName, " +
                                       " a.shopSubName, " +
                                       " a.shopIntroduce, " +
                                       " a.shopImage, " +
                                       " ISNULL(b.shopID, '') as favouriteShopID, " +
                                       " b.favouriteID, " +
                                       " c.userEmail " +
                                           " FROM tblShop a " +
                                               " FULL OUTER JOIN tblFavourite b " +
                                                   " ON a.shopID = b.shopID " +
                                               " FULL OUTER JOIN tblUser c " +
                                                   " ON b.userEmail = c.userEmail " +
                               " ) tmp " +
                   " ) tmp WHERE 1 = 1 ) tmp where favouriteShopID2 > 0 and shopID is not null" +
         " ) tmp FULL OUTER JOIN tblShop a " +
         " ON a.shopID = tmp.shopID";

                if (tbSearch.Text.Length > 0)
                    query += " WHERE ( a.shopName like '%" + tbSearch.Text + "%' or a.shopSubName like '%" + tbSearch.Text + "%' or a.shopIntroduce like '%" + tbSearch.Text + "' )";

                query += " Order by a.shopID ";

                // Please need to modify connection string
                SqlConnection con = new SqlConnection("Data Source=09196482-YOUN;Initial Catalog=dbBrnz;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ListView1.DataSource = dt;
                ListView1.DataBind();
            }

   
        }

        private void addFavourite(int shopID)
        {
            string userName = Request.Cookies["user"].Value;
            db = new DbLayer();
            int nMaxFavourite = db.getMaxFavouriteID();
            db.insertFavourite(nMaxFavourite, userName, shopID);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            string userName = Request.Cookies["user"].Value;
            db = new DbLayer();
            int nMaxFavourite = db.getMaxFavouriteID() + 1;

            if (!db.insertFavourite(nMaxFavourite, userName, int.Parse(btn.CommandArgument.ToString())))
            {
                string script = "alert(\"Already Add Favourite!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }

            Response.Redirect("Search.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            db = new DbLayer();
            db.deleteFavourite(int.Parse(btn.CommandArgument.ToString()));
            Response.Redirect("Search.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String query = " SELECT " +
               " a.shopID,  " +
               " a.shopName,  " +
               " a.shopSubName,  " +
               " a.shopIntroduce,  " +
               " a.shopImage,  " +
               " ISNULL(tmp.favouriteShopID, 0) as favouriteShopID,     " +
               " ISNULL(tmp.favouriteShopID2, 0) as favouriteShopID2,   " +
               " tmp.favouriteID,  " +
               " tmp.userEmail " +
               "  from( " +
                   " select * from ( SELECT " +
                       " shopID, " +
                       " shopName, " +
                       " shopSubName, " +
                       " shopIntroduce, " +
                       " shopImage, " +
                       " ISNULL(favouriteShopID, '') as favouriteShopID, " +
                       " case when userEmail!= '" + userName + "' then 0 when userEmail is null then 2 else 1 End as favouriteShopID2, " +
                       " favouriteID,  " +
                       " userEmail " +
                       " FROM( " +
                           " SELECT shopID, " +
                               " shopName, " +
                               " shopSubName, " +
                               " shopIntroduce, " +
                               " shopImage, " +
                               " favouriteShopID, " +
                               " favouriteID, " +
                               " userEmail " +
                               " FROM( " +
                                   " SELECT a.shopID, " +
                                       " a.shopName, " +
                                       " a.shopSubName, " +
                                       " a.shopIntroduce, " +
                                       " a.shopImage, " +
                                       " ISNULL(b.shopID, '') as favouriteShopID, " +
                                       " b.favouriteID, " +
                                       " c.userEmail " +
                                           " FROM tblShop a " +
                                               " FULL OUTER JOIN tblFavourite b " +
                                                   " ON a.shopID = b.shopID " +
                                               " FULL OUTER JOIN tblUser c " +
                                                   " ON b.userEmail = c.userEmail " +
                               " ) tmp " +
                   " ) tmp WHERE 1 = 1 ) tmp where favouriteShopID2 > 0 and shopID is not null" +
         " ) tmp FULL OUTER JOIN tblShop a " +
         " ON a.shopID = tmp.shopID";

            if (tbSearch.Text.Length > 0)
            {
                if(DropDownList1.Text.Length > 0)
                {
                    switch (DropDownList1.Text)
                    {
                        case "All":
                            query += " WHERE ( a.shopName like '%" + tbSearch.Text + "%' " +
                                "or a.shopSubName like '%" + tbSearch.Text + "%' " +
                                "or a.shopIntroduce like '%" + tbSearch.Text + "%' " +
                                "or a.shopAddress like '%" + tbSearch.Text + "%' " +
                                "or a.shopPhone like '%" + tbSearch.Text + "%' " +
                                "or a.shopRegion like '%" + tbSearch.Text + "' )";
                            break;
                        case "Name":
                            query += " WHERE ( a.shopName like '%" + tbSearch.Text + "%' )";
                            break;
                        case "SubName":
                            query += " WHERE ( a.shopSubName like '%" + tbSearch.Text + "%' )";
                            break;
                        case "Introduce":
                            query += " WHERE ( a.shopIntroduce like '%" + tbSearch.Text + "%' )";
                            break;
                        case "Address":
                            query += " WHERE ( a.shopAddress like '%" + tbSearch.Text + "%' )";
                            break;
                        case "Phone":
                            query += " WHERE ( a.shopPhone like '%" + tbSearch.Text + "%' )";
                            break;
                        case "Region":
                            query += " WHERE ( a.shopRegion like '%" + tbSearch.Text + "%' )";
                            break;
                        default:
                            query += " WHERE ( a.shopName like '%" + tbSearch.Text + "%' " +
                                "or a.shopSubName like '%" + tbSearch.Text + "%' " +
                                "or a.shopIntroduce like '%" + tbSearch.Text + "%' " +
                                "or a.shopAddress like '%" + tbSearch.Text + "%' " +
                                "or a.shopPhone like '%" + tbSearch.Text + "%' " +
                                "or a.shopRegion like '%" + tbSearch.Text + "' )";
                            break;
                    }
                }
 
            }
                                         
            query += " Order by a.shopID ";

            // Please need to modify connection string
            SqlConnection con = new SqlConnection("Data Source=09196482-YOUN;Initial Catalog=dbBrnz;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }
}