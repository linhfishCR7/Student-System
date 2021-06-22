<%@ Page Title="" Language="C#" MasterPageFile="~/NewMain.Master" AutoEventWireup="true" CodeBehind="U02_Class.aspx.cs" Inherits="PMCDB.Update.beagle_dashboard.U02_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/Themes/beagle-dashboard/assets/lib/select2/css/select2.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="be-content">
        <div class="main-content container-fluid">
            <asp:Panel ID="panelPhanQuyen" runat="server">
                <div class="list-group">
                    <div class="list-group-item bg-primary text-black-100 text-lg-left">
                        Cập Nhật Lớp Học
                    </div>
                    <div class="list-group-item">
                        <asp:UpdatePanel ID="upCrudGrid" runat="server">
                            <ContentTemplate>
                                <table class="table table-borderless">
                                    <tr>
                                        <th>Mã Khoa:</th>
                                        <td>
                                            <asp:Label ID="lblMaKhoa" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Tên Khoa:</th>
                                        <td>
                                            <asp:Label ID="lblTenKhoa" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th>Mã Ngành:</th>
                                        <td>
                                            <asp:DropDownList ID="ddlMaNganh" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TenNganh" DataValueField="MaNganh"></asp:DropDownList>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn btn-space btn-primary" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                            <asp:LinkButton ID="btnImport" runat="server" CssClass="btn btn-space btn-success" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                            <a href="U00_PhanQuyenDuAn.aspx" class="btn btn-space btn-secondary"><span class="glyphicon glyphicon-refresh"></span>Quay Về</a>
                                            <a href="U04_LopHocSearch.aspx" class="btn btn-space btn-warning"><span class="glyphicon glyphicon-search"></span>Search</a>

                                        </td>
                                        <%-- <td>
                                    Search: <asp:TextBox ID="Txtsearch" runat="server"></asp:TextBox>
                                    <asp:Button ID="ButSearch" runat="server" Text="Search" OnClick="ButSearch_Click" />
                                </td>--%>
                                    </tr>
                                </table>


                                <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="MaLop" CssClass="table table-striped table-hover table-fw-widget" DataSourceID="SqlDataSource1" EmptyDataText="No SV FOUND!">
                                    <Columns>
                                        <asp:ButtonField CommandName="selectRecord" ButtonType="Link" Text='<span class="mdi mdi-format-list-bulleted"></span>' ItemStyle-Width="40px">
                                            <ControlStyle CssClass="btn btn-space btn-success"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<span class="mdi mdi-edit"></span>' ItemStyle-Width="40px">
                                            <ControlStyle CssClass="btn btn-space btn-warning"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<span class="mdi mdi-delete"></span>' ItemStyle-Width="40px">
                                            <ControlStyle CssClass="btn btn-space btn-danger"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" ReadOnly="True" SortExpression="MaLop"  ItemStyle-CssClass="odd gradeX" HeaderStyle-CssClass="odd gradeX"/>
                                        <asp:BoundField DataField="MaKhoaHoc" HeaderText="Mã Khóa Học" SortExpression="MaKhoaHoc" />
                                        <asp:BoundField DataField="MaCT" HeaderText="Mã Chương Trình" SortExpression="MaCT" />
                                        <asp:BoundField DataField="STT" HeaderText="STT" SortExpression="STT" />
                                        <asp:BoundField DataField="MaNganh" HeaderText="Mã Ngành" SortExpression="MaNganh" />
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
                                <div class="modal-header bg-primary">
                                    <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <asp:UpdatePanel ID="upAdd" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <%-- (([MaLop], [MaKhoaHoc], [MaCT], [STT], [MaNganh]))--%>
                                            <table class="table">
                                                <tr>
                                                    <td>Mã Lớp Học: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaLop" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Khóa Học: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaKhoaHoc" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Chương Trình: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaCT" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>STT: </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSTT" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Ngành: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaNganh" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn btn-space btn-success" OnClick="btnAddRecord_Click"><span class="mdi mdi-floppy"></span> Save</asp:LinkButton>
                                            <button class="btn btn-space btn-secondary" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close-circle"></span>Close</button>
                                  
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
                                                <asp:FileUpload ID="FileUpload1" class="form-control form-control-lg" type="file" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn btn-space btn-success" OnClick="btnImportRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Import</asp:LinkButton>
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
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title" id="editModalLabel">Edit</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <asp:UpdatePanel ID="upEdit" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <%-- (([MaLop], [MaKhoaHoc], [MaCT], [STT], [MaNganh]))--%>
                                            <table class="table">
                                                <tr>
                                                    <td>Mã Lớp Học: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaLop1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Khóa Học: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaKhoaHoc1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Chương Trình: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaCT1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>STT: </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSTT1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mã Ngành: (*)</td>
                                                    <td>
                                                        <asp:TextBox ID="txtMaNganh1" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                            <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-space btn-success" OnClick="btnSave_Click"><span class="mdi mdi-floppy"></span> Update</asp:LinkButton>
                                            <button class="btn btn-space btn-secondary" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close-circle"></span>Close</button>
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
                            <div class="modal-header bg-danger">
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
                                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-space btn-danger" OnClick="btnDelete_Click"><span class="mdi mdi-delete"></span> Delete</asp:LinkButton>
                                        <button class="btn btn-space btn-secondary" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close-circle"></span>Cancel</button>
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

                <%--([MaLop], [MaKhoaHoc], [MaCT], [STT], [MaNganh])--%>
                <div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>"
                        DeleteCommand="DELETE FROM [tbl04_LopHoc] WHERE [MaLop] = @MaLop"
                        InsertCommand="INSERT INTO [tbl04_LopHoc] ([MaLop], [MaKhoaHoc], [MaCT], [STT], [MaNganh]) VALUES (@MaLop, @MaKhoaHoc, @MaCT, @STT, @MaNganh)"
                        SelectCommand="SELECT * FROM [tbl04_LopHoc] WHERE ([MaNganh] = @MaNganh)"
                        UpdateCommand="UPDATE [tbl04_LopHoc] SET [MaKhoaHoc] = @MaKhoaHoc, [MaCT] = @MaCT, [STT] = @STT, [MaNganh] = @MaNganh WHERE [MaLop] = @MaLop">
                        <DeleteParameters>
                            <asp:Parameter Name="MaLop" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MaLop" Type="String" />
                            <asp:Parameter Name="MaKhoaHoc" Type="String" />
                            <asp:Parameter Name="MaCT" Type="String" />
                            <asp:Parameter Name="STT" Type="Int32" />
                            <asp:Parameter Name="MaNganh" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlMaNganh" Name="MaNganh" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MaKhoaHoc" Type="String" />
                            <asp:Parameter Name="MaCT" Type="String" />
                            <asp:Parameter Name="STT" Type="Int32" />
                            <asp:Parameter Name="MaNganh" Type="String" />
                            <asp:Parameter Name="MaLop" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT * FROM [tbl09_Nganh] WHERE ([MaKhoa] = @MaKhoa)" DeleteCommand="DELETE FROM [tbl09_Nganh] WHERE [MaNganh] = @MaNganh" InsertCommand="INSERT INTO [tbl09_Nganh] ([MaNganh], [TenNganh], [MaKhoa]) VALUES (@MaNganh, @TenNganh, @MaKhoa)" UpdateCommand="UPDATE [tbl09_Nganh] SET [TenNganh] = @TenNganh, [MaKhoa] = @MaKhoa WHERE [MaNganh] = @MaNganh">
                        <DeleteParameters>
                            <asp:Parameter Name="MaNganh" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MaNganh" Type="String" />
                            <asp:Parameter Name="TenNganh" Type="String" />
                            <asp:Parameter Name="MaKhoa" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblMaKhoa" Name="MaKhoa" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TenNganh" Type="String" />
                            <asp:Parameter Name="MaKhoa" Type="String" />
                            <asp:Parameter Name="MaNganh" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <%-- <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT * FROM [tbl01_Khoa] WHERE ([MaKhoa] = @MaKhoa)" DeleteCommand="DELETE FROM [tbl01_Khoa] WHERE [MaKhoa] = @MaKhoa" InsertCommand="INSERT INTO [tbl01_Khoa] ([MaKhoa], [TenKhoa], [NamThanhLap]) VALUES (@MaKhoa, @TenKhoa, @NamThanhLap)" UpdateCommand="UPDATE [tbl01_Khoa] SET [TenKhoa] = @TenKhoa, [NamThanhLap] = @NamThanhLap WHERE [MaKhoa] = @MaKhoa">
                <DeleteParameters>
                    <asp:Parameter Name="MaKhoa" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaKhoa" Type="String" />
                    <asp:Parameter Name="TenKhoa" Type="String" />
                    <asp:Parameter Name="NamThanhLap" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="MaKhoa" SessionField="MaKhoa" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenKhoa" Type="String" />
                    <asp:Parameter Name="NamThanhLap" Type="Int32" />
                    <asp:Parameter Name="MaKhoa" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>--%>
                </div>
            </asp:Panel>
            <asp:Panel ID="panelThongBao" runat="server" Visible="False">
                <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
            </asp:Panel>
            <asp:Panel ID="panelError" runat="server" Visible="True">
                <h4 class="alert alert-warning" role="alert">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
