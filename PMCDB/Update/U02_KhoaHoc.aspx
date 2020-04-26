<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="U02_KhoaHoc.aspx.cs" Inherits="PMCDB.Update.U02_KhoaHoc" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
      
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group">
            <div class="list-group-item DodgerBlue">
                Cập Nhật Khóa Học
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <table class="table">
                            <%--<tr>
                                <td>Project Id:</td>
                                <td>
                                    <asp:Label ID="lblMaDuAn" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Project Name:</td>
                                <td>
                                    <asp:Label ID="lblTenDuAn" runat="server" Text=""></asp:Label></td>
                            </tr>--%>
                            <tr>                                
                               <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn maureu" OnClick="btnImport_Click"><span class="glyphicon glyphicon-cloud-upload"></span> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="MaKhoaHoc" CssClass="table" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" Text='<i class="glyphicon glyphicon-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="MaKhoaHoc" HeaderText="Mã Khóa Học" ReadOnly="True" SortExpression="MaKhoaHoc" />
                                <asp:BoundField DataField="NamBatDau" HeaderText="Năm Bắt Đầu" SortExpression="NamBatDau" />
                                <asp:BoundField DataField="NamKetThuc" HeaderText="Năm Kết Thúc" SortExpression="NamKetThuc" />
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
                                   <%-- <%--([MaKhoaHoc], [NamBatDau], [NamKetThuc])--%>
                                    <table class="table">
                                        <tr>
                                            <td>Mã Khóa Học (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaKhoaHoc" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>Năm Bắt Đầu: </td>
                                            <td>
                                                <asp:TextBox ID="txtNamBatDau" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%-- <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNamBatDau_CalendarExtender" TargetControlID="txtNamBatDau" 
                                                ID="txtNamBatDau_CalendarExtender" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Năm Kết Thúc: </td>
                                            <td>
                                                <asp:TextBox ID="txtNamKetThuc" runat="server" CssClass="form-control" ></asp:TextBox>
                                                <%-- <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNamKetThuc_CalendarExtender" TargetControlID="txtNamKetThuc" 
                                                ID="txtNamKetThuc_CalendarExtender" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>--%>
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
                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><span class="glyphicon glyphicon-floppy-save"></span> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span> Close</button>
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
                                          <%-- <%--([MaKhoaHoc], [NamBatDau], [NamKetThuc])--%>
                                    <table class="table">
                                        <tr>
                                            <td>Mã Khóa Học (*)</td>
                                            <td>
                                                <asp:TextBox ID="txtMaKhoaHoc1" runat="server" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Năm Bắt Đầu: </td>
                                            <td>
                                                <asp:TextBox ID="txtNamBatDau1" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%-- <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNamBatDau1_CalendarExtender" TargetControlID="txtNamBatDau1" 
                                                ID="txtNamBatDau1_CalendarExtender" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Năm Kết Thúc: </td>
                                            <td>
                                                <asp:TextBox ID="txtNamKetThuc1" runat="server" CssClass="form-control" ></asp:TextBox>
                                               <%--  <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNamKetThuc1_CalendarExtender" TargetControlID="txtNamKetThuc1" 
                                                ID="txtNamKetThuc1_CalendarExtender" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>--%>
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
        <%--KẾT THÚC XÓA--%>

        <%--([MaHangMuc], [TenHangMuc], [MaDuAn])--%>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMCDBConnectionString %>" 
                DeleteCommand="DELETE FROM [tbl02_KhoaHoc] WHERE [MaKhoaHoc] = @MaKhoaHoc" 
                InsertCommand="INSERT INTO [tbl02_KhoaHoc] ([MaKhoaHoc], [NamBatDau], [NamKetThuc]) VALUES (@MaKhoaHoc, @NamBatDau, @NamKetThuc)" 
                SelectCommand="SELECT * FROM [tbl02_KhoaHoc]" 
                UpdateCommand="UPDATE [tbl02_KhoaHoc] SET [NamBatDau] = @NamBatDau, [NamKetThuc] = @NamKetThuc WHERE [MaKhoaHoc] = @MaKhoaHoc">
                <DeleteParameters>
                    <asp:Parameter Name="MaKhoaHoc" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaKhoaHoc" Type="String" />
                    <asp:Parameter Name="NamBatDau" Type="Int32" />
                    <asp:Parameter Name="NamKetThuc" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NamBatDau" Type="Int32" />
                    <asp:Parameter Name="NamKetThuc" Type="Int32" />
                    <asp:Parameter Name="MaKhoaHoc" Type="String" />
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
