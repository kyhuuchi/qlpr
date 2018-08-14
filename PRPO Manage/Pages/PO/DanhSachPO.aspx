<%@ Page Title="PO" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DanhSachPO.aspx.cs" Inherits="PRPO_Manage.Pages.PO.DanhSachPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="overlay"><div id="text"><img id="img-responsive" src="/Images/loader.gif" alt=""/></div></div> 
    <div class="form-group col-md-12">
        <a href="/Pages/PO/TaoPO.aspx"><button type="button" class="btn btn-primary btn-sm">Tạo mới PO</button></a>
        <%--<a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>Tạo PR</a>--%>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#luutam">Danh sách PO lưu tạm <span class="badge" id="soluongpr_luutam"></span></a></li>
        <li><a data-toggle="tab" href="#chuaduyet">Danh sách PO chưa duyệt <span class="badge" id="soluongpr_chuaduyet"></span></a></li>
        <li><a data-toggle="tab" href="#tralai">Danh sách PO trả lại <span class="badge" id="soluongpr_tralai"></span></a></li>
        <li><a data-toggle="tab" href="#daduyet">Danh sách PO đã duyệt <span class="badge" id="soluongpr_daduyet"></span></a></li>
    </ul>

    <div class="tab-content" style="margin-top: 5px;">
        <div id="luutam" class="tab-pane fade in active">
            <div class="panel-group" id="accordion_luutam">
            </div>
        </div>
        <div id="chuaduyet" class="tab-pane fade">
            <div class="panel-group" id="accordion_chuaduyet">
              
            </div>
        </div>
           <div id="tralai" class="tab-pane fade">
            <div class="panel-group" id="accordion_tralai">
              
            </div>
        </div>
        <div id="daduyet" class="tab-pane fade">
           <div class="panel-group" id="accordion_daduyet">
               </div>
        </div>
       
    </div>
     <div class="modal fade" id="myModal" role="form" data-backdrop="static">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Thông tin trả lại PO</h4>
                                        </div>
                                        <div class="modal-body">
                                            
                                                <div class="form-group">
                                                    <label for="sopo_resent">Số PO:</label>
                                                    <input type="text" class="form-control" id="sopo_resent" readonly/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ghichu_po">Ghi chú:</label>
                                                    <textarea class="form-control" id="ghichu_po"></textarea>
                                                </div>
                                              
                                                
                                                <input type="button" class="btn btn-primary" id="DongY" data-dismiss="modal" value="Đồng ý" />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                
                                            
                                        </div>

                                    </div>
                                </div>
                            </div>
<script type="text/javascript">
    $("#overlay").show();
    $(document).ready(function () {
       

        //********************************************//


        //*** Xu ly load thong tin cac PR luu tam  *** ///
        //lay thong tin tat ca phong ban 
        var soluongdata = 0;
        var dt_pr;
        
        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPO_TinhTrang",
            data: {
                "tinhtrang": 1
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_luutam = document.getElementById('accordion_luutam');
                var sl_luutam = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++)
                {
                    sl_luutam += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-primary">';
                    str_dt=str_dt+'<div class="panel-heading">';
                    str_dt=str_dt+'<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_luutam' + i + '" href="#collapse_luutam' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_luutam_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt=str_dt+'</h4>';
                    str_dt=str_dt+'</div>';
                    str_dt=str_dt+'<div id="collapse_luutam'+i+'" class="panel-collapse in">';
                    str_dt=str_dt+'<div class="panel-body">';
                    str_dt=str_dt+'<div>';
                    str_dt=str_dt+'<table id="LuuTamTable'+i+'" class="display" width="100%">';
                    str_dt=str_dt+'<thead>';
                    str_dt=str_dt+'<tr>';
                    str_dt=str_dt+'<th>Số PO</th>';
                    str_dt = str_dt + '<th>Ngày PO</th>';
                    str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                    str_dt=str_dt+'<th>Nhà cung cấp</th>';
                    str_dt = str_dt + '<th>Kho nhận</th>';
                    str_dt=str_dt+'<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt=str_dt+'</tr>';
                    str_dt = str_dt + '</thead><tbody>';
                    str_dt = str_dt + '</tbody></table>';
                    str_dt=str_dt+'</div>';
                    str_dt=str_dt+'</div>';
                    str_dt=str_dt+'</div>';
                    str_dt=str_dt+'</div>';
                    

                }
                document.getElementById("soluongpr_luutam").textContent = sl_luutam;
                ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPRLuuTam(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPRLuuTam(dt_pr)
        {

            for (var s = 0; s < dt_pr.length; s++)
            {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 1,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": "",
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 1
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("LuuTamTable" + s);
                        
                        //var datatableVariable = $('#LuuTamTable'+s).DataTable({
                        //    data: data,
                        //    columns: [
                        //        { 'data': 'So_PO_Full' },
                        //        {
                        //            'data': 'Ngay_PO', 'render': function (date) {
                        //                var date = new Date(parseInt(date.substr(6)));
                        //                var month = date.getMonth() + 1;
                        //                return date.getDate() + "/" + month + "/" + date.getFullYear();
                        //            }
                        //        },
                        //         { 'data': 'Ten_NguoiMuaHang' },
                        //          { 'data': 'Ten_Nha_Cung_Cap' },
                        //          { 'data': 'Kho_Nhan' },
                        //         { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" }
                        //    ],

                        //    "deferRender": true
                        //});
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(parseInt(data[i]["Ngay_PO"].substr(6)));
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaypo = ngay + "/" + month + "/" + date.getFullYear();

                                if ($("#id_user").val() == data[i]["ID_NguoiMuaHang"]) {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else {  
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                    }

                                }
                                else {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td></tr>';
                                    }
                                }


                            }

                            $("#LuuTamTable" + s + " tbody").append(str_tr);

                            $("#LuuTamTable" + s).dataTable();
                        }
                    
                    }

                })
                  
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
          
           
           
        }
     
       //************************************************//

        //*** Xu ly load thong tin cac PO luu chua duyet  *** ///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /****************************************************///
      
        var soluongdata = 0;
        var dt_pr;

        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPO_TinhTrang",
            data: {
                "tinhtrang": 2
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_chuaduyet = document.getElementById('accordion_chuaduyet');
                var sl_chuaduyet = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_chuaduyet += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-primary">';
                    str_dt = str_dt + '<div class="panel-heading">';
                    str_dt = str_dt + '<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_chuaduyet' + i + '" href="#collapse_chuaduyet' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt = str_dt + '</h4>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '<div id="collapse_chuaduyet' + i + '" class="panel-collapse in">';
                    str_dt = str_dt + '<div class="panel-body">';
                    str_dt = str_dt + '<div>';
                    str_dt = str_dt + '<table id="ChuaDuyetTable' + i + '" class="display" width="100%">';
                    str_dt = str_dt + '<thead>';
                    str_dt = str_dt + '<tr>';
                    str_dt = str_dt + '<th>Số PO</th>';
                    str_dt = str_dt + '<th>Ngày PO</th>';
                    str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                    str_dt = str_dt + '<th>Nhà cung cấp</th>';
                    str_dt = str_dt + '<th>Kho nhận</th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead><tbody>';
                    str_dt = str_dt + '</tbody></table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_chuaduyet").textContent = sl_chuaduyet;
                ds_pr_chuaduyet.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPOChuaDuyet(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPOChuaDuyet(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 1,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": "",
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 2
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("ChuaDuyetTable" + s);

                        //var datatableVariable = $('#ChuaDuyetTable' + s).DataTable({
                        //    data: data,
                        //    columns: [
                        //        { 'data': 'So_PO_Full' },
                        //        {
                        //            'data': 'Ngay_PO', 'render': function (date) {
                        //                var date = new Date(parseInt(date.substr(6)));
                        //                var month = date.getMonth() + 1;
                        //                return date.getDate() + "/" + month + "/" + date.getFullYear();
                        //            }
                        //        },
                        //         { 'data': 'Ten_NguoiMuaHang' },
                        //          { 'data': 'Ten_Nha_Cung_Cap' },
                        //          { 'data': 'Kho_Nhan' },
                        //         { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" },
                        //        { "defaultContent": "<button type='button' id='btnApprove' class='btn btn-success btn-xs dt-approve-chuaduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-saved' aria-hidden='true'></span></button>" }
                        //    ],

                        //    "deferRender": true
                        //});

                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(parseInt(data[i]["Ngay_PO"].substr(6)));
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaypo = ngay + "/" + month + "/" + date.getFullYear();

                                if ($("#id_user").val() == data[i]["ID_Nguoi_Duyet_PO"]) {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td><button type="button" id="btnApprove" class="btn btn-success btn-xs dt-approve-chuaduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-saved" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td><button type="button" id="btnApprove" class="btn btn-success btn-xs dt-approve-chuaduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-saved" aria-hidden="true"></span></button></td></tr>';
                                    }

                                }
                                else if ($("#id_user").val() == data[i]["ID_NguoiMuaHang"])
                                {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td></td></tr>';
                                    }
                                }
                                else {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                }


                            }

                            $("#ChuaDuyetTable" + s + " tbody").append(str_tr);

                            $("#ChuaDuyetTable" + s).dataTable();
                        }
                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
      
          
        }


        //************************************************//

        //************************************************//

        //*** Xu ly load thong tin cac PR da duyet  *** ///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /****************************************************///
      
        var soluongdata = 0;
        var dt_pr;

        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPO_TinhTrang",
            data: {
                "tinhtrang": 3
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_daduyet = document.getElementById('accordion_daduyet');
                var sl_daduyet = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_daduyet += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-primary">';
                    str_dt = str_dt + '<div class="panel-heading">';
                    str_dt = str_dt + '<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_daduyet' + i + '" href="#collapse_daduyet' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_daduyet_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt = str_dt + '</h4>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '<div id="collapse_daduyet' + i + '" class="panel-collapse in">';
                    str_dt = str_dt + '<div class="panel-body">';
                    str_dt = str_dt + '<div>';
                    str_dt = str_dt + '<table id="DaDuyetTable' + i + '" class="display" width="100%">';
                    str_dt = str_dt + '<thead>';
                    str_dt = str_dt + '<tr>';
                    str_dt = str_dt + '<th>Số PO</th>';
                    str_dt = str_dt + '<th>Ngày PO</th>';
                    str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                    str_dt = str_dt + '<th>Nhà cung cấp</th>';
                    str_dt = str_dt + '<th>Kho nhận</th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead><tbody>';
                    str_dt = str_dt + '</tbody></table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_daduyet").textContent = sl_daduyet;
                ds_pr_daduyet.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPODaDuyet(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPODaDuyet(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 1,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": "",
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 3
                    },
                    dataType: "json",
                    success: function (data) {
                        var table = document.getElementById("DaDuyetTable" + s);
                        //var datatableVariable;
                        ////kiem tra xem nguoi dang truy cap co phai la nguoi duyet PO ko?
                        ////Neu la nguoi duyet PO thi moi hien thi nut Resent
                        //datatableVariable = $('#DaDuyetTable' + s).DataTable({
                        //    data: data,
                        //    columns: [
                        //        { 'data': 'So_PO_Full' },
                        //        {
                        //            'data': 'Ngay_PO', 'render': function (date) {
                        //                var date = new Date(parseInt(date.substr(6)));
                        //                var month = date.getMonth() + 1;
                        //                return date.getDate() + "/" + month + "/" + date.getFullYear();
                        //            }
                        //        },
                        //         { 'data': 'Ten_NguoiMuaHang' },
                        //          { 'data': 'Ten_Nha_Cung_Cap' },
                        //          { 'data': 'Kho_Nhan' },
                        //         //{ "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnresent' class='btn btn-danger btn-xs dt-resent' style='margin-right:16px;'><span class='glyphicon glyphicon-log-out' aria-hidden='true'></span></button>" }
                        //    ],

                        //    "deferRender": true
                        //});
                        if (data.length > 0)
                        {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++)
                            {
                                
                                var date = new Date(parseInt(data[i]["Ngay_PO"].substr(6)));
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10)
                                {
                                    month = "0" + month;
                                }
                                if(ngay<10)
                                {
                                    ngay = "0" + ngay;
                                }
                                var ngaypo = ngay + "/" + month + "/" + date.getFullYear();
                                if ($("#id_user").val() == data[i]["ID_Nguoi_Duyet_PO"])
                                {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnresent" class="btn btn-danger btn-xs dt-resent" style="margin-right:16px;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnresent" class="btn btn-danger btn-xs dt-resent" style="margin-right:16px;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    
                                }
                                else
                                {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td></tr>';
                                    }
                                }
                                
                                
                            }
                        
                            $("#DaDuyetTable" + s + " tbody").append(str_tr);
                            
                            $("#DaDuyetTable" + s).dataTable();
                        }
                        
                    


                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
          
    
          
           
        }
        $("#DongY").click(function () {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/UpdatePOResent",
                data: {
                    "sopo_full": $("#sopo_resent").val(),
                    "ghichu": $("#ghichu_po").val()
                },
                dataType: "json",
                success: function (data) {
                   
                    location.reload();
                }

            })

                 .fail(function (jqXHR, textStatus, errorThrown) {
                     alert("error Cap nhat resent PO " + errorThrown);
                 });

        });


        //************************************************//

        //*** Xu ly load thong tin cac PR tra lai  *** ///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /***                                              ***///
        /****************************************************///

        var soluongdata = 0;
        var dt_pr;

        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPO_TinhTrang",
            data: {
                "tinhtrang": 4
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_tralai = document.getElementById('accordion_tralai');
                var sl_tralai = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_tralai += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-primary">';
                    str_dt = str_dt + '<div class="panel-heading">';
                    str_dt = str_dt + '<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_tralai' + i + '" href="#collapse_tralai' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_tralai_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt = str_dt + '</h4>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '<div id="collapse_tralai' + i + '" class="panel-collapse in">';
                    str_dt = str_dt + '<div class="panel-body">';
                    str_dt = str_dt + '<div>';
                    str_dt = str_dt + '<table id="TraLaiTable' + i + '" class="display" width="100%">';
                    str_dt = str_dt + '<thead>';
                    str_dt = str_dt + '<tr>';
                    str_dt = str_dt + '<th>Số PO</th>';
                    str_dt = str_dt + '<th>Ngày PO</th>';
                    str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                    str_dt = str_dt + '<th>Nhà cung cấp</th>';
                    str_dt = str_dt + '<th>Kho nhận</th>';
                    str_dt = str_dt + '<th>Lý do trả lại</th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead><tbody>';
                    str_dt = str_dt + '</tbody></table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_tralai").textContent = sl_tralai;
                ds_pr_tralai.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPOTraLai(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPOTraLai(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 1,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": "",
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 4
                    },
                    dataType: "json",
                    success: function (data) {
                        var table = document.getElementById("TraLaiTable" + s);
                   
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(parseInt(data[i]["Ngay_PO"].substr(6)));
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaypo = ngay + "/" + month + "/" + date.getFullYear();
                                
                                if ($("#id_user").val() == data[i]["ID_NguoiMuaHang"]) {
                                    if (i % 2 == 0)
                                    {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else
                                    {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                    }

                                }
                                else {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                }


                            }

                            $("#TraLaiTable" + s + " tbody").append(str_tr);

                            $("#TraLaiTable" + s).dataTable();
                        }




                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }

         
      

        }
        //************************************************//
        $('table tbody').on('click', '.dt-edit', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
            window.location.replace("SuaPO?po=" + encodedString);
        });

        $('table tbody').on('click', '.dt-delete', function () {
            $this = $(this);
            var dtRow = $this.parents('tr');
            if (confirm("Bạn có chắc muốn xóa PO này?")) {


                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 0,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": dtRow[0].cells[0].innerHTML,
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": 0,
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 1

                    },
                    dataType: "json",

                    success: function (data) {
                        location.reload();
                    }
                });


            }
        });

        $('table tbody').on('click', '.dt-view-daduyet', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);

            window.open("ViewPO.html?po=" + encodedString, '_blank');
            //window.location.replace("Pages/PR/View.html?pr=" + encodedString);
        });
        $('table tbody').on('click', '.dt-approve-chuaduyet', function () {
            $this = $(this);
            var dtRow = $this.parents('tr');
            if (confirm("Bạn có chắc muốn phê duyệt PO này?")) {


                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 2,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": dtRow[0].cells[0].innerHTML,
                        "nam": 0,
                        "ngaypo": "",
                        "thangpo": 0,
                        "id_nguoiphutrach": 0,
                        "id_nguoiduyet": 0,
                        "id_phongban": 0,
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 3

                    },
                    dataType: "json",

                    success: function (data) {
                        location.reload();
                    }
                });


            }
        });
        $('table tbody').on('click', '.dt-resent', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
            $("#myModal").modal('show');
            $("#sopo_resent").val(dtRow[0].cells[0].innerHTML);

        });
        $("#overlay").hide();
    });
   
</script>
</asp:Content>
