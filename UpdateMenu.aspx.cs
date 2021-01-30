using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace BestRestaurantNZ
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        DbLayer db = null;
        int shopID = 0;
        int menuID = 0;
        String imgPath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            menuID = int.Parse(Request.Params[0]);
            if (menuID <= 0)
            {
                Response.Redirect("Menu.aspx");
            }

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetMenuByID(menuID);
                sr.Read();
                shopID = sr.GetInt32(1);
                tbMenuName.Text = sr.GetString(2);
                tbMenuPrice.Text = sr.GetDouble(3).ToString();
                tbMenuDesc.Text = sr.GetString(4);
                if (sr.GetString(5).Equals("1"))
                    cbPromotion.Checked = true;
                else
                    cbPromotion.Checked = false;
                tbPromoPrice.Text = sr.GetDouble(6).ToString();
                Image1.ImageUrl = sr.GetString(7);
                sr.Close();
                sr = null;
            }
            else
            {
                SqlDataReader sr = db.GetMenuByID(menuID);
                sr.Read();
                shopID = sr.GetInt32(1);
                sr.Close();
                sr = null;
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            String imgPath = "";

            if (FileUpload1.HasFile)
            {
                String FileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName).Substring(1);

                String filePath = Request.PhysicalApplicationPath + "images";
                if (!Directory.Exists(filePath))
                    Directory.CreateDirectory(filePath);

                filePath += @"\menu" + menuID + "." + FileExtension;
                imgPath = "./images/menu" + menuID + "." + FileExtension;

                FileUpload1.SaveAs(filePath);
            }
            else
            {
                imgPath = "./images/menu0.jpg";
            }

            String strCheckbox = "0";
            if (cbPromotion.Checked)
            {
                strCheckbox = "1";
            }

            db.UpdateMenu(menuID, tbMenuName.Text, Double.Parse(tbMenuPrice.Text), tbMenuDesc.Text, strCheckbox, Double.Parse(tbPromoPrice.Text), imgPath);
            db.closeConnection();
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }

    }
}