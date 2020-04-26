using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Configuration;

namespace PMCDB.Admin
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["LoginOK1"] = false;
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

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tbl00_Admin WHERE EmailAdmin=@EmailAdmin AND MatKhauAdmin=@MatKhauAdmin", connection);
            da.SelectCommand.Parameters.AddWithValue("EmailAdmin", user);
            da.SelectCommand.Parameters.AddWithValue("MatKhauAdmin", password);

            DataTable t = new DataTable();
            da.Fill(t);
            e.Authenticated = t.Rows.Count > 0;

            Session["LoginOK1"] = e.Authenticated;
            if (e.Authenticated)
            {
                // Set Level cho Session Level

                Session["EmailAdmin"] = t.Rows[0]["EmailAdmin"].ToString();
                Session["RoleAdmin"] = t.Rows[0]["RoleAdmin"].ToString();
                Response.Redirect("../Admin/A01_Khoa");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Vui lòng kiểm tra Tài Khoản, Mật Khẩu!');", true);
        }
    }
}