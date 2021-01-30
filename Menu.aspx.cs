using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        int shopID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            shopID = int.Parse(Request.Params[0]);
            if (shopID <= 0)
            {
                Response.Redirect("Restaurant.aspx");
            }

            DbLayer dao = new DbLayer();
            SqlDataReader reader = dao.GetAllMenu(shopID);

            lbTest.Text += "<table style='border: 1px #000000 solid;'>";
            lbTest.Text += " <tr style='background-color: yellow'> <th> Menu ID </th> <th> Menu Name </th> <th> Menu Price </th> <th> Menu Desc </th> <th> Promotion </th> <th> Promotion Price </th> <th> Image </th> <th> EDIT </th> <th> DELETE </th> </tr>";

            while (reader.Read())
            {
                lbTest.Text += "<tr style='background-color: #bfbeb8'>";
                lbTest.Text += "<td> " + reader.GetInt32(0) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(2) + "</td>";
                lbTest.Text += "<td> " + reader.GetDouble(3) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(4) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(5) + "</td>";
                lbTest.Text += "<td> " + reader.GetDouble(6) + "</td>";
                lbTest.Text += "<td><img src='" + reader.GetString(7) + "' width='100px' height='100px' /></td>";
                lbTest.Text += "<td style='text-align:center;'> <a href=UpdateMenu.aspx?menuID=" + reader.GetInt32(0) + "> EDIT </td>";
                lbTest.Text += "<td style='text-align:center;'> <a href=DeleteMenu.aspx?menuID=" + reader.GetInt32(0) + "> DELETE </td>";
                lbTest.Text += "</tr>";
            }

            lbTest.Text += " </table>";
            reader.Close();
            dao.closeConnection();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMenu.aspx?shopID=" + shopID);
        }
    }
}