using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        String strCookieNmae = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                strCookieNmae = Request.Cookies["user"].Value;
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            //if (!this.IsPostBack)
            { 

                DbLayer dao = new DbLayer();
                SqlDataReader reader = dao.GetAllFavourite(strCookieNmae);

                lbTest.Text += "<table style='border: 1px #000000 solid;'>";
                lbTest.Text += " <tr><td colspan='7' height='60px' style='font-size:x-large;text-align: center;color: blue;'><strong>" + strCookieNmae + " Favourite List</strong></td></tr> ";
                lbTest.Text += " <tr style='background-color: yellow'> <th> Shop Name </th> <th> Shop SubName </th> <th> Shop Introduce </th> <th> Shop Address </th> <th> Shop Phone </th> <th> Shop Image </th> <th> DELETE </th> </tr>";

                while (reader.Read())
                {
                    lbTest.Text += "<tr style='background-color: #bfbeb8'>";
                    lbTest.Text += "<td> " + reader.GetString(0) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(1) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(2) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(3) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(4) + "</td>";
                    lbTest.Text += "<td><img src='" + reader.GetString(5) + "' width='100px' height='100px' /></td>";
                    lbTest.Text += "<td style='text-align:center;'> <a href=DeleteFavourite.aspx?favouriteID=" + reader.GetInt32(6) + "> DELETE </td>";
                    lbTest.Text += "</tr>";
                }

                lbTest.Text += " </table>";
                reader.Close();
                dao.closeConnection();
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            DbLayer dao = new DbLayer();
            dao.deleteAllFavourite(strCookieNmae);
            dao.closeConnection();
            Response.Redirect("Favourites.aspx");
        }
    }
}