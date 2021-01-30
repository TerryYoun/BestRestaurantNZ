using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BestRestaurantNZ
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DbLayer db = new DbLayer();
            String id = tbLoginId.Text;

            string passwordHashSha256 = db.getUserPwd(id);

            if (passwordHashSha256 == null)
            {
                string script = "alert(\"Try Again!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }

            // Hashing Password
            string pwd = "";

            if (id.Length / 3 == 0)
                pwd = SimpleHash.VerifyHash(tbLoginPwd.Text, "SHA2", passwordHashSha256).ToString();
            else if (id.Length / 3 == 2)
                pwd = SimpleHash.VerifyHash(tbLoginPwd.Text, "SHA256", passwordHashSha256).ToString();
            else
                pwd = SimpleHash.VerifyHash(tbLoginPwd.Text, "SHA512", passwordHashSha256).ToString();

            if (pwd.Equals("False"))
            {
                string script = "alert(\"Try Again!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }
            else
            {
                Response.Cookies["user"].Value = id;
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(3);
                db.updateUserConnectionCount(id);

                if (!id.Equals("admin@brnz.co.nz"))
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Restaurant.aspx");
                }
                
            }
        }

        protected void btnLoginRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

    }
}