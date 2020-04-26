<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="R01_SinhVien.aspx.cs" Inherits="PMCDB.Management.R01_SinhVien" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelKhachHang" runat="server">
        <div class="list-group">
            <div class="list-group-item maudo">
                PROJECT SCHEDULE
            </div>
            <div class="list-group-item">
                <table class="table">

                    <tr>
                        <td>Mã Khoa:</td>
                        <td>
                            <asp:Label ID="lblMaKhoa" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>Tên Khoa:</td>
                        <td>
                            <asp:Label ID="lblTenKhoa" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
            <div class="list-group-item report">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px">
                    <LocalReport ReportPath="Report/R01_SinhVien.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="R01_SinhVien" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
            <div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySinhVien" TypeName="PMCDB.DataSet.dsSinhVienTableAdapters.V01_SinhVienTableAdapter" UpdateMethod="FillBySinhVien">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblMaKhoa" Name="MaKhoa" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="dataTable" Type="Object" />
                        <asp:Parameter Name="MaKhoa" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
