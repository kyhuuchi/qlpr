<%@ Page Title="" Language="C#" MasterPageFile="~/Account/QuanTri.Master" AutoEventWireup="true" CodeBehind="DanhSachQuyen.aspx.cs" Inherits="PRPO_Manage.Account.DanhSachQuyen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       <div style="margin: 10px 0px 10px;">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Tạo mới quyền truy cập</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="form" data-backdrop="static">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thông tin quyền truy cập</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="tenquyen">Tên quyền:</label>
                                <input type="text" class="form-control" id="tenquyen"/>
                                <input type="hidden" class="form-control" id="id_quyen"/>
                            </div>
                            <div class="form-group">
                                <label for="maquyen">Tên viết tắt:</label>
                                <input type="text" class="form-control" id="maquyen"/>
                            </div>
                            
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" onclick="ThemQuyen();">Đồng ý</button>
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
                    <th>Tên quyền</th>
                    <th>Mã quyền</th>
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
                url: "/Webservice/dsnguoidung.asmx/LayDSQuyen",
                success: function (data) {
                    var datatableVariable = $('#QuyenTable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'ID_Quyen' },
                            { 'data': 'Ten_Quyen' },
                            { 'data': 'Ma_Quyen' },
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
    
       
        function ThemQuyen() {
          
            var data_quyen;
          
            if ($("#id_quyen").val() > 0)
            {
                data_quyen = {
                    action: 2,
                    id_quyen: $("#id_quyen").val(),
                    tenquyen: $("#tenquyen").val(),
                    maquyen: $("#maquyen").val()
                 
                };
            }
            else
            {
                data_quyen = {
                    action: 2,
                    id_quyen: 0,
                    tenquyen: $("#tenquyen").val(),
                    maquyen: $("#maquyen").val()
                };
            }
            
            var stringReqdata = JSON.stringify(data_quyen);
            jQuery.ajax({
                type: "POST",
                url: "/Webservice/dsnguoidung.asmx/ThemMoiQuyen",
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
