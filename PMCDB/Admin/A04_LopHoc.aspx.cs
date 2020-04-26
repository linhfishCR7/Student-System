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
using System.Data.OleDb;
using System.Data.Common;

namespace PMCDB.Admin
{
    public partial class A04_LopHoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmailAdmin"] == null)
            {
                Response.Redirect("../Admin/LoginAdmin");
            }

            string role = Session["RoleAdmin"].ToString();
            switch (role)
            {
                case "Admin":
                    panelPhanQuyen.Visible = true;
                    panelThongBao.Visible = false;
                    break;
                case "Member":
                    panelPhanQuyen.Visible = false;
                    panelThongBao.Visible = true;
                    break;
                default:
                    panelPhanQuyen.Visible = false;
                    panelThongBao.Visible = true;
                    break;
            }
            panelError.Visible = false;
        }

        //Import Modal

        protected void btnImport_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#importModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ImportShowModalScript", sb.ToString(), false);
        }

        protected void btnImportRecord_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // if you have Excel 2007 uncomment this line of code 
                //string excelConnectionString =string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties=Excel 8.0",path); 
                string ExcelContentType = "application/vnd.ms-excel";
                string Excel2010ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                if (FileUpload1.HasFile)
                {
                    //Check the Content Type of the file 
                    if (FileUpload1.PostedFile.ContentType == ExcelContentType || FileUpload1.PostedFile.ContentType == Excel2010ContentType)
                    {
                        try
                        {
                            //Save file path 
                            string path = string.Concat(Server.MapPath("../UploadFile/"), FileUpload1.FileName);
                            //Save File as Temp then you can delete it if you want 
                            FileUpload1.SaveAs(path);
                            //string path = @"C:\Users\Johnney\Desktop\ExcelData.xls"; 
                            //For Office Excel 2010  please take a look to the followng link  http://social.msdn.microsoft.com/Forums/en-US/exceldev/thread/0f03c2de-3ee2-475f-b6a2-f4efb97de302/#ae1e6748-297d-4c6e-8f1e-8108f438e62e 
                            string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);

                            // Create Connection to Excel Workbook 
                            using (OleDbConnection connection =
                                         new OleDbConnection(excelConnectionString))
                            {
                                OleDbCommand command = new OleDbCommand
                                        ("Select * FROM [Sheet1$]", connection);
                                connection.Open();
                                // Create DbDataReader to Data Worksheet 
                                using (DbDataReader dr = command.ExecuteReader())
                                {
                                    // SQL Server Connection String 
                                    string sqlConnectionString = ConfigurationManager.ConnectionStrings["PMCDBConnectionString"].ConnectionString;

                                    // Bulk Copy to SQL Server 
                                    using (SqlBulkCopy bulkCopy =
                                               new SqlBulkCopy(sqlConnectionString))
                                    {
                                        bulkCopy.DestinationTableName = "tbl01_Khoa";
                                        bulkCopy.WriteToServer(dr);
                                        panelError.Visible = true;
                                        lblError.Text = "The data has been exported succefuly from Excel to SQL";
                                        GridView1.DataBind();
                                    }
                                }
                            }
                            StringBuilder sb = new StringBuilder();
                            sb.Append(@"<script type='text/javascript'>");
                            sb.Append("alert('Record Imported Successfully');");
                            sb.Append("$('#importModal').modal('hide');");
                            sb.Append(@"</script>");
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ImportHideModalScript", sb.ToString(), false);
                        }

                        catch (Exception ex)
                        {
                            panelError.Visible = true;
                            lblError.Text = ex.Message;
                        }
                    }
                }
            }
        }


        //Add Model
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);

        }

        //Handles Add button click in add modal popup
        //([MaLop], [MaKhoa], [MaKhoaHoc], [MaCT], [STT]) 
        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["MaLop"].DefaultValue = txtMaLop.Text;
                parameters["MaKhoa"].DefaultValue = txtMaKhoa.Text;
                parameters["MaKhoaHoc"].DefaultValue = txtMaKhoaHoc.Text;
                parameters["MaCT"].DefaultValue = txtMaCT.Text;
                parameters["STT"].DefaultValue = txtSTT.Text;

                try
                {
                    if (txtMaLop.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaKhoa.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaKhoaHoc.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaCT.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }

                    else
                    {
                        SqlDataSource1.Insert();
                        txtMaLop.Text = "";
                        txtMaKhoa.Text = "";
                        txtMaKhoaHoc.Text = "";
                        txtMaCT.Text = "";
                        txtSTT.Text = "";



                        StringBuilder sb = new StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('Record Added Successfully');");
                        sb.Append("$('#addModal').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);
                    }
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }
            }
        }

        //([MaLop], [MaKhoa], [MaKhoaHoc], [MaCT], [STT]) 
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                txtMaLop1.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                txtMaKhoa1.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtMaKhoaHoc1.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                txtMaCT1.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
                txtSTT1.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();

                lblResult.Visible = false;
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCode.Value = code;
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

        //([MaLop], [MaKhoa], [MaKhoaHoc], [MaCT], [STT]) 
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["MaLop"].DefaultValue = txtMaLop1.Text;
                parameters["MaKhoa"].DefaultValue = txtMaKhoa1.Text;
                parameters["MaKhoaHoc"].DefaultValue = txtMaKhoaHoc1.Text;
                parameters["MaCT"].DefaultValue = txtMaCT1.Text;
                parameters["STT"].DefaultValue = txtSTT1.Text;

                try
                {
                    if (txtMaLop1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaKhoa1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaKhoaHoc1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtMaCT1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }

                    else
                    {
                        SqlDataSource1.Update();
                        StringBuilder sb = new StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('Records Updated Successfully');");
                        sb.Append("$('#editModal').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);
                    }
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }

            }

        }

        private void executeDelete(string code)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.DeleteParameters;
                parameters["MaLop"].DefaultValue = code;

                try
                {
                    SqlDataSource1.Delete();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }
            }

        }

        //Handles Delete button click in delete modal popup
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string code = hfCode.Value;
            executeDelete(code);

            StringBuilder sb = new StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record deleted Successfully');");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delHideModalScript", sb.ToString(), false);
        }
    }
}