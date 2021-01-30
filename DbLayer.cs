using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace BestRestaurantNZ
{
    public class DbLayer
    {
        String cs = "";
        SqlConnection sc = null;

        public DbLayer()
        {
            cs = ConfigurationManager.ConnectionStrings["dbBrnzConnectionString"].ConnectionString;
            sc = new SqlConnection(cs);
            sc.Open();
        }

        public void closeConnection()
        {
            sc.Close();
            sc = null;
        }

        // About User
        public int getMaxUser()
        {
            int nReturn = 0;

            String query = "Select count(*) from tblUser where 1=1";

            SqlCommand scm = new SqlCommand(query, sc);

            nReturn = int.Parse(scm.ExecuteScalar().ToString());

            return nReturn;
        }

        public String getUserPwd(String id)
        {
            String strReturn = "";

            String query = "select userPwd from tblUser where 1=1 and userEmail = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            try
            {
                strReturn = scm.ExecuteScalar().ToString();
            }
            catch
            {
                return null;
            }
            

            return strReturn;
        }

        public void updateUserConnectionCount(string id)
        {
            String query = "Select userConnectCnt from tblUser WHERE userEmail = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);
            int maxUserConnectCnt = int.Parse(scm.ExecuteScalar().ToString()) +1;

            String queryUpdate = "update tblUser SET " +
            " userConnectCnt = '" + maxUserConnectCnt + "'" +
            " where 1=1 and userEmail = '" + id + "'";

            SqlCommand scmUpdate = new SqlCommand(queryUpdate, sc);

            scmUpdate.ExecuteNonQuery();
        }

        public bool checkUserID(String id)
        {
            String query = "select count(*) from tblUser where 1=1 and userEmail = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);
            int cnt = int.Parse(scm.ExecuteScalar().ToString());

            if (cnt == 1)
                return false;

            return true;
        }

        public void saveUser(int id, String email, String pwd, String name, String region)
        {
            String query = "insert into tblUser values('" + id + "','" +
                email + "','" +
                pwd + "','" +
                name + "','" +
                region + "')";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public void UpdateUser(int id, String email, String name, String region)
        {
            String query = "update tblUser SET " +
                        " userEmail = '" + email + "'," +
                        " userName = '" + name + "'," +
                        " userRegion = '" + region + "'" +
                        " where 1=1 and userID = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public void UpdateUserPwd(int id, String pwd)
        {
            String query = "update tblUser SET " +
                        " userPwd = '" + pwd + "'" +
                        " where 1=1 and userID = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public Boolean checkLogin(String id, String pwd)
        {
            String query = "select count(*) from tblUser where 1=1 and userEmail = '" + id + "' and userPwd = '" + pwd + "'";

            SqlCommand scm = new SqlCommand(query, sc);
            int cnt = int.Parse(scm.ExecuteScalar().ToString());

            if (cnt <= 0)
                return false;

            return true;
        }

        public SqlDataReader GetAllUser()
        {
            String query = "select * from tblUser where 1=1";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public SqlDataReader GetUserByID(int id)
        {
            String query = "select * from tblUser where 1=1 and userID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public int DeleteUser(int id)
        {
            String query = "delete from tblUser where 1=1 and userID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteNonQuery();
        }

        // About Favourite
        public SqlDataReader GetAllFavourite(String userEmail)
        {
            String query = "select b.shopName, b.shopSubName, b.shopIntroduce, b.shopAddress, b.shopPhone, b.shopImage, a.favouriteID from tblFavourite a, tblShop b where 1=1 and a.shopID = b.shopID and userEmail = '" + userEmail + "' order by a.shopID asc";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public SqlDataReader GetAllFavouriteByID(int id)
        {
            String query = "select b.shopName, b.shopSubName, b.shopIntroduce, b.shopAddress, b.shopPhone, b.shopImage, a.favouriteID from tblFavourite a, tblShop b where 1=1 and a.shopID = b.shopID and a.favouriteID = '" + id + "' order by a.shopID asc";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public int getMaxFavouriteID()
        {
            int nReturn = 0;

            String query = "Select MAX(favouriteID) from tblFavourite where 1=1";

            SqlCommand scm = new SqlCommand(query, sc);

            nReturn = int.Parse(scm.ExecuteScalar().ToString());

            return nReturn;
        }

        public Boolean insertFavourite(int id, String userName, int shopID)
        {
            String checkQuery = "select count(*) from tblFavourite where 1=1 " +
                " and userEmail = '" + userName + "'" +
                " and shopID = '" + shopID + "'";

            SqlCommand scm1 = new SqlCommand(checkQuery, sc);

            if (int.Parse(scm1.ExecuteScalar().ToString()) > 0)
                return false;

            String query = "insert into tblFavourite values('" + id + "','" +
                userName + "','" +
                shopID + "')";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();

            return true;
        }

        public void deleteFavourite(int favouriteID)
        {
            String query = "delete from tblFavourite where favouriteID = '" + favouriteID + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public void deleteAllFavourite(String email)
        {
            String query = "delete from tblFavourite where userEmail = '" + email + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        // About Shop
        public SqlDataReader GetAllShop(String strWhere, String strSearchText)
        {
            String query = "select * from tblShop a where 1=1";

            switch (strWhere)
            {
                case "All":
                    query += " AND ( a.shopName like '%" + strSearchText + "%' " +
                        "or a.shopSubName like '%" + strSearchText + "%' " +
                        "or a.shopIntroduce like '%" + strSearchText + "%' " +
                        "or a.shopAddress like '%" + strSearchText + "%' " +
                        "or a.shopPhone like '%" + strSearchText + "%' " +
                        "or a.shopRegion like '%" + strSearchText + "' )";
                    break;
                case "Name":
                    query += " AND ( a.shopName like '%" + strSearchText + "%' )";
                    break;
                case "SubName":
                    query += " AND ( a.shopSubName like '%" + strSearchText + "%' )";
                    break;
                case "Introduce":
                    query += " AND ( a.shopIntroduce like '%" + strSearchText + "%' )";
                    break;
                case "Address":
                    query += " AND ( a.shopAddress like '%" + strSearchText + "%' )";
                    break;
                case "Phone":
                    query += " AND ( a.shopPhone like '%" + strSearchText + "%' )";
                    break;
                case "Region":
                    query += " AND ( a.shopRegion like '%" + strSearchText + "%' )";
                    break;
                default:
                    query += " AND ( a.shopName like '%" + strSearchText + "%' " +
                        "or a.shopSubName like '%" + strSearchText + "%' " +
                        "or a.shopIntroduce like '%" + strSearchText + "%' " +
                        "or a.shopAddress like '%" + strSearchText + "%' " +
                        "or a.shopPhone like '%" + strSearchText + "%' " +
                        "or a.shopRegion like '%" + strSearchText + "' )";
                    break;
            }

            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public SqlDataReader GetShopByID(int id)
        {
            String query = "select * from tblShop where 1=1 and shopID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public int DeleteShop(int id)
        {
            String query = "delete from tblShop where 1=1 and shopID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteNonQuery();
        }

        public void insertShop(int id, String name, String subname, String introduce, String address, String phone, String region, String image)
        {
            String query = "insert into tblShop values('" + id + "','" +
                name + "','" +
                subname + "','" +
                introduce + "','" +
                address + "','" +
                phone + "','" +
                region + "','" +
                image + "')";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public void UpdateShop(int id, String name, String subname, String introduce, String address, String phone, String region, String image)
        {
            String query = "update tblShop SET " +
                        " shopName = '" + name + "'," +
                        " shopSubName = '" + subname + "'," +
                        " shopIntroduce = '" + introduce + "'," +
                        " shopAddress = '" + address + "'," +
                        " shopPhone = '" + phone + "'," +
                        " shopRegion = '" + region + "'," +
                        " shopImage = '" + image + "'" +
                        " where 1=1 and shopID = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }

        public int getMaxShopID()
        {
            int nReturn = 0;

            String query = "Select MAX(shopID) from tblShop where 1=1";

            SqlCommand scm = new SqlCommand(query, sc);

            nReturn = int.Parse(scm.ExecuteScalar().ToString());

            return nReturn;
        }

        // About Menu
        public SqlDataReader GetAllMenu(int shopID)
        {
            String query = "select * from tblMenu where 1=1 and shopID = '" + shopID + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public SqlDataReader GetMenuByID(int id)
        {
            String query = "select * from tblMenu where 1=1 and menuID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteReader();
        }

        public int DeleteMenu(int id)
        {
            String query = "delete from tblMenu where 1=1 and menuID = '" + id + "'";
            SqlCommand scm = new SqlCommand(query, sc);

            return scm.ExecuteNonQuery();
        }

        public void UpdateMenu(int id, String name, Double price, String desc, String promo, Double promoPrice, String path)
        {
            String query = "update tblMenu SET " +
                        " menuName = '" + name + "'," +
                        " menuPrice = '" + price + "'," +
                        " menuDesc = '" + desc + "'," +
                        " menuPromo = '" + promo + "'," +
                        " menuPromoPrice = '" + promoPrice + "'," +
                        " imgPath = '" + path + "'" +
                        " where 1=1 and menuID = '" + id + "'";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }
        
        public int getMaxMenuID()
        {
            int nReturn = 0;

            String query = "Select MAX(menuID) from tblMenu where 1=1";

            SqlCommand scm = new SqlCommand(query, sc);

            nReturn = int.Parse(scm.ExecuteScalar().ToString());

            return nReturn;
        }

        public void insertMenu(int id, int shopID, String name, Double price, String desc, String promo, Double promoPrice, String path)
        {
            String query = "insert into tblMenu values('" + id + "','" +
                shopID + "','" +
                name + "','" +
                price + "','" +
                desc + "','" +
                promo + "','" +
                promoPrice + "','" +
                path + "')";

            SqlCommand scm = new SqlCommand(query, sc);

            scm.ExecuteNonQuery();
        }
    }
}