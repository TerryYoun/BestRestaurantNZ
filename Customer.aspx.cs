using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm7 : System.Web.UI.Page
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

            DbLayer dao = new DbLayer();
            SqlDataReader reader = dao.GetAllUser();

            lbTest.Text += "<table style='border: 1px #000000 solid;'>";
            lbTest.Text += " <tr height='60px' style='background-color: yellow'> <th> User ID </th> <th> User Name </th> <th> User Email </th> <th> User Connection Count </th> <th> User Region </th> <th> EDIT USER </th> <th> EDIT PASSWORD </th> <th> DELETE </th> </tr>";
            while (reader.Read())
            {
                lbTest.Text += "<tr height='60px' style='background-color: #bfbeb8'>";
                lbTest.Text += "<td> " + reader.GetInt32(0) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(3) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(1) + "</td>";
                lbTest.Text += "<td style='text-align:center;'> " + reader.GetInt32(4) + "</td>";
                lbTest.Text += "<td> " + reader.GetString(5) + "</td>";
                lbTest.Text += "<td> <a href=UpdateUser.aspx?userID=" + reader.GetInt32(0) + "> EDIT USER </td>";
                lbTest.Text += "<td> <a href=UpdateUserPwd.aspx?userID=" + reader.GetInt32(0) + "> EDIT PASSWORD </td>";
                lbTest.Text += "<td> <a href=DeleteUser.aspx?userID=" + reader.GetInt32(0) + "> DELETE </td>";
                lbTest.Text += "</tr>";
            }

            lbTest.Text += " </table>";
            reader.Close();
            dao.closeConnection();
        }

    }
}