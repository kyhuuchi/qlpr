<%@ Page Title="QUẢN LÝ PR-PO" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PRPO_Manage._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay"><div id="text"><img id="img-responsive" src="/Images/loader.gif" alt=""/></div></div> 
    <div class="form-group col-md-12">
        <a href="/Pages/PR/TaoPR.aspx"><button type="button" class="btn btn-primary btn-sm" onclick="ShowLoading()" style="display:none" id="btt_taomoipr">Tạo mới PR</button></a>
        <%--<a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>Tạo PR</a>--%>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#luutam">Danh sách PR lưu tạm <span class="badge" id="soluongpr_luutam"></span></a></li>
        <li><a data-toggle="tab" href="#chuaduyet">Danh sách PR chưa duyệt <span class="badge" id="soluongpr_chuaduyet"></span></a></li>
        <li><a data-toggle="tab" href="#daduyet">Danh sách PR đã duyệt <span class="badge" id="soluongpr_daduyet"></span></a></li>
        <li><a data-toggle="tab" href="#conlai">Danh sách PR chưa tạo PO <span class="badge" id="soluongpr_conlai"></span></a></li>
        <li><a data-toggle="tab" href="#dadong">Danh sách PR đã đóng <span class="badge" id="soluongpr_dadong"></span></a></li>
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
        <div id="daduyet" class="tab-pane fade">
           <div class="panel-group" id="accordion_daduyet">
               </div>
        </div>
         <div id="conlai" class="tab-pane fade">
           <div class="panel-group" id="accordion_conlai">
               </div>
        </div>
         <div id="dadong" class="tab-pane fade">
           <div class="panel-group" id="accordion_dadong">
               </div>
        </div>
    </div>
<script type="text/javascript">
    function ShowLoading() {
        $("#overlay").show();
    }
    $("#overlay").show();
    $(document).ready(function () {
        //kiem tra xem user hien tai khong phai la nguoi mua hang
        if ($("#muahang").val() == 'false')
        {
            $("#btt_taomoipr").removeAttr("style");
        }

        //********************************************//


        //*** Xu ly load thong tin cac PR luu tam  *** ///
        //lay thong tin tat ca phong ban 
        var soluongdata = 0;
        var dt_pr;
        
        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPR_TinhTrang",
            data: {
                "tinhtrang": 1,
                "id_bp": Number($("#id_bophan").val()),
                "muahang": $("#muahang").val()==='true',
                "kho": $("#kho").val() === 'true'
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
                    str_dt=str_dt+'<div class="panel panel-default">';
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
                    str_dt=str_dt+'<th>Số PR</th>';
                    str_dt = str_dt + '<th>Tổng tiền (VND)</th>';
                    str_dt = str_dt + '<th>Tổng số lượng yêu cầu</th>';
                    str_dt=str_dt+'<th>Công dụng</th>';
                    str_dt = str_dt + '<th>Ngày tạo</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
                    str_dt=str_dt+'<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt=str_dt+'</tr>';
                    str_dt=str_dt+'</thead><tbody>';
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
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "sopr": 0,
                        "sopr_full": "",
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 1,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("LuuTamTable" + s);
                        
                        //var datatableVariable = $('#LuuTamTable'+s).DataTable({
                        //    data: data,
                        //    columns: [
                        //        { 'data': 'So_PR_Full' },
                        //        { 'data': 'Tong_Tien',render: $.fn.dataTable.render.number('.', ',', 0, '')},
                        //        { 'data': 'Tong_So_Luong_Yeu_cau', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                        //        { 'data': 'Cong_Dung' },
                        //        {
                        //            'data': 'Ngay_Tao', 'render': function (date) {
                        //                var date = new Date(parseInt(date.substr(6)));
                        //                var month = date.getMonth() + 1;
                        //                return date.getDate() + "/" + month + "/" + date.getFullYear();
                        //            }
                        //        },
                        //        { 'data': 'Ten_Nguoi_De_Xuat' },
                        //         { 'data': 'Ghi_Chu' },

                        //         { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },
                        //         { "defaultContent": "<button type='button' id='btnDelete' class='btn btn-danger btn-xs dt-delete' style='margin-right:16px;'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>" }
                        //    ],

                        //    "deferRender": true
                        //});
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                // var date = new Date(parseInt(data[i]["Ngay_Tao"].substr(6)));
                                var date = new Date(data[i]["Ngay_Tao"]);
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaytao = ngay + "/" + month + "/" + date.getFullYear();

                                if ($("#id_user").val() == data[i]["ID_Nguoi_De_Xuat"]) {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
                                        
                                    }

                                }
                                else {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td></tr>';
                                    }
                                }


                            }

                            $("#LuuTamTable" + s + " tbody").append(str_tr);

                            $("#LuuTamTable" + s).dataTable({
                                "order": []
                            });
                        }
                    
                    }

                })
                  
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
         


           
        }
       //************************************************//

        //*** Xu ly load thong tin cac PR luu chua duyet  *** ///
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
            url: "/Webservice/dsnguoidung.asmx/ThongTinPR_TinhTrang",
            data: {
                "tinhtrang": 2,
                "id_bp": Number($("#id_bophan").val()),
                "muahang": $("#muahang").val() === 'true',
                "kho": $("#kho").val() === 'true'
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_luutam = document.getElementById('accordion_chuaduyet');
                var sl_luutam = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_luutam += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-default">';
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
                    str_dt = str_dt + '<th>Số PR</th>';
                    str_dt = str_dt + '<th>Tổng tiền (VND)</th>';
                    str_dt = str_dt + '<th>Tổng số lượng yêu cầu</th>';
                    str_dt = str_dt + '<th>Công dụng</th>';
                    str_dt = str_dt + '<th>Ngày tạo</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
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
                document.getElementById("soluongpr_chuaduyet").textContent = sl_luutam;
                ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPRChuaDuyet(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPRChuaDuyet(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "sopr": 0,
                        "sopr_full": "",
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 2,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("ChuaDuyetTable" + s);
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {
                               // console.log("ngaytao:" + data[i]["Ngay_Tao"] + " so int:" + data[i]["Ngay_Tao"].substr(6));
                                var date = new Date(data[i]["Ngay_Tao"]);
                               // console.log("date: "+date);

                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaytao = ngay + "/" + month + "/" + date.getFullYear();

                                if ($("#id_user").val() == data[i]["ID_Nguoi_De_Xuat"]) {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td></td></tr>';

                                    }

                                }
                                else if ($("#muahang").val() == 'true')
                                {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td><button type="button" id="btnApprove" class="btn btn-success btn-xs dt-approve-chuaduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-saved" aria-hidden="true"></span></button></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnDelete" class="btn btn-danger btn-xs dt-delete" style="margin-right:16px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td><td><button type="button" id="btnApprove" class="btn btn-success btn-xs dt-approve-chuaduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-saved" aria-hidden="true"></span></button></td></tr>';

                                    }
                                }
                                else {
                                    if (i % 2 == 0) {
                                        str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                    else {
                                        str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td></td><td></td><td></td></tr>';
                                    }
                                }


                            }

                            $("#ChuaDuyetTable" + s + " tbody").append(str_tr);

                            $("#ChuaDuyetTable" + s).dataTable({
                                "order": []
                            });
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
            url: "/Webservice/dsnguoidung.asmx/ThongTinPR_TinhTrang",
            data: {
                "tinhtrang": 3,
                "id_bp": Number($("#id_bophan").val()),
                "muahang": $("#muahang").val() === 'true',
                "kho": $("#kho").val() === 'true'
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_luutam = document.getElementById('accordion_daduyet');
                var sl_luutam = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_luutam += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-default">';
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
                    str_dt = str_dt + '<th>Số PR</th>';
                    str_dt = str_dt + '<th>Tổng tiền (VND)</th>';
                    str_dt = str_dt + '<th>Tổng số lượng yêu cầu</th>';
                    str_dt = str_dt + '<th>Công dụng</th>';
                    str_dt = str_dt + '<th>Ngày tạo</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
                    str_dt = str_dt + '<th>File đính kèm</th>';
                    if ($("#muahang")=='true')
                    {
                        str_dt = str_dt + '<th></th>';
                        str_dt = str_dt + '<th></th>';
                    }
                    else
                    {
                        str_dt = str_dt + '<th></th>';
                        
                    }
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead>';
                    str_dt = str_dt + '</table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_daduyet").textContent = sl_luutam;
                ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPRDaDuyet(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPRDaDuyet(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "sopr": 0,
                        "sopr_full": "",
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 3,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("DaDuyetTable" + s);
                        var datatableVariable = $('#DaDuyetTable' + s);
                        if ($("#muahang") == 'true')
                        {
                            datatableVariable.DataTable({
                                data: data,
                                columns: [
                                    { 'data': 'So_PR_Full' },
                                    { 'data': 'Tong_Tien', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                    { 'data': 'Tong_So_Luong_Yeu_cau', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                    { 'data': 'Cong_Dung' },
                                    {
                                        'data': 'Ngay_Tao', 'render': function (date) {
                                            var date = new Date(date);
                                            var month = date.getMonth() + 1;
                                            return date.getDate() + "/" + month + "/" + date.getFullYear();
                                        }
                                    },
                                    { 'data': 'Ten_Nguoi_De_Xuat' },
                                     { 'data': 'Ghi_Chu' },
                                     {
                                         'data': 'PR_Scan_File', 'render': function (data, type, row, meta) {
                                             if (type === 'display') {
                                                 data = '<a href="/upload/' + data + '" target="_blank">' + data + '</a>';
                                             }

                                             return data;
                                         }
                                     },
                                     { "defaultContent": "<button type='button' id='btnEdit' class='btn btn-primary btn-xs dt-edit-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>" },
                                     { "defaultContent": "<button type='button' id='btnApprove' class='btn btn-success btn-xs dt-approve-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-saved' aria-hidden='true'></span></button>" },

                                ],

                                "deferRender": true,
                                "order": []
                            });
                        }
                        else
                        {
                            datatableVariable.DataTable({
                                data: data,
                                columns: [
                                    { 'data': 'So_PR_Full' },
                                    { 'data': 'Tong_Tien', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                    { 'data': 'Tong_So_Luong_Yeu_cau', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                    { 'data': 'Cong_Dung' },
                                    {
                                        'data': 'Ngay_Tao', 'render': function (date) {
                                            var date = new Date(date);
                                            var month = date.getMonth() + 1;
                                            return date.getDate() + "/" + month + "/" + date.getFullYear();
                                        }
                                    },
                                    { 'data': 'Ten_Nguoi_De_Xuat' },
                                     { 'data': 'Ghi_Chu' },
                                     {
                                         'data': 'PR_Scan_File', 'render': function (data, type, row, meta) {
                                             if (type === 'display') {
                                                 data = '<a href="/upload/' + data + '" target="_blank">' + data + '</a>';
                                             }

                                             return data;
                                         }
                                     },
                                    { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },

                                ],

                                "deferRender": true,
                                "order": []
                            });
                        }


                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
      
          
       


        }
        //************************************************//

        //*** Xu ly load thong tin cac PR chua po  *** ///
        //lay thong tin tat ca phong ban 
        var soluongdata = 0;
        var dt_pr;

        $.ajax({
            type: "POST",
            async: false,
            url: "/Webservice/dsnguoidung.asmx/ThongTinPR_TinhTrang",
            data: {
                "tinhtrang": 5,
                "id_bp": Number($("#id_bophan").val()),
                "muahang": $("#muahang").val() === 'true',
                "kho": $("#kho").val() === 'true'
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_conlai = document.getElementById('accordion_conlai');
                var sl_conlai = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_conlai += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-default">';
                    str_dt = str_dt + '<div class="panel-heading">';
                    str_dt = str_dt + '<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_conlai' + i + '" href="#collapse_conlai' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_conlai_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt = str_dt + '</h4>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '<div id="collapse_conlai' + i + '" class="panel-collapse in">';
                    str_dt = str_dt + '<div class="panel-body">';
                    str_dt = str_dt + '<div>';
                    str_dt = str_dt + '<table id="ConLaiTable' + i + '" class="display" width="100%">';
                    str_dt = str_dt + '<thead>';
                    str_dt = str_dt + '<tr>';
                    str_dt = str_dt + '<th>Số PR</th>';
                    str_dt = str_dt + '<th>Tổng tiền (VND)</th>';
                    str_dt = str_dt + '<th>Tổng số lượng yêu cầu</th>';
                    str_dt = str_dt + '<th>Công dụng</th>';
                    str_dt = str_dt + '<th>Ngày tạo</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '<th></th>';
                    
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead>';
                    str_dt = str_dt + '</table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_conlai").textContent = sl_conlai;
                ds_pr_conlai.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPRConLai(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPRConLai(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "sopr": 0,
                        "sopr_full": "",
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 5,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("ConLaiTable" + s);
                     
                        if (data.length > 0)
                        {
                            if (data[0]["ID_Nguoi_De_Xuat"] == $("#id_user").val())
                            {
                                var datatableVariable = $('#ConLaiTable' + s).DataTable({
                                    data: data,
                                    columns: [
                                        { 'data': 'So_PR_Full' },
                                        { 'data': 'Tong_Tien', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                        { 'data': 'Tong_So_Luong_Yeu_cau', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                        { 'data': 'Cong_Dung' },
                                        {
                                            'data': 'Ngay_Tao', 'render': function (date) {
                                                var date = new Date(date);
                                                var month = date.getMonth() + 1;
                                                return date.getDate() + "/" + month + "/" + date.getFullYear();
                                            }
                                        },
                                        { 'data': 'Ten_Nguoi_De_Xuat' },
                                         { 'data': 'Ghi_Chu' },
                                         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },
                                         { "defaultContent": "<button type='button' id='btnClose' class='btn btn-warning btn-xs dt-close' style='margin-right:16px;'><span class='glyphicon glyphicon-lock' aria-hidden='true'></span></button>" }
                                         

                                    ],

                                    "deferRender": true,
                                    "order": []
                                });
                            }
                            else
                            {
                                var datatableVariable = $('#ConLaiTable' + s).DataTable({
                                    data: data,
                                    columns: [
                                        { 'data': 'So_PR_Full' },
                                        { 'data': 'Tong_Tien', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                        { 'data': 'Tong_So_Luong_Yeu_cau', render: $.fn.dataTable.render.number('.', ',', 0, '') },
                                        { 'data': 'Cong_Dung' },
                                        {
                                            'data': 'Ngay_Tao', 'render': function (date) {
                                                var date = new Date(date);
                                                var month = date.getMonth() + 1;
                                                return date.getDate() + "/" + month + "/" + date.getFullYear();
                                            }
                                        },
                                        { 'data': 'Ten_Nguoi_De_Xuat' },
                                         { 'data': 'Ghi_Chu' },
                                         { "defaultContent": "<button type='button' id='btnView' class='btn btn-primary btn-xs dt-view-daduyet' style='margin-right:16px;'><span class='glyphicon glyphicon-print' aria-hidden='true'></span></button>" },

                                    ],

                                    "deferRender": true,
                                    "order": []
                                });
                            }
                        }
                        

                      


                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
          
      
        }
        //************************************************//

        //*** Xu ly load thong tin cac PR da dong  *** ///
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
            url: "/Webservice/dsnguoidung.asmx/ThongTinPR_TinhTrang",
            data: {
                "tinhtrang": 4,
                "id_bp": Number($("#id_bophan").val()),
                "muahang": $("#muahang").val() === 'true',
                "kho": $("#kho").val() === 'true'
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_luutam = document.getElementById('accordion_dadong');
                var sl_luutam = 0;
                var str_dt = "";
                dt_pr = data;
                soluongdata = data.length;
                for (var i = 0; i < soluongdata; i++) {
                    sl_luutam += data[i]["SoLuong"];
                    str_dt = str_dt + '<div class="panel panel-default">';
                    str_dt = str_dt + '<div class="panel-heading">';
                    str_dt = str_dt + '<h4 class="panel-title">';
                    str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_dadong' + i + '" href="#collapse_dadong' + i + '">' + data[i]["TenPhongBan"] + '<span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;">' + data[i]["SoLuong"] + '</span></a>';
                    str_dt = str_dt + '</h4>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '<div id="collapse_dadong' + i + '" class="panel-collapse in">';
                    str_dt = str_dt + '<div class="panel-body">';
                    str_dt = str_dt + '<div>';
                    str_dt = str_dt + '<table id="DaDongTable' + i + '" class="display" width="100%">';
                    str_dt = str_dt + '<thead>';
                    str_dt = str_dt + '<tr>';
                    str_dt = str_dt + '<th>Số PR</th>';
                    str_dt = str_dt + '<th>Tổng tiền (VND)</th>';
                    str_dt = str_dt + '<th>Tổng số lượng yêu cầu</th>';
                    str_dt = str_dt + '<th>Công dụng</th>';
                    str_dt = str_dt + '<th>Ngày tạo</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
                    str_dt = str_dt + '<th></th>';
                    str_dt = str_dt + '</tr>';
                    str_dt = str_dt + '</thead><tbody>';
                    str_dt = str_dt + '</tbody></table>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';
                    str_dt = str_dt + '</div>';


                }
                document.getElementById("soluongpr_dadong").textContent = sl_luutam;
                ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);

            },

        })
        .done(LayDataPRDaDong(dt_pr))
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error" + errorThrown);
        });

        //ham lay thoong tin cac pr roi chuyen vao table
        function LayDataPRDaDong(dt_pr) {

            for (var s = 0; s < dt_pr.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": dt_pr[s]["ID"],
                        "sopr": 0,
                        "sopr_full": "",
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 4,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("DaDongTable" + s);
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(data[i]["Ngay_Tao"]);
                                var month = date.getMonth() + 1;
                                var ngay = date.getDate();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (ngay < 10) {
                                    ngay = "0" + ngay;
                                }
                                var ngaytao = ngay + "/" + month + "/" + date.getFullYear();

                                if (i % 2 == 0) {
                                    str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td></tr>';
                                }
                                else {
                                    str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td></tr>';

                                }


                            }

                            $("#DaDongTable" + s + " tbody").append(str_tr);

                            $("#DaDongTable" + s).dataTable({
                                "order": []
                            });
                        }
                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }

        }
        //************************************************//
        //**********************************************//
        $('table tbody').on('click', '.dt-edit', function () {
            ShowLoading();
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
            window.location.replace("Pages/PR/SuaPR?pr=" + encodedString);
        });
        $('table tbody').on('click', '.dt-view-daduyet', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);

            window.open("Pages/PR/View.html?pr=" + encodedString, '_blank');
            //window.location.replace("Pages/PR/View.html?pr=" + encodedString);
        });
        $('table tbody').on('click', '.dt-delete', function () {
            $this = $(this);
            var dtRow = $this.parents('tr');
            if (confirm("Bạn có chắc muốn xóa PR này?")) {


                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 0,
                        "id": 0,
                        "id_phongban": 0,
                        "sopr": 0,
                        "sopr_full": dtRow[0].cells[0].innerHTML,
                        "nam": 0,
                        "congdung": "",
                        "ngaytao": "",
                        "thangtao": 0,
                        "tongsoluongyeucau": 0,
                        "tongtien": 0,
                        "ghichu": "",
                        "ngayduyet": "",
                        "id_nguoiduyet": 0,
                        "id_nguoidexuat": 0,
                        "tinhtrang": 1,
                        "prscanfile": "",
                        "sendmail": false,
                        "tieude1": "",
                        "tieude2": "",
                        "tieude3": "",
                        "tieude4": "",
                        "tieude5": "",
                        "tieude6": "",
                        "ngansachduocduyet1": 0,
                        "ngansachduocduyet2": 0,
                        "ngansachduocduyet3": 0,
                        "ngansachduocduyet4": 0,
                        "ngansachduocduyet5": 0,
                        "ngansachduocduyet6": 0,
                        "dexuatlannay1": 0,
                        "dexuatlannay2": 0,
                        "dexuatlannay3": 0,
                        "dexuatlannay4": 0,
                        "dexuatlannay5": 0,
                        "dexuatlannay6": 0,
                        "luyke1": 0,
                        "luyke2": 0,
                        "luyke3": 0,
                        "luyke4": 0,
                        "luyke5": 0,
                        "luyke6": 0,
                        "thuathieu1": 0,
                        "thuathieu2": 0,
                        "thuathieu3": 0,
                        "thuathieu4": 0,
                        "thuathieu5": 0,
                        "thuathieu6": 0
                    },
                    dataType: "json",

                    success: function (data) {
                        location.reload();
                    }
                });


            }
        });
        $('table tbody').on('click', '.dt-close', function () {
            $this = $(this);
            var dtRow = $this.parents('tr');
            if (confirm("Bạn có chắc muốn đóng PR này?")) {


                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/DongPR",
                    data: {
                        "so_pr_full": dtRow[0].cells[0].innerHTML

                    },
                    dataType: "json",

                    success: function (data) {
                        location.reload();
                    }
                });


            }
        });
        
        $('.dt-approve-daduyet').each(function () {
            $(this).on('click', function (evt) {
                $this = $(this);
                // Create Base64 Object
                var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

                var dtRow = $this.parents('tr');
                // Encode the String
                var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
                window.location.replace("Pages/PR/DuyetPR?pr=" + encodedString);

            });
        });
        $('.dt-approve-chuaduyet').each(function () {
            $(this).on('click', function (evt) {
                $this = $(this);
                // Create Base64 Object
                var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

                var dtRow = $this.parents('tr');
                // Encode the String
                var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
                window.location.replace("Pages/PR/DuyetPR?pr=" + encodedString);

            });
        });
        $("#overlay").hide();
    });
</script>
</asp:Content>
