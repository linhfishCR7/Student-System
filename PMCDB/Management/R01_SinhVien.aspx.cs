using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMCDB.Management
{
    public partial class R01_SinhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("../LoginSystem");
            }
            lblMaKhoa.Text = Session["MaKhoa"].ToString();
            lblTenKhoa.Text = Session["TenKhoa"].ToString();
        }
    }
}