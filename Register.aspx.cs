using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BestRestaurantNZ
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DbLayer db = new DbLayer();

            String name = tbRegName.Text;
            String email = tbRegEmail.Text;
            string pwd = "";

            if(name.Length / 3 == 0)
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA1", null);
            else if (name.Length / 3 == 2)
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA256", null);
            else
                pwd = SimpleHash.ComputeHash(tbRegPwd.Text, "SHA512", null);

            String region = DropDownList1.Text;

            // Validation Password
            bool bCheckPwd = PasswordCheck.IsValidPassword(tbRegPwd.Text, 8, 4, true, true, true, true);
            if (!bCheckPwd)
            {
                string script = "alert(\"At least 8 characters, all strong conditions met (>= 8 chars with 1 or more UC letters, LC letters, digits & special chars)\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            } //A1contact!

            // Validation UserID
            bool bCheckID = db.checkUserID(email);
            if(!bCheckID)
            {
                string script = "alert(\"The username already exists. Please use a different username.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            } //A1contact!    

            int id = db.getMaxUser();
            db.saveUser(id, email, pwd, name, region);

            Response.Cookies["user"].Value = email;
            Response.Cookies["user"].Expires = DateTime.Now.AddDays(3);
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}