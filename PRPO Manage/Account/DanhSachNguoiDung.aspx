<%@ Page Title="" Language="C#" MasterPageFile="~/Account/QuanTri.Master" AutoEventWireup="true" CodeBehind="DanhSachNguoiDung.aspx.cs" Inherits="PRPO_Manage.Account.DanhSachNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="margin: 10px 0px 10px;">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Tạo mới người dùng</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="form" data-backdrop="static">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thêm mới người dùng</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/action_page.php">
                            <div class="form-group">
                                <label for="tendangnhap">Tên đăng nhập:</label>
                                <input type="text" class="form-control" id="tendangnhap"/>
                            </div>
                            <div class="form-group">
                                <label for="tenhienthi">Tên hiển thị:</label>
                                <input type="text" class="form-control" id="tenhienthi"/>
                            </div>
                            <div class="form-group">
                                <label for="phongban">Phòng ban:</label>
                                <select class="form-control" id="select_phongban">
                                   <asp:Literal ID="lit_phongban" runat="server" Mode="PassThrough"></asp:Literal>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email"/>
                            </div>
                            <div class="form-group">
                                <label for="quanly">Quản lý:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_quanly" id="chk_quanly" value="0"/></label>
                                </div>
                                
                            </div>
                                <div class="form-group">
                                <label for="sudung">Sử dụng:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_sudung" id="chk_sudung" value="1"/></label>
                                </div>
                                
                            </div>
                                <div class="form-group">
                                <label for="admin">Admin:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_admin" id="chk_admin" value="0"/></label>
                                </div>
                                
                            </div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" onclick="ThemNguoiDung();">Đồng ý</button>
                        </form>
                    </div>
                
                </div>
            </div>
        </div>
    </div>

    <div>
        <table id="NguoiDungTable" class="table table-responsive table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên hiển thị</th>
                    <th>Tên đăng nhập</th>
                    <th>Đơn vị</th>
                    <th>Email</th>
                    <th>Ngày tạo</th>
                    <th>Quản lý</th>
                    <th>Đăng nhập domain</th>
                    <th>Đang sử dụng</th>
                    <th>Admin</th>
                </tr>
            </thead>
        </table>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/Webservice/dsnguoidung.asmx/LayDSNguoiDung",
                success: function (data) {
                    var datatableVariable = $('#NguoiDungTable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'ID_NguoiDung' },
                            { 'data': 'Ten_Hien_Thi' },
                            { 'data': 'Ten_Dang_Nhap' },
                            { 'data': 'ID_Phong_Ban' },
                            { 'data': 'Email' },
                            {
                                'data': 'Ngay_Tao', 'render': function (date) {
                                    var date = new Date(parseInt(date.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return date.getDate() + "/" + month + "/" + date.getFullYear();
                                }
                            },
                             { 'data': 'Quan_Ly' },
                             { 'data': 'Dang_Nhap_Domain' },
                             { 'data': 'Dang_Su_Dung' },
                             { 'data': 'Admin' },
                        ]

                    });
                    //$('#NguoiDungTable tfoot th').each(function () {
                    //    var placeHolderTitle = $('#studentTable thead th').eq($(this).index()).text();
                    //    $(this).html('<input type="text" class="form-control input input-sm" placeholder = "Search ' + placeHolderTitle + '" />');
                    //});
                    //datatableVariable.columns().every(function () {
                    //    var column = this;
                    //    $(this.footer()).find('input').on('keyup change', function () {
                    //        column.search(this.value).draw();
                    //    });
                    //});
                    //$('.showHide').on('click', function () {
                    //    var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
                    //    tableColumn.visible(!tableColumn.visible());
                    //});
                }
            });

        });

       
        function ThemNguoiDung() {
            var dsd = false;
            var ql = 0;
            var ad = false;
            if ($('#chk_sudung').is(":checked")) {
                dsd = true;
            }
            if ($('#chk_quanly').is(":checked")) {
                ql = 1;
            }
            if ($('#chk_admin').is(":checked")) {
                ad = true;
            }
            var data_nguoidung = {
                action: 2,
                id_nguoidung: 0,
                tendangnhap: $("#tendangnhap").val(),
                tenhienthi: $("#tenhienthi").val(),
                id_phongban: $("#select_phongban :selected").val(),
                email: $("#email").val(),
                dangsudung: dsd,
                quanly: ql,
                admin: ad
            };
            var stringReqdata = JSON.stringify(data_nguoidung);
            jQuery.ajax({
                type: "POST",
                url: "/Webservice/dsnguoidung.asmx/ThemMoiNguoiDung",
                data: stringReqdata,
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    alert("Đã thêm người dụng thành công: "+data);
                }
            });
        }
    </script>
</asp:Content>