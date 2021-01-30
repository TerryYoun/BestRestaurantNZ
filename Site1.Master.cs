using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BestRestaurantNZ
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strCookieNmae = "";

            try
            {
                strCookieNmae = Request.Cookies["user"].Value;
                if (strCookieNmae.Length > 0)
                {
                    lbUserName.Text = "Welcome " + strCookieNmae;
                    btnConnect.Text = "Logout";
                }
                else
                {
                    lbUserName.Text = "Welcome Guest";
                    btnConnect.Text = "Login/Register";
                }
            }
            catch
            {
                lbUserName.Text = "Welcome Guest";
                btnConnect.Text = "Login/Register";
                //Response.Redirect("Login.aspx");
            }
        }

        protected void btnConnect_Click(object sender, EventArgs e)
        {
            try
            {
                HttpCookie aUser = new HttpCookie("user");
                aUser.Expires = DateTime.Now.AddDays(-3);
                Response.Cookies.Add(aUser);
                HttpCookie aid = new HttpCookie("id");
                aid.Expires = DateTime.Now.AddDays(-3);
                Response.Cookies.Add(aid);
                Response.Redirect("Default.aspx");
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}