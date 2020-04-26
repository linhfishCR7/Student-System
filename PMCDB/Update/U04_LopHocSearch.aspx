<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="U04_LopHocSearch.aspx.cs" Inherits="PMCDB.Update.U04_LopHocSearch" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item DodgerBlue">
                Cập Nhật Lớp Học
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table">
                            <tr>
                                <td>Mã Khoa:</td>
                                <td>
                                    <asp:Label ID="lblMaKhoa" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Tên Khoa:</td>
                                <td>
                                    <asp:Label ID="lblTenKhoa" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>

                                <td>Mã Ngành:</td>
                                <td>
                                    <asp:DropDownList ID="ddlMaNganh" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TenNganh" DataValueField="MaNganh"></asp:DropDownList>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                    <a href="U04_LopHoc.aspx" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span> Quay Về</a>

                                </td>
                                <td>
                                    Search: <asp:TextBox ID="Txtsearch" runat="server"></asp:TextBox>
                                    <asp:Button ID="ButSearch" runat="server" Text="Search" OnClick="ButSearch_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaLop" CssClass="table" DataSourceID="" EmptyDataText="No SV FOUND!">
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
                                <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" ReadOnly="True" SortExpression="MaLop" />
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
                        <div class="modal-header">
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

        <%--(([MaLop], [MaKhoaHoc], [MaCT], [STT], [MaNganh])--%>
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
</asp:Content>