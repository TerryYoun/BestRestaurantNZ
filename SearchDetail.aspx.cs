using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        int shopID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            shopID = int.Parse(Request.Params[0]);
            if (shopID <= 0)
            {
                Response.Redirect("Default.aspx");
            }

            DbLayer dao = new DbLayer();
            SqlDataReader reader = dao.GetAllMenu(shopID);

            lbTest.Text += "<table style='border: 1px #000000 solid;'>";
            lbTest.Text += " <tr style='background-color: yellow'> <th> Menu ID </th> <th> Menu Name </th> <th> Menu Price </th> <th> Menu Desc </th> <th> Image </th> </tr>";

            while (reader.Read())
            {
                lbTest.Text += "<tr style='background-color: #bfbeb8'>";
                lbTest.Text += "<td> " + reader.GetInt32(0) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(2) + "</td>";
                lbTest.Text += "<td> " + reader.GetDouble(3) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(4) + "</td>";
                lbTest.Text += "<td><img src='" + reader.GetString(5) + "' width='100px' height='100px' /></td>";
                 lbTest.Text += "</tr>";
            }

            lbTest.Text += " </table>";
            reader.Close();
            dao.closeConnection();
        }

    }
}