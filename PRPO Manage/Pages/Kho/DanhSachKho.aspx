<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DanhSachKho.aspx.cs" Inherits="PRPO_Manage.Pages.Kho.DanhSachKho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="overlay"><div id="text"><img id="img-responsive" src="/Images/loader.gif" alt=""/></div></div> 
    <div class="form-group col-md-12">
      <%--  <a href="/Pages/Kho/TaoPNK.aspx"><button type="button" class="btn btn-primary btn-sm">Tạo mới phiếu nhập kho</button></a>--%>
        <%--<a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>Tạo PR</a>--%>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#chuanhapkho">Danh sách PO chưa nhập kho <span class="badge" id="soluongpo_chuanhapkho"></span></a></li>
        <li><a data-toggle="tab" href="#dangnhapkho">Danh sách PO đang nhập kho <span class="badge" id="soluongpo_dangnhapkho"></span></a></li>
        <li><a data-toggle="tab" href="#danhapkho">Danh sách PO đã nhập kho <span class="badge" id="soluongpo_danhapkho"></span></a></li>
        <li><a data-toggle="tab" href="#danhsachphieunhapkho">Danh sách phiếu nhập kho <span class="badge" id="soluong_phieunhapkho"></span></a></li>
    </ul>

    <div class="tab-content" style="margin-top: 5px;">
        <div id="chuanhapkho" class="tab-pane fade in active">
            <div class="panel-group" id="accordion_chuanhapkho">
            </div>
        </div>
        <div id="dangnhapkho" class="tab-pane fade in active">
            <div class="panel-group" id="accordion_dangnhapkho">
            </div>
        </div>
        <div id="danhapkho" class="tab-pane fade">
            <div class="panel-group" id="accordion_danhapkho">
              
            </div>
        </div>
        <div id="danhsachphieunhapkho" class="tab-pane fade">
            <div class="panel-group" id="accordion_phieunhapkho">
              
            </div>
        </div>
    </div>
<script type="text/javascript">
    $("#overlay").show();
    $(document).ready(function () {
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
            url: "/Webservice/dsnguoidung.asmx/ThongTinKho_TinhTrang",
            data: {
                "tinhtrang": 0,
                "id_bp": $("#id_bophan").val()
            },
            dataType: "json",
            success: function (data) {
                var ds_pr_daduyet = document.getElementById('accordion_chuanhapkho');
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
                document.getElementById("soluongpo_chuanhapkho").textContent = sl_daduyet;
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
                                if (i % 2 == 0) {
                                    str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnEdit" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button></td><td><button type="button" id="btnresent" class="btn btn-danger btn-xs dt-resent" style="margin-right:16px;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></button></td></tr>';
                                }
                                else {
                                    str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td><td><button type="button" id="btnView" class="btn btn-primary btn-xs dt-view-daduyet" style="margin-right:16px;"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></button></td><td><button type="button" id="btnresent" class="btn btn-danger btn-xs dt-resent" style="margin-right:16px;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></button></td></tr>';
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


        //************************************************//
        $('table tbody').on('click', '.dt-edit', function () {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode(dtRow[0].cells[0].innerHTML);
            window.location.replace("SuaKho?po=" + encodedString);
        });
        $("#overlay").hide();
    });
    
</script>
</asp:Content>
