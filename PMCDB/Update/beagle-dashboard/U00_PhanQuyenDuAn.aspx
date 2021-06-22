<%@ Page Title="" Language="C#" MasterPageFile="~/PhanQuyen.Master" AutoEventWireup="true" CodeBehind="U00_PhanQuyenDuAn.aspx.cs" Inherits="PMCDB.Update.beagle_dashboard.U00_PhanQuyenDuAn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item DodgerBlue">
                Danh Sách Khoa
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>                        
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaKhoa" CssClass="table" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-arrow-right"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn btn-xs maureu"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaKhoa" HeaderText="Mã Khoa" ReadOnly="True" SortExpression="MaKhoa" />
                                <asp:BoundField DataField="TenKhoa" HeaderText="Tên Khoa" SortExpression="TenKhoa" />
                                <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
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
                SelectCommand="SELECT [MaKhoa], [TenKhoa], [RoleId] FROM [V00_PhanQuyen] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>
        <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
</asp:Content>
