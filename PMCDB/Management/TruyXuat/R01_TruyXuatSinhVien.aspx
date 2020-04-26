<%@ Page Title="" Language="C#" MasterPageFile="~/TruyXuat.Master" AutoEventWireup="true" CodeBehind="R01_TruyXuatSinhVien.aspx.cs" Inherits="PMCDB.Management.TruyXuat.R01_TruyXuatSinhVien" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelKhachHang" runat="server">
        <div class="list-group">
            <div class="list-group-item maudo">
                STUDENT
            </div>
            <div class="list-group-item limit-500">     
                       
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvTaiLieu" runat="server" Width="100%" HorizontalAlign="Center"
                            AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource1" DataKeyNames="MaSV,MaKhoaHoc,MaCT,MaKhoa,MaNganh,MaLop">
                            <Columns>
                                <asp:BoundField DataField="MaSV" HeaderText="Mã Sinh Viên" SortExpression="MaSV" ReadOnly="True" />
                                <asp:BoundField DataField="HoTen" HeaderText="Họ Và Tên" SortExpression="HoTen"/> 
                                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
                                <asp:BoundField DataField="DanToc" HeaderText="Dan Tộc" SortExpression="DanToc" />
                                <asp:BoundField DataField="MaKhoaHoc" HeaderText="Mã Khóa Học" SortExpression="MaKhoaHoc" ReadOnly="True"/>
                                <asp:BoundField DataField="NamBatDau" HeaderText="Năm Bắt Đầu" SortExpression="NamBatDau" />
                                <asp:BoundField DataField="NamKetThuc" HeaderText="Năm Kêt Thúc" SortExpression="NamKetThuc" />
                                <asp:BoundField DataField="MaCT" HeaderText="Mã Chương Trình" ReadOnly="True" SortExpression="MaCT" />
                                <asp:BoundField DataField="TenCT" HeaderText="Tên Chương Trình" SortExpression="TenCT" />
                                <asp:BoundField DataField="MaKhoa" HeaderText="Mã Khoa" ReadOnly="True" SortExpression="MaKhoa" />
                                <asp:BoundField DataField="TenKhoa" HeaderText="Tên Khoa" SortExpression="TenKhoa" />
                                <asp:BoundField DataField="MaNganh" HeaderText="Mã Ngành" ReadOnly="True" SortExpression="MaNganh" />
                                <asp:BoundField DataField="TenNganh" HeaderText="Tên Ngành" SortExpression="TenNganh" />
                                <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" ReadOnly="True" SortExpression="MaLop" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>

         <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>"
                SelectCommand="SELECT * FROM [V01_SinhVien] WHERE ([MaSV] = @MaSV)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MaSV" QueryStringField="MaSV" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
