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
    public partial class WebForm11 : System.Web.UI.Page
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

            db = new DbLayer();

            if (!this.IsPostBack)
            {
                SqlDataReader sr = db.GetShopByID(shopID);
                sr.Read();
                tbShopName.Text = sr.GetString(1);
                tbShopSubName.Text = sr.GetString(2);
                tbShopInformation.Text = sr.GetString(3);
                tbShopAddress.Text = sr.GetString(4);
                tbShopPhone.Text = sr.GetString(5);
                DropDownList1.SelectedValue = sr.GetString(6);
                Image1.ImageUrl = sr.GetString(7);
                sr.Close();
                sr = null;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String imgPath = "";

            if (FileUpload1.HasFile)
            {
                String FileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName).Substring(1);

                String filePath = Request.PhysicalApplicationPath + "images";
                if (!Directory.Exists(filePath))
                    Directory.CreateDirectory(filePath);

                filePath += @"\shop" + shopID + "." + FileExtension;
                imgPath = "./images/shop" + shopID + "." + FileExtension;

                FileUpload1.SaveAs(filePath);
            }
            else
            {
                imgPath = "./images/shop0.jpg";
            }

            db.UpdateShop(shopID, tbShopName.Text, tbShopSubName.Text, tbShopInformation.Text, tbShopAddress.Text, tbShopPhone.Text, DropDownList1.Text, imgPath);
            db.closeConnection();
            Response.Redirect("Restaurant.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Restaurant.aspx");
        }
    }

}