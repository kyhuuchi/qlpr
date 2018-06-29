<%@ Page Title="" Language="C#" MasterPageFile="~/Account/QuanTri.Master" AutoEventWireup="true" CodeBehind="DanhSachModuleQuyen.aspx.cs" Inherits="PRPO_Manage.Account.DanhSachModuleQuyen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div style="margin: 10px 0px 10px;">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Phân quyền truy cập module</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="form" data-backdrop="static">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thông tin quyền truy cập module</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="nguoidung">Người dùng:</label>
                                   <select class="form-control" id="select_nguoidung">
                                   <asp:Literal ID="lit_nguoidung" runat="server" Mode="PassThrough"></asp:Literal>
                                </select>
                                
                                <input type="hidden" class="form-control" id="id_module_quyen"/>
                            </div>
                            <div class="form-group">
                                <label for="module">Phân hệ:</label>
                                   <select class="form-control" id="select_module">
                                       <option value="PR">PR</option>
                                       <option value="PO">PO</option>
                                       <option value="Kho">Kho</option>
                                </select>
                            </div>
                             <div class="form-group">
                                <label for="quanly">Quyền truy cập:</label>
                                   <select class="form-control" id="select_quyen">
                                       <asp:Literal ID="lit_quyentruycap" Mode="PassThrough" runat="server"></asp:Literal>
                                   </select>
                                
                                
                            </div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" onclick="ThemModuleQuyen();">Đồng ý</button>
                        </form>
                    </div>
                
                </div>
            </div>
        </div>
    </div>

    <div>
        <table id="QuyenTable" class="display" width="100%">
            <thead>
                
                <tr>
                    <th>ID</th>
                    <th>Người dùng</th>
                    <th>Phân hệ</th>
                    <th>Quyền truy cập</th>
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
                url: "/Webservice/dsnguoidung.asmx/LayDSModuleQuyen",
                success: function (data) {
                    var datatableVariable = $('#QuyenTable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'ID_Module_Quyen' },
                            { 'data': 'Ten_Nguoi_Dung' },
                            { 'data': 'Module' },
                            { 'data': 'Ten_Quyen' },
                             { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                             { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" }
                        ],
                        
                        "deferRender": true
                    });
                    $('.dt-edit').each(function () {
                        $(this).on('click', function (evt) {
                            $this = $(this);
                            
                            var dtRow = $this.parents('tr');
                            $("#id_quyen").val(dtRow[0].cells[0].innerHTML);
                            $("#tenquyen").val(dtRow[0].cells[1].innerHTML);
                            $("#maquyen").val(dtRow[0].cells[2].innerHTML);
                         
                            $('#myModal').modal('show');
                        });
                    });
                    $('.dt-delete').each(function () {
                        $(this).on('click', function (evt) {
                            $this = $(this);
                            var dtRow = $this.parents('tr');
                            if (confirm("Bạn có chắc muốn xóa quyền truy cập này?")) {
                                var dtRow = $this.parents('tr');
                                $("#id_quyen").val(dtRow[0].cells[0].innerHTML);
                                var data_pb;
                                if ($("#id_quyen").val() > 0) {
                                    data_pb = {
                                        action: 0,
                                        id_quyen: $("#id_quyen").val(),
                                        tenquyen: "",
                                        maquyen: ""
                                    
                                    };
                                    var stringReqdata = JSON.stringify(data_pb);
                                    jQuery.ajax({
                                        type: "POST",
                                        url: "/Webservice/dsnguoidung.asmx/ThemMoiQuyen",
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
                  
                }
            });
        
        });
    
       
        function ThemModuleQuyen() {
            //LUU Y: cac cot trong data_quyen chinh la cac tham so, phai de giong ten tham so
            var data_quyen;
            if ($("#id_module_quyen").val() > 0)
            {
                data_quyen = {
                    action: 2,
                    id_modulequyen: $("#id_module_quyen").val(),
                    id_nguoidung: $("#select_nguoidung :selected").val(),
                    module: $("#select_module :selected").val(),
                    id_quyen: $("#select_quyen :selected").val()
                 
                };
            }
            else
            {
                data_quyen = {
                    action: 2,
                    id_modulequyen: 0,
                    id_nguoidung: $("#select_nguoidung :selected").val(),
                    module: $("#select_module :selected").val(),
                    id_quyen: $("#select_quyen :selected").val()
                };
            }
            
            var stringReqdata = JSON.stringify(data_quyen);
            jQuery.ajax({
                type: "POST",
                url: "/Webservice/dsnguoidung.asmx/ThemMoiModuleQuyen",
                data: stringReqdata,
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    location.reload();;
                }
            });
        }
        $('#myModal').on('hidden.bs.modal', function () {
            
            location.reload();
        });
   
        
    </script>
</asp:Content>
