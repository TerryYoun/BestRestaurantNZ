using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BestRestaurantNZ
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        DbLayer db = null;
        int shopID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }

            shopID = int.Parse(Request.Params[0]);
            if (shopID <= 0)
            {
                Response.Redirect("Restaurant.aspx");
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            db = new DbLayer();
            int menuID = db.getMaxMenuID() + 1;
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
            if (tbMenuPromo.Checked)
            {
                strCheckbox = "1";
            }

            db.insertMenu(menuID, shopID, tbMenuName.Text, Double.Parse(tbMenuPrice.Text), tbMenuDesc.Text, strCheckbox, Double.Parse(tbMenuPromoPrice.Text), imgPath);
            db.closeConnection();
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx?shopID=" + shopID);
        }
    }
}