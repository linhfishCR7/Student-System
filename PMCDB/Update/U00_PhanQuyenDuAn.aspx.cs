using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PMCDB.Update
{
    public partial class U00_PhanQuyenDuAn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("../LoginSystem");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                Session["MaKhoa"] = HttpUtility.HtmlDecode(gvrow.Cells[1].Text).ToString();
                Session["TenKhoa"] = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                Session["Role"] = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                Response.Redirect("/Update/U04_LopHoc.aspx");
            }
            
        }
    }
}