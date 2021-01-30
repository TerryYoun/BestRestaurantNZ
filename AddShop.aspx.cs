using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BestRestaurantNZ
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        DbLayer db = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            String username = Request.Cookies["user"].Value;
            if (!username.Equals("admin@brnz.co.nz"))
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            db = new DbLayer();

            int shopID = db.getMaxShopID()+1;
            String imgPath = "";

            if (FileUpload1.HasFile)
            {
                String filePath = Request.PhysicalApplicationPath + "images";
                if (!Directory.Exists(filePath))
                    Directory.CreateDirectory(filePath);

                filePath += @"\shop" + shopID + ".jpg";
                imgPath = "./images/shop" + shopID + ".jpg";

                FileUpload1.SaveAs(filePath);
            }
            else
            {
                imgPath = "./images/shop0.jpg";
             }

            db.insertShop(shopID, tbShopName.Text, tbShopSubName.Text, tbShopInformation.Text, tbShopAddress.Text, tbShopPhone.Text, DropDownList1.Text, imgPath);
            db.closeConnection();
            Response.Redirect("Restaurant.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Restaurant.aspx");
        }
    }
}