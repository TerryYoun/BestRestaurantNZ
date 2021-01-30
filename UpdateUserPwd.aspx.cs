using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BestRestaurantNZ
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        int userID = 0;
        DbLayer db = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }

            userID = int.Parse(Request.Params[0]);
            if (userID <= 0)
            {
                Response.Redirect("Customer.aspx");
            }

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetUserByID(userID);
                sr.Read();
                tbUserName.Text = sr.GetString(3);
                tbEmail.Text = sr.GetString(1);
                sr.Close();
                sr = null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DbLayer db = new DbLayer();

            // Validation Old Password
            bool bCheckPwdOld = PasswordCheck.IsValidPassword(tbOldPwd.Text, 8, 4, true, true, true, true);
            if (!bCheckPwdOld)
            {
                string script = "alert(\"At least 8 characters, all strong conditions met (>= 8 chars with 1 or more UC letters, LC letters, digits & special chars)\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            } //A1contact!

            string passwordHashSha256 = db.getUserPwd(tbEmail.Text);

            if (passwordHashSha256 == null)
            {
                string script = "alert(\"Try Again!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }

            // Hashing Password
            string pwdOldCheck = "";

            if (Request.Cookies["user"].Value.Length / 3 == 0)
                pwdOldCheck = SimpleHash.VerifyHash(tbOldPwd.Text, "SHA2", passwordHashSha256).ToString();
            else if (Request.Cookies["user"].Value.Length / 3 == 2)
                pwdOldCheck = SimpleHash.VerifyHash(tbOldPwd.Text, "SHA256", passwordHashSha256).ToString();
            else
                pwdOldCheck = SimpleHash.VerifyHash(tbOldPwd.Text, "SHA512", passwordHashSha256).ToString();

            if (pwdOldCheck.Equals("False"))
            {
                string script = "alert(\"Input Correct Password!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }

            // Validation Password
            bool bCheckPwd = PasswordCheck.IsValidPassword(tbRegPwd.Text, 8, 4, true, true, true, true);
            if (!bCheckPwd)
            {
                string script = "alert(\"At least 8 characters, all strong conditions met (>= 8 chars with 1 or more UC letters, LC letters, digits & special chars)\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            } //A1contact!

            string pwd = "";

            if (tbUserName.Text.Length / 3 == 0)
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA1", null);
            else if (tbUserName.Text.Length / 3 == 2)
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA256", null);
            else
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA512", null);

            //int id = db.getMaxUser();
            db.UpdateUserPwd(userID, pwd);
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}