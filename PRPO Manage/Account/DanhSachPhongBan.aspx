<%@ Page Title="" Language="C#" MasterPageFile="~/Account/QuanTri.Master" AutoEventWireup="true" CodeBehind="DanhSachPhongBan.aspx.cs" Inherits="PRPO_Manage.Account.DanhSachPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
       <div style="margin: 10px 0px 10px;">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Tạo mới đơn vị</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="form" data-backdrop="static">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thông tin phòng ban</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="tenphongban">Tên đơn vị:</label>
                                <input type="text" class="form-control" id="tenphongban"/>
                                <input type="hidden" class="form-control" id="id_phongban"/>
                            </div>
                            <div class="form-group">
                                <label for="tenviettat">Tên viết tắt:</label>
                                <input type="text" class="form-control" id="tenviettat"/>
                            </div>
                            
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" onclick="ThemPhongBan();">Đồng ý</button>
                        </form>
                    </div>
                
                </div>
            </div>
        </div>
    </div>

    <div>
        <table id="DonViTable" class="display" width="100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên đơn vị</th>
                    <th>Tên viết tăt</th>
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
                url: "/Webservice/dsnguoidung.asmx/LayDSPhongBan",
                success: function (data) {
                    var datatableVariable = $('#DonViTable').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'ID_PhongBan' },
                            { 'data': 'Ten_Phong_Ban' },
                            { 'data': 'Ten_Viet_Tat' },
                             { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                             { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" }
                        ],
                        
                        "deferRender": true
                    });
                    $('.dt-edit').each(function () {
                        $(this).on('click', function (evt) {
                            $this = $(this);
                            
                            var dtRow = $this.parents('tr');
                            $("#id_phongban").val(dtRow[0].cells[0].innerHTML);
                            $("#tenphongban").val(dtRow[0].cells[1].innerHTML);
                            $("#tenviettat").val(dtRow[0].cells[2].innerHTML);
                         
                            $('#myModal').modal('show');
                        });
                    });
                    $('.dt-delete').each(function () {
                        $(this).on('click', function (evt) {
                            $this = $(this);
                            var dtRow = $this.parents('tr');
                            if (confirm("Bạn có chắc muốn xóa đơn vị này?")) {
                                var dtRow = $this.parents('tr');
                                $("#id_phongban").val(dtRow[0].cells[0].innerHTML);
                                var data_pb;
                                if ($("#id_phongban").val() > 0) {
                                    data_pb = {
                                        action: 0,
                                        id_phongban: $("#id_phongban").val(),
                                        tenphongban: "",
                                        tenviettat: ""
                                    
                                    };
                                    var stringReqdata = JSON.stringify(data_pb);
                                    jQuery.ajax({
                                        type: "POST",
                                        url: "/Webservice/dsnguoidung.asmx/ThemMoiPhongBan",
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
    
       
        function ThemPhongBan() {
          
            var data_phongban;
          
            if ($("#id_phongban").val() > 0)
            {
                data_phongban = {
                    action: 2,
                    id_phongban: $("#id_phongban").val(),
                    tenphongban: $("#tenphongban").val(),
                    tenviettat: $("#tenviettat").val()
                 
                };
            }
            else
            {
                data_phongban = {
                    action: 2,
                    id_phongban: 0,
                    tenphongban: $("#tenphongban").val(),
                    tenviettat: $("#tenviettat").val()
                 
                };
            }
            
            var stringReqdata = JSON.stringify(data_phongban);
            jQuery.ajax({
                type: "POST",
                url: "/Webservice/dsnguoidung.asmx/ThemMoiPhongBan",
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
