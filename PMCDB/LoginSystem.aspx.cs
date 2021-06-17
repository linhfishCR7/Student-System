using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;

namespace PMCDB
{
    public partial class LoginSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["LoginOK"] = false;
            Session.RemoveAll();
        }
        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["PMCDBConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(sqlConnectionString);
            connection.Open();
            // Lay thong tin dang nhap
            string user = Login1.UserName;
            string password = Login1.Password;

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM V00_PhanQuyen WHERE Email=@Email AND MatKhau=@MatKhau", connection);
            da.SelectCommand.Parameters.AddWithValue("Email", user);
            da.SelectCommand.Parameters.AddWithValue("MatKhau", password);

            DataTable t = new DataTable();
            da.Fill(t);
            e.Authenticated = t.Rows.Count > 0;

            Session["LoginOK"] = e.Authenticated;
            if (e.Authenticated)
            {
                // Set Level cho Session Level

                Session["Email"] = t.Rows[0]["Email"].ToString();     

                Response.Redirect("/Update/U00_PhanQuyenDuAn");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Vui lòng kiểm tra Tài Khoản, Mật Khẩu!');", true);
        }
    }
}