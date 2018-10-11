<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PRDaDuyet.aspx.cs" Inherits="PRPO_Manage.Pages.PR.PRDaDuyet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay"><div id="text"><img id="img-responsive" src="/Images/loader.gif" alt=""/></div></div> 
     <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#daduyet">Danh sách PR đã duyệt <span class="badge" id="soluongpr_daduyet"></span></a></li>
    </ul>
    <div class="tab-content" style="margin-top: 5px;">
          <div id="daduyet" class="tab-pane fade in active">
           <div class="panel-group" id="accordion_daduyet">
               </div>
        </div>
    </div>
<script type="text/javascript">
    function ShowLoading() {
        $("#overlay").show();
    }
    $("#overlay").show();
    $(document).ready(function () {
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
                "muahang": true,
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
                    str_dt = str_dt + '<th>Ngày duyệt</th>';
                    str_dt = str_dt + '<th>Người tạo</th>';
                    str_dt = str_dt + '<th>Ghi chú</th>';
                    str_dt = str_dt + '<th>File đính kèm</th>';
                    if ($("#muahang") == 'true') {
                        str_dt = str_dt + '<th></th>';
                        str_dt = str_dt + '<th></th>';
                    }
                    else {
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
                        if ($("#muahang") == 'true') {
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
                                     {
                                         'data': 'Ngay_Duyet', 'render': function (date) {
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
                        else {
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
                                    {
                                        'data': 'Ngay_Duyet', 'render': function (date) {
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
        $('table tbody').on('click', '.dt-view-daduyet', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);

            window.open("View.html?pr=" + encodedString, '_blank');
            //window.location.replace("Pages/PR/View.html?pr=" + encodedString);
        });
        $("#overlay").hide();
    });
</script>
</asp:Content>
