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
    public partial class WebForm6 : System.Web.UI.Page
    {
        String userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userName = Request.Cookies["user"].Value;

                if (!userName.Equals("admin@brnz.co.nz"))
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }

            if (!this.IsPostBack)
            {
                DbLayer dao = new DbLayer();
                SqlDataReader reader = dao.GetAllShop(DropDownList1.Text, tbSearch.Text);

                lbTest.Text += "<table style='border: 1px #000000 solid;'>";
                lbTest.Text += " <tr style='background-color: yellow'> <th> Shop ID </th> <th> Shop Name </th> <th> Shop SubName </th> <th> Shop Introduce </th> <th> Shop Address </th> <th> Shop Phone </th> <th> Shop Region </th> <th> Image </th> <th> EDIT </th> <th> DELETE </th> <th> VIEW MENU </th> </tr>";

                while (reader.Read())
                {
                    lbTest.Text += "<tr style='background-color: #bfbeb8'>";
                    lbTest.Text += "<td> " + reader.GetInt32(0) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(1) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(2) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(3) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(4) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(5) + "</td>";
                    lbTest.Text += "<td> " + reader.GetString(6) + "</td>";
                    lbTest.Text += "<td><img src='" + reader.GetString(7) + "' width='100px' height='100px' /></td>";
                    lbTest.Text += "<td style='text-align:center;'> <a href=UpdateShop.aspx?shopID=" + reader.GetInt32(0) + "> EDIT </td>";
                    lbTest.Text += "<td style='text-align:center;'> <a href=DeleteShop.aspx?shopID=" + reader.GetInt32(0) + "> DELETE </td>";
                    lbTest.Text += "<td style='text-align:center;'> <a href=menu.aspx?shopID=" + reader.GetInt32(0) + "> GO </td>";
                    lbTest.Text += "</tr>";
                }

                lbTest.Text += " </table>";
                reader.Close();
                dao.closeConnection();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddShop.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            DbLayer dao = new DbLayer();
            SqlDataReader reader = dao.GetAllShop(DropDownList1.Text, tbSearch.Text);

            lbTest.Text = "";

            lbTest.Text += "<table style='border: 1px #000000 solid;'>";
            lbTest.Text += " <tr style='background-color: yellow'> <th> Shop ID </th> <th> Shop Name </th> <th> Shop SubName </th> <th> Shop Introduce </th> <th> Shop Address </th> <th> Shop Phone </th> <th> Shop Region </th> <th> Image </th> <th> EDIT </th> <th> DELETE </th> <th> VIEW MENU </th> </tr>";

            while (reader.Read())
            {
                lbTest.Text += "<tr style='background-color: #bfbeb8'>";
                lbTest.Text += "<td> " + reader.GetInt32(0) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(1) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(2) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(3) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(4) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(5) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(6) + "</td>";
                lbTest.Text += "<td><img src='" + reader.GetString(7) + "' width='100px' height='100px' /></td>";
                lbTest.Text += "<td style='text-align:center;'> <a href=UpdateShop.aspx?shopID=" + reader.GetInt32(0) + "> EDIT </td>";
                lbTest.Text += "<td style='text-align:center;'> <a href=DeleteShop.aspx?shopID=" + reader.GetInt32(0) + "> DELETE </td>";
                lbTest.Text += "<td style='text-align:center;'> <a href=menu.aspx?shopID=" + reader.GetInt32(0) + "> GO </td>";
                lbTest.Text += "</tr>";
            }

            lbTest.Text += " </table>";
            reader.Close();
            dao.closeConnection();
        }
    }
}