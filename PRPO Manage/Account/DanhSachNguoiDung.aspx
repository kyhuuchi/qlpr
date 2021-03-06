﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Account/QuanTri.Master" AutoEventWireup="true" CodeBehind="DanhSachNguoiDung.aspx.cs" Inherits="PRPO_Manage.Account.DanhSachNguoiDung" %>

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
                        <form>
                            <div class="form-group">
                                <label for="tendangnhap">Tên đăng nhập:</label>
                                <input type="text" class="form-control" id="tendangnhap"/>
                                <input type="hidden" class="form-control" id="id_nguoidung"/>
                            </div>
                            <div class="form-group">
                                <label for="matkhau">Mật khẩu:</label>
                                <input type="text" class="form-control" id="matkhau"/>
                                
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
                                <label for="domain">Đăng nhập domain:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_domain" id="chk_domain" value="0"/></label>
                                </div>
                                
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
                                        <input type="checkbox" name="chk_admin" id="chk_admin" value="0" /></label>
                                </div>

                            </div>
                             <div class="form-group">
                                <label for="kho">Kho:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_kho" id="chk_kho" value="0" /></label>
                                </div>

                            </div>
                               <div class="form-group">
                                <label for="muahang">Mua hàng:</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="chk_muahang" id="chk_muahang" value="0" /></label>
                                </div>

                            </div>
                            <button type="submit" class="btn btn-primary" onclick="ThemNguoiDung();">Đồng ý</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                            
                        </form>
                    </div>
                
                </div>
            </div>
        </div>
    </div>

    <div>
        <table id="NguoiDungTable" class="display" width="100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên hiển thị</th>
                    <th>Tên đăng nhập</th>
                    <th>Đơn vị</th>
                    <th>Email</th>
                    <th>Ngày tạo</th>
                    <th>Domain</th>
                    <th>Quản lý</th>
                    <th>Đang sử dụng</th>
                    <th>Admin</th>
                     <th>Kho</th>
                     <th>Mua hàng</th>
                    <th></th>
                    <th></th>
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
                            { 'data': 'Phong_Ban' },
                            { 'data': 'Email' },
                            {
                                'data': 'Ngay_Tao', 'render': function (date) {
                                    var date = new Date(parseInt(date.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return date.getDate() + "/" + month + "/" + date.getFullYear();
                                }
                            },
                              { 'data': 'Dang_Nhap_Domain' },
                             { 'data': 'Quan_Ly' },
                             { 'data': 'Dang_Su_Dung' },
                             { 'data': 'Admin' },
                             { 'data': 'Quan_Ly_Kho' },
                             { 'data': 'Quan_Ly_Mua_Hang' },
                             { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                             { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" }
                        ],
                        
                        "deferRender": true
                      
                    });
                  
                  
                }
            });
            $('#NguoiDungTable').on('click', '.dt-edit', function () {
                $this = $(this);

                var dtRow = $this.parents('tr');
                $("#id_nguoidung").val(dtRow[0].cells[0].innerHTML);
                $("#tendangnhap").val(dtRow[0].cells[2].innerHTML);
                $("#tenhienthi").val(dtRow[0].cells[1].innerHTML);
                $("#select_phongban > option").each(function () {
                    if (dtRow[0].cells[3].innerHTML == this.text) {
                        $("#select_phongban").val(this.value);
                    }

                });
                $("#email").val(dtRow[0].cells[4].innerHTML);
                if (dtRow[0].cells[6].innerHTML == 'true') {
                    $("#chk_domain").prop('checked', 'TRUE');
                }
                if (dtRow[0].cells[7].innerHTML == 'true') {
                    $("#chk_quanly").prop('checked', 'TRUE');
                }
                if (dtRow[0].cells[8].innerHTML == 'true') {
                    $("#chk_sudung").prop('checked', 'TRUE');
                }
                if (dtRow[0].cells[9].innerHTML == 'true') {
                    $("#chk_admin").prop('checked', 'TRUE');
                }
                if (dtRow[0].cells[10].innerHTML == 'true') {
                    $("#chk_kho").prop('checked', 'TRUE');
                }
                if (dtRow[0].cells[11].innerHTML == 'true') {
                    $("#chk_muahang").prop('checked', 'TRUE');
                }
                //dung de duyet cac gia tri trong o duoc chon
                //for (var i = 0; i < dtRow[0].cells.length; i++) {

                //    $('div.modal-body').append('Cell (column, row) ' + dtRow[0].cells[i]._DT_CellIndex.column + ', ' + dtRow[0].cells[i]._DT_CellIndex.row + ' => innerHTML : ' + dtRow[0].cells[i].innerHTML + '<br/>');
                //}
                $('#myModal').modal('show');
            });
            $('#NguoiDungTable').on('click', '.dt-delete', function () {
                $this = $(this);
                var dtRow = $this.parents('tr');
                if (confirm("Bạn có chắc muốn xóa người dùng này?")) {
                    var dtRow = $this.parents('tr');
                    $("#id_nguoidung").val(dtRow[0].cells[0].innerHTML);
                    var data_nguoidung;
                    if ($("#id_nguoidung").val() > 0) {
                        data_nguoidung = {
                            action: 0,
                            id_nguoidung: $("#id_nguoidung").val(),
                            tendangnhap: "",
                            tenhienthi: "",
                            id_phongban: 0,
                            email: "",
                            dangsudung: false,
                            quanly: false,
                            admin: false,
                            quanlykho: false,
                            quanlymuahang: false,
                            matkhau: "",
                            domain:false
                        };
                        var stringReqdata = JSON.stringify(data_nguoidung);
                        jQuery.ajax({
                            type: "POST",
                            url: "/Webservice/dsnguoidung.asmx/ThemMoiNguoiDung",
                            data: stringReqdata,
                            dataType: "json",
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                location.reload();
                            }
                        });
                    }


                }
            });
        });
    
       
        function ThemNguoiDung() {
            var dsd = false;
            var ql = false;
            var ad = false;
            var kho = false;
            var domain = false;
            var muahang = false;
            var data_nguoidung;
            if ($('#chk_domain').is(":checked")) {
                domain = true;
            }
            if ($('#chk_sudung').is(":checked")) {
                dsd = true;
            }
            if ($('#chk_quanly').is(":checked")) {
                ql = true;
            }
            if ($('#chk_admin').is(":checked")) {
                ad = true;
            }
            if ($('#chk_kho').is(":checked")) {
                kho = true;
            }
            if ($('#chk_muahang').is(":checked")) {
                muahang = true;
            }
            if ($("#id_nguoidung").val() >0)
            {
                data_nguoidung = {
                    action: 2,
                    id_nguoidung: $("#id_nguoidung").val(),
                    tendangnhap: $("#tendangnhap").val(),
                    tenhienthi: $("#tenhienthi").val(),
                    id_phongban: $("#select_phongban :selected").val(),
                    email: $("#email").val(),
                    dangsudung: dsd,
                    quanly: ql,
                    admin: ad,
                    quanlykho: kho,
                    quanlymuahang: muahang,
                    matkhau: $("#matkhau").val(),
                    domain: domain
                };
                
            }
            else
            {
                data_nguoidung = {
                    action: 2,
                    id_nguoidung: 0,
                    tendangnhap: $("#tendangnhap").val(),
                    tenhienthi: $("#tenhienthi").val(),
                    id_phongban: $("#select_phongban :selected").val(),
                    email: $("#email").val(),
                    dangsudung: dsd,
                    quanly: ql,
                    admin: ad,
                    quanlykho: kho,
                    quanlymuahang: muahang,
                    matkhau: $("#matkhau").val(),
                    domain: domain
                };
            }
            
            var stringReqdata = JSON.stringify(data_nguoidung);
            jQuery.ajax({
                type: "POST",
                url: "/Webservice/dsnguoidung.asmx/ThemMoiNguoiDung",
                data: stringReqdata,
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    location.reload();
                }
            });
        }
        $('#myModal').on('hidden.bs.modal', function () {
            
            location.reload();
        });
   
        
     
    </script>

</asp:Content>