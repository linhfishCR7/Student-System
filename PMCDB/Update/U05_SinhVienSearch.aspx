<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="U05_SinhVienSearch.aspx.cs" Inherits="PMCDB.Update.U05_SinhVienSearch" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item DodgerBlue">
                Tìm Kiếm Sinh Viên
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table">
                            <tr>
                                <td>Mã Lớp:</td>
                                <td>
                                    <asp:Label ID="lblMaLop" runat="server" Text=""></asp:Label></td>
                            </tr>
                           <%-- <tr>
                                <td>Tên Ngành:</td>
                                <td>
                                    <asp:Label ID="lblTenNganh" runat="server" Text=""></asp:Label></td>
                            </tr>--%>
                            <%--<tr>

                                <td>Mã Lớp:</td>
                                <td>
                                    <asp:Label ID="lblMaLop" runat="server" Text=""></asp:Label>                                

                                </td>

                            </tr>--%>

                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                    <a href="U05_SinhVien.aspx" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span>Quay Về</a>
                                </td>
                                <td>
                                    Search: <asp:TextBox ID="Txtsearch" runat="server"></asp:TextBox>
                                    <asp:Button ID="ButSearch" runat="server" Text="Search" OnClick="ButSearch_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaSV" CssClass="table" DataSourceID="" EmptyDataText="No SV FOUND!">
                            <Columns>
                                  <asp:ButtonField CommandName="selectRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-list-alt"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maureu btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-trash"></i>' ItemStyle-Width="40px" >
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaSV" HeaderText="MaSV" ReadOnly="True" SortExpression="MaSV" />
                                <asp:BoundField DataField="HoTen" HeaderText="HoTen" SortExpression="HoTen" />
                                <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
                                <asp:BoundField DataField="DanToc" HeaderText="DanToc" SortExpression="DanToc" />
                                <asp:BoundField DataField="MaLop" HeaderText="MaLop" SortExpression="MaLop" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>


        <div>

            <%--<BẮT ĐẦU THÊM MỚI>--%>
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <asp:UpdatePanel ID="upAdd" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <%-- (([MaSV], [HoTen], [NamSinh], [DanToc], [MaLop]))--%>
                                     <table class="table">
                                        <tr>
                                            <td>Mã Sinh Viên: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Họ và Tên: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Sinh: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control"></asp:TextBox>
                                                 <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgaySinh_CalendarExtender" TargetControlID="txtNgaySinh"
                                                    ID="txtNgaySinh_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Dân Tộc: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtDanToc" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Mã Lớp: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaLop" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Add</asp:LinkButton>
                                    <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span>Close</button>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <%--Import Modal--%>
            <div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalScrollableTitle2">Import</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <td>Upload File: (*)</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Import</asp:LinkButton>
                            <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span>Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <%--<KẾT THÚC THÊM>--%>


            <%--BẮT ĐẦU SỬA--%>
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Edit</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <asp:UpdatePanel ID="upEdit" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <%-- (([MaSV], [HoTen], [NamSinh], [DanToc], [MaLop]))--%>
                                    <table class="table">
                                        <tr>
                                            <td>Mã Sinh Viên: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaSV1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Họ và Tên: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtHoTen1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Sinh: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtNgaySinh1" runat="server" CssClass="form-control"></asp:TextBox>
                                                 <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgaySinh1_CalendarExtender" TargetControlID="txtNgaySinh1"
                                                    ID="txtNgaySinh1_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Dân Tộc: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtDanToc1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Mã Lớp: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaLop1" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                    <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><span class="glyphicon glyphicon-floppy-save"></span> Update</asp:LinkButton>
                                    <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span>Close</button>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <%--KẾT THÚC SỬA--%>
        </div>




        <%--<BẮT ĐẦU XÓA>--%>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                Are you sure you want to delete the record?
                                    <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><span class="glyphicon glyphicon-trash"></span> Delete</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span>Cancel</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--KẾT THÚC XÓA--%>

        <%--([MaHangMuc], [TenHangMuc], [MaDuAn])--%>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>"
                DeleteCommand="DELETE FROM [tbl05_SinhVien] WHERE [MaSV] = @MaSV"
                InsertCommand="INSERT INTO [tbl05_SinhVien] ([MaSV], [HoTen], [NgaySinh], [DanToc], [MaLop]) VALUES (@MaSV, @HoTen, @NgaySinh, @DanToc, @MaLop)"
                SelectCommand="SELECT * FROM [tbl05_SinhVien] WHERE ([MaLop] = @MaLop)"
                UpdateCommand="UPDATE [tbl05_SinhVien] SET [HoTen] = @HoTen, [NgaySinh] = @NgaySinh, [DanToc] = @DanToc, [MaLop] = @MaLop WHERE [MaSV] = @MaSV">
                <DeleteParameters>
                    <asp:Parameter Name="MaSV" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaSV" Type="String" />
                    <asp:Parameter Name="HoTen" Type="String" />
                    <asp:Parameter Name="NgaySinh" DbType="Date" />
                    <asp:Parameter Name="DanToc" Type="String" />
                    <asp:Parameter Name="MaLop" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblMaLop" Name="MaLop" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HoTen" Type="String" />
                    <asp:Parameter Name="NgaySinh" DbType="Date" />
                    <asp:Parameter Name="DanToc" Type="String" />
                    <asp:Parameter Name="MaLop" Type="String" />
                    <asp:Parameter Name="MaSV" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT * FROM [tbl04_LopHoc]">
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT * FROM [tbl09_Nganh] WHERE ([MaNganh] = @MaNganh)" DeleteCommand="DELETE FROM [tbl09_Nganh] WHERE [MaNganh] = @MaNganh" InsertCommand="INSERT INTO [tbl09_Nganh] ([MaNganh], [TenNganh], [MaKhoa]) VALUES (@MaNganh, @TenNganh, @MaKhoa)" UpdateCommand="UPDATE [tbl09_Nganh] SET [TenNganh] = @TenNganh, [MaKhoa] = @MaKhoa WHERE [MaNganh] = @MaNganh">
                <DeleteParameters>
                    <asp:Parameter Name="MaNganh" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaNganh" Type="String" />
                    <asp:Parameter Name="TenNganh" Type="String" />
                    <asp:Parameter Name="MaKhoa" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaNganh" SessionField="MaNganh" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenNganh" Type="String" />
                    <asp:Parameter Name="MaKhoa" Type="String" />
                    <asp:Parameter Name="MaNganh" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="True">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>
</asp:Content>
