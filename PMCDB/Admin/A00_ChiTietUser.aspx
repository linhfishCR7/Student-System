<%@ Page Title="" Language="C#" MasterPageFile="~/Sa.Master" AutoEventWireup="true" CodeBehind="A00_ChiTietUser.aspx.cs" Inherits="PMCDB.Admin.A00_ChiTietUser" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item maudo">
                UPDATE ROLE
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table">
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:DropDownList ID="ddlEmail" runat="server"
                                        DataSourceID="SqlDataSource2_Email"
                                        DataTextField="Email"
                                        DataValueField="Email" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                     <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaSo" CssClass="table" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaSo" HeaderText="Má Số" ReadOnly="True" SortExpression="MaSo" InsertVisible="False" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="MaKhoa" HeaderText="Mã Khoa" SortExpression="MaKhoa" />
                                <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


        <!--Bắt đầu Thêm -->
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
                                <%--([Email], [MaDuAn], [RoleId])--%>
                                <table class="table">
                                    <tr>
                                        <td>Email: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Project: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaKhoa" runat="server"
                                                DataSourceID="SqlDataSource3_DuAn"
                                                DataTextField="NoiDung"
                                                DataValueField="MaKhoa">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Role:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlRole" runat="server"
                                                DataSourceID="SqlDataSource4_Role"
                                                DataTextField="DienGiai"
                                                DataValueField="RoleId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                             <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Add</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span> Close</button>
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
                        <%--<asp:Button ID="btnImportRecord" runat="server" Text='Import'
                            CssClass="btn mauxanh" OnClick="btnImportRecord_Click" />
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true">Close</button>--%>

                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span> Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Kết thúc thêm-->


        <!--Bắt đầu Sửa -->
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
                                <table class="table">
                                    <tr>
                                        <td>Id: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtMaSo1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtEmail1" runat="server" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Project: (*)</td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaKhoa1" runat="server"
                                                DataSourceID="SqlDataSource3_DuAn"
                                                DataTextField="NoiDung"
                                                DataValueField="MaKhoa">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Role:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlRole1" runat="server"
                                                DataSourceID="SqlDataSource4_Role"
                                                DataTextField="DienGiai"
                                                DataValueField="RoleId">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                             <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><span class="glyphicon glyphicon-floppy-save"></span> Update</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span> Close</button>
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
        <!-- Kết thúc sửa -->


        <!--Bắt đầu Xóa-->
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
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!--Kết thúc xóa -->

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>"
                SelectCommand="SELECT * FROM [tbl00_ChiTietUser] WHERE ([Email] = @Email)" DeleteCommand="DELETE FROM [tbl00_ChiTietUser] WHERE [MaSo] = @MaSo" InsertCommand="INSERT INTO [tbl00_ChiTietUser] ([Email], [MaKhoa], [RoleId]) VALUES (@Email, @MaKhoa, @RoleId)" UpdateCommand="UPDATE [tbl00_ChiTietUser] SET [Email] = @Email, [MaKhoa] = @MaKhoa, [RoleId] = @RoleId WHERE [MaSo] = @MaSo">
                <DeleteParameters>
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaKhoa" Type="String" />
                    <asp:Parameter Name="RoleId" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEmail" Name="Email" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MaKhoa" Type="String" />
                    <asp:Parameter Name="RoleId" Type="String" />
                    <asp:Parameter Name="MaSo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2_Email" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT [Email] FROM [tbl00_User]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_DuAn" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT MaKhoa, MaKhoa + '_' + TenKhoa AS NoiDung FROM tbl01_Khoa"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4_Role" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" SelectCommand="SELECT * FROM [tbl00_Role]"></asp:SqlDataSource>
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
