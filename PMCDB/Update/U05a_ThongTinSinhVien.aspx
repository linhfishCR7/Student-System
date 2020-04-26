<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="U05a_ThongTinSinhVien.aspx.cs" Inherits="PMCDB.Update.U05a_ThongTinSinhVien" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item DodgerBlue">
                Cập Nhật Thông Tin Sinh Viên
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table">
                            <tr>
                                <td>Project Id:</td>
                                <td>
                                    <asp:Label ID="lblMaSV" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Project Name:</td>
                                <td>
                                    <asp:Label ID="lblHoTen" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                    <a href="U05_SinhVien.aspx" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span> Quay Về</a>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaSV" CssClass="table" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaSV" HeaderText="Mã Sinh Viên" ReadOnly="True" SortExpression="MaSV" />
                                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
                                <asp:BoundField DataField="DiaChiEmail" HeaderText="Địa Chỉ Email" SortExpression="DiaChiEmail" />
                                <asp:BoundField DataField="SDT" HeaderText="Số Điện Thoại" SortExpression="SDT" />
                                <asp:BoundField DataField="TrinhDoHocVan" HeaderText="Trình Độ Học Vấn" SortExpression="TrinhDoHocVan" />
                                <asp:BoundField DataField="NgayVaoDang" HeaderText="Ngày Vào Đảng" SortExpression="NgayVaoDang" />
                                <asp:BoundField DataField="NgayVaoDoan" HeaderText="Ngày Vào Đoàn" SortExpression="NgayVaoDoan" />
                                <asp:BoundField DataField="ChucVu" HeaderText="Chức Vụ" SortExpression="ChucVu" />
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
                                    <%-- <%-- ([MaSV], [DiaChi], [DiaChiEmail], [SDT], [TrinhDoHocVan], [NgayVaoDang], [NgayVaoDoan], [ChucVu])--%>
                                    <table class="table">
                                        <tr>
                                            <td>Mã Sinh Viên: </td>
                                            <td>
                                                <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Địa Chỉ: </td>
                                            <td>
                                                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Đại Chỉ Email: </td>
                                            <td>
                                                <asp:TextBox ID="txtDiaChiEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Số Điện Thoại: </td>
                                            <td>
                                                <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Trình Độ Học Vấn: </td>
                                            <td>
                                                <asp:TextBox ID="txtTrinhDoHocVan" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Vào Đảng: </td>
                                            <td>
                                                <asp:TextBox ID="txtNgayVaoDang" runat="server" CssClass="form-control"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayVaoDang_CalendarExtender" TargetControlID="txtNgayVaoDang"
                                                    ID="txtNgayVaoDang_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Vào Đoàn: </td>
                                            <td>
                                                <asp:TextBox ID="txtNgayVaoDoan" runat="server" CssClass="form-control"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayVaoDoan_CalendarExtender" TargetControlID="txtNgayVaoDoan"
                                                    ID="txtNgayVaoDoan_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Chức Vụ: </td>
                                            <td>
                                                <asp:TextBox ID="txtChucVu" runat="server" CssClass="form-control"></asp:TextBox>
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
        </div>

        <div>

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
                                    <%-- <%-- ([MaSV], [DiaChi], [DiaChiEmail], [SDT], [TrinhDoHocVan], [NgayVaoDang], [NgayVaoDoan], [ChucVu])--%>
                                    <table class="table">

                                        <tr>
                                            <td>Mã Sinh Viên: (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaSV1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Địa Chỉ: </td>
                                            <td>
                                                <asp:TextBox ID="txtDiaChi1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Đại Chỉ Email: </td>
                                            <td>
                                                <asp:TextBox ID="txtDiaChiEmail1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Số Điện Thoại: </td>
                                            <td>
                                                <asp:TextBox ID="txtSDT1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Trình Độ Học Vấn: </td>
                                            <td>
                                                <asp:TextBox ID="txtTrinhDoHocVan1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Vào Đảng: </td>
                                            <td>
                                                <asp:TextBox ID="txtNgayVaoDang1" runat="server" CssClass="form-control"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayVaoDang1_CalendarExtender" TargetControlID="txtNgayVaoDang1"
                                                    ID="txtNgayVaoDang1_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngày Vào Đoàn: </td>
                                            <td>
                                                <asp:TextBox ID="txtNgayVaoDoan1" runat="server" CssClass="form-control"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayVaoDoan1_CalendarExtender" TargetControlID="txtNgayVaoDoan1"
                                                    ID="txtNgayVaoDoan1_CalendarExtender" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Chức Vụ: </td>
                                            <td>
                                                <asp:TextBox ID="txtChucVu1" runat="server" CssClass="form-control"></asp:TextBox>
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
                DeleteCommand="DELETE FROM [tbl05a_ThongTinSV] WHERE [MaSV] = @MaSV"
                InsertCommand="INSERT INTO [tbl05a_ThongTinSV] ([MaSV], [DiaChi], [DiaChiEmail], [SDT], [TrinhDoHocVan], [NgayVaoDang], [NgayVaoDoan], [ChucVu]) VALUES (@MaSV, @DiaChi, @DiaChiEmail, @SDT, @TrinhDoHocVan, @NgayVaoDang, @NgayVaoDoan, @ChucVu)"
                SelectCommand="SELECT * FROM [tbl05a_ThongTinSV] WHERE ([MaSV] = @MaSV)"
                UpdateCommand="UPDATE [tbl05a_ThongTinSV] SET [MaSV] = @MaSV, [DiaChi] = @DiaChi, [DiaChiEmail] = @DiaChiEmail, [SDT] = @SDT, [TrinhDoHocVan] = @TrinhDoHocVan, [NgayVaoDang] = @NgayVaoDang, [NgayVaoDoan] = @NgayVaoDoan, [ChucVu] = @ChucVu WHERE [MaSV] = @MaSV">
                <DeleteParameters>
                    <asp:Parameter Name="MaSV" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaSV" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DiaChiEmail" Type="String" />
                    <asp:Parameter Name="SDT" Type="String" />
                    <asp:Parameter Name="TrinhDoHocVan" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayVaoDang" />
                    <asp:Parameter DbType="Date" Name="NgayVaoDoan" />
                    <asp:Parameter Name="ChucVu" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblMaSV" Name="MaSV" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MaSV" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="DiaChiEmail" Type="String" />
                    <asp:Parameter Name="SDT" Type="String" />
                    <asp:Parameter Name="TrinhDoHocVan" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayVaoDang" />
                    <asp:Parameter DbType="Date" Name="NgayVaoDoan" />
                    <asp:Parameter Name="ChucVu" Type="String" />
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
