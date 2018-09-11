<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DuyetPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.DuyetPR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../Images/loader.gif" alt="" />
        </div>
    </div>
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <p class="text-center font-weight-bold">THÔNG TIN PHÊ DUYỆT PR</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="ngaynhanpr">Ngày nhận PR</label>
                    <%--<input type="date" class="form-control" id="ngaynhanpr" runat="server"/>--%>
                    <div class="form-group">
                        <div class='input-group date' id='ngaynhanpr'>
                            <input type='text' class="form-control"/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>
                   </div>
                    <div class="form-group col-md-6">
                        <label for="ngayduyetpr">Ngày duyệt PR</label>
                        <%--<input type="date" class="form-control" id="ngayduyetpr" runat="server"/>--%>
                        <div class="form-group">
                            <div class='input-group date' id='ngayduyetpr'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                </span>
                            </div>
                        </div>
                        <input type="hidden" id="id_pr" runat="server" />
                        <input type="hidden" id="ngaynhanpr_hid" runat="server" />
                        <input type="hidden" id="ngayduyetpr_hid" runat="server" />
                    </div>
                </div>
            
            <div class="form-row">
                <div class="form-group">
                    <div class="form-group col-md-6">
                        <label for="nguoiduyetpr">Người duyệt PR</label>
                        <select class="form-control" id="nguoiduyetpr" runat="server" name="nguoiduyetpr">
                        </select>
                        <input type="hidden" id="id_nguoi_duyet" runat="server" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="uploadfele">Upload file</label>
                        <input type="file" id="uploadfile" name="uploadfile" />

                    </div>

                </div>
            </div>
          
        </div>
        <div class="row">
            <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-12">
                           
                            <div class="modal fade" id="myModal" role="form" data-backdrop="static">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Thêm mới / cập nhật vật tư</h4>
                                        </div>
                                        <div class="modal-body">
                                           <%-- <form>--%>
                                                <div class="form-group">
                                                    <label for="mavattu">Mã vật tư:</label>
                                                    <input type="text" class="form-control" id="mavattu" readonly/>
                                                    <input type="hidden" id="txt_vattu" runat="server"/>
                                                    
                                                    <input type="hidden" id="id_pr_chi_tiet"/>
                                                    <input type="hidden" id="leadtime"/>
                                                     <input type="hidden" id="nhommuaid" />
                                                     <input type="hidden" id="nhommuaname" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tenvattu">Tên vật tư:</label>
                                                    <input type="text" class="form-control" id="tenvattu" readonly/>
                                                </div>
                                               <%-- <div class="form-group">
                                                    <label for="dvt">Đơn vị tính:</label>
                                                    <input type="text" class="form-control" id="dvt" readonly/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tonkho">Tồn kho:</label>
                                                    <input type="number" class="form-control" id="tonkho" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="soluongyeucau">Số lượng yêu cầu:</label>
                                                    <input type="number" class="form-control" id="soluongyeucau" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="dongiatamtinh">Đơn giá tạm tính:</label>
                                                    <input type="number" class="form-control" id="dongiatamtinh" />
                                                    <input type="hidden" id="dongiatamtinh_notmask"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tigia">Tỉ giá:</label>
                                                    <input type="number" class="form-control" id="tigia" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanhtientamung">Thành tiền tạm ứng:</label>
                                                    <input type="text" class="form-control" id="thanhtientamung" readonly/>
                                                    <input type="hidden" id="thanhtientamung_notmask"/>
                                                </div>--%>
                                                <div class="form-group">
                                                    <label for="nhacungung">Nhà cung ứng:</label>
                                                    <input type="text" class="form-control" id="nhacungung" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="mavattu">Người PT mua hàng:</label>
                                                    <select class="form-control" id="select_nguoimuahang" style="width: 100%;">
                                                        
                                                    </select>
                                                </div>
                                             <%--   <div class="form-group">
                                                    <label for="tinhtrangvattu">Tình trạng VT:</label>
                                                    <input type="number" class="form-control" id="tinhtrangvattu" />
                                                </div>--%>
                                              <%--  <div class="form-group">
                                                    <label for="ngaycanhang">Ngày cần hàng:</label>
                                                   
                                                  <div class="form-group">
                                                    <div class='input-group date' id='ngaycanhang'>
                                                        <input type='text' class="form-control" readonly/>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                </div>--%>
                                                <%--<div class="form-group">
                                                    <label for="thoigiansudung">Thời gian sử dụng:</label>
                                                    <input type="text" class="form-control" id="thoigiansudung" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="congdungchitiet">Công dụng:</label>
                                                    <input type="text" class="form-control" id="congdungchitiet" />
                                                </div>--%>
                                                <input type="button" class="btn btn-primary" id="DongY" data-dismiss="modal" value="Đồng ý" />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                
                                         <%--   </form>--%>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="table_vattu">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">STT</th>
                                            <th scope="col">Mã hàng</th>
                                            <th scope="col">Tên hàng, Qui cách, Nhãn hiệu</th>
                                            <th scope="col">ĐVT</th>
                                            <th scope="col">Tồn kho</th>
                                            <th scope="col">Số lượng yêu cầu(*)</th>
                                            <th scope="col">Đơn giá tạm tính</th>
                                            <th scope="col">Tỉ giá(*)</th>
                                            <th scope="col">Thành tiền tạm tính</th>
                                            <th scope="col">Nhà cung ứng-Nước sản xuất</th>
                                            <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                            <th scope="col">Ngày cần hàng(*)</th>
                                            <th scope="col">Thời gian sử dụng</th>
                                            <th scope="col">Công dụng (diễn giải chi tiết)</th>
                                            <th scope="col">Người PT mua hàng</th>
                                        </tr>
                                    </thead>
                                  
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>

        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group">
                    <div class="form-group col-md-4">
                    </div>
                    <div class="form-group col-md-4" style="text-align: center">
                        <asp:Button class="btn btn-primary" ID="btt_OK" runat="server" Text="Đồng ý" OnClick="btt_OK_Click" />
                        <button type="button" class="btn btn-danger" onclick="Thoat()">Thoát</button>
                    </div>
                    <div class="form-group col-md-4">
                    </div>


                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
            var dsdata;
            var currentRow = null;
            $("#overlay").show();
            $(document).ready(function () {
                var urlParams = new URLSearchParams(window.location.search);
                if (!urlParams.has('pr')) {
                    alert("Tham số PR không có.");
                    window.location.replace("../../Default");
                }
                else {
                    $('#ngaynhanpr').datepicker({
                        format: 'dd/mm/yyyy',
                        todayHighlight: true
                    });
                    $('#ngaynhanpr').datepicker().on('changeDate', function (e) {
                        // console.log(e); //Where e contains date, dates and format
                        var ng = $("#ngaynhanpr").datepicker("getDate");
                        var date = new Date(ng);
                        var thangtao = date.getMonth() + 1;
                        var ngaytao = date.getDate();
                        var namtao = date.getFullYear();
                        var ngaynhanpr_hid = namtao + "-" + thangtao + "-" + ngaytao;

                        $("#ContentPlaceHolder1_ngaynhanpr_hid").val(ngaynhanpr_hid);
                    });
                    $('#ngayduyetpr').datepicker({
                        format: 'dd/mm/yyyy',
                        todayHighlight: true
                    });
                    $('#ngayduyetpr').datepicker().on('changeDate', function (e) {
                        //console.log(e); //Where e contains date, dates and format
                        var ng = $("#ngayduyetpr").datepicker("getDate");
                        var date = new Date(ng);
                        var thangtao = date.getMonth() + 1;
                        var ngaytao = date.getDate();
                        var namtao = date.getFullYear();
                        var ngayduyetpr_hid = namtao + "-" + thangtao + "-" + ngaytao;

                        $("#ContentPlaceHolder1_ngayduyetpr_hid").val(ngayduyetpr_hid);
                    });
                    var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

                    //// Decode the String
                    var decodedString = Base64.decode(urlParams.get('pr'));

                    //lay thong tin phong ban cua account dang truy cap
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "/Webservice/dsnguoidung.asmx/ActionPR",
                        data: {
                            "action": 1,
                            "id": 0,
                            "id_phongban": 0,
                            "sopr": 0,
                            "sopr_full": decodedString,
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
                            "tinhtrang": 0,
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
                            "thuathieu6": 0,
                        },
                        dataType: "json",
                        success: function (data) {

                            document.getElementById("ContentPlaceHolder1_id_pr").value = data[0]["ID_PR"];
                            $("#overlay").hide();
                        },

                    })

                    .fail(function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown);
                    });

                    //lay thong tin nguoi dun quan ly
                    $.ajax({
                        type: "POST",
                        url: "/Webservice/dsnguoidung.asmx/ThemMoiNguoiDung",
                        data: {
                            "action": 1,
                            "id_nguoidung": 0,
                            "tendangnhap": "",
                            "tenhienthi": "",
                            "id_phongban": 0,
                            "email": "",
                            "dangsudung": false,
                            "quanly": true,
                            "admin": false,
                            "quanlykho": false,
                            "quanlymuahang": false,
                            "matkhau": "",
                            "domain": false

                        },
                        dataType: "json",
                        success: function (data) {
                            //console.log(data);
                            var str = "";
                            for (var i = 0; i < data.length; i++) {
                                if (i == 0) {
                                    str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                                }
                                else {
                                    str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                                }

                            }
                            var opt_quanly = document.getElementById('ContentPlaceHolder1_nguoiduyetpr');
                            opt_quanly.insertAdjacentHTML('afterbegin', str);

                        },
                    })
                      .fail(function (jqXHR, textStatus, errorThrown) {
                          alert("error" + errorThrown);
                      });

                    //lay thong tin pr chi tiet
                    LayThongTinPRChiTiet();
                }

            });

            $("#ContentPlaceHolder1_nguoiduyetpr").change(function () {

                document.getElementById("ContentPlaceHolder1_id_nguoi_duyet").value = $(this).val();

            });
            function LayThongTinPRChiTiet() {
                var stt = 0;
                var markup = "";

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR_ChiTiet",
                    data: {
                        "action": 1,
                        "id": 0,
                        "idpr": Number($("#ContentPlaceHolder1_id_pr").val()),
                        "mahang": "",
                        "tenhang": "",
                        "dvt": "",
                        "tonkho": 0,
                        "soluongyeucau": 0,
                        "dongia": 0,
                        "tigia": 0,
                        "thanhtientamung": 0,
                        "nhacungcap": "",
                        "tinhtrangvattu": 100,
                        "ngaycanhang": "",
                        "thoigiansudung": "",
                        "congdung": "",
                        "leadtime": 0,
                        "nhommuaid": 0,
                        "nhommuaname": ""
                    },
                    dataType: "json",
                    success: function (data) {
                        //duyet array data tra ve gan tung dong cho table
                        for (var i = 0; i < data.length; i++) {
                            stt++;
                            //load ngay de xuat
                            //var dateString = data[i]["Ngay_Can_Hang"].substr(6);
                            var dateString = data[i]["Ngay_Can_Hang"];
                            var currentTime = new Date(dateString);
                            var month = currentTime.getMonth() + 1;
                            var day = currentTime.getDate();
                            var year = currentTime.getFullYear();
                            var date = day + "/" + month + "/" + year;
                            var ngay_luuDB = year + "/" + month + "/" + day;
                            var nhommuaid = data[i]["Nhom_Mua_ID"];
                            var nhommuaname = data[i]["Nhom_Mua_Name"];
                            markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td class='cls_stt'>" + stt + "<input type='hidden' id='id_chitiet*" + stt + "' value='" + data[i]["ID_PR_Chi_Tiet"] + "'/></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_tonkho'>" + data[i]["Ton_Kho"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + Number(data[i]["Don_Gia"]).toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + Number(data[i]["Thanh_Tien_Tam_Ung"]).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + date + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "<input type='hidden' id='ngaych_luuDB*" + stt + "' value='" + ngay_luuDB + "'/><input type='hidden' id='nhommuaid_so*" + stt + "' value='" + nhommuaid + "'/><input type='hidden' id='nhommua_name*" + stt + "' value='" + nhommuaname + "'/></td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                            $("#table_vattu tbody").append(markup);
                        }
                        //an loading
                        $("#overlay").hide();
                        LoadThongTinNguoiMuaHang();
                    },

                })
                    .fail(function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown);
                    });


            }
            //Xu ly nut edit vat tu
            $(document).on('click', 'span.editrow', function () {
                $("#myModal").modal('show');
                currentRow = $(this).parents('tr');
                //console.log(currentRow);
                $("#select_mavattu").val($(this).closest('tr').find('td.cls_mavattu').text()).trigger('change.select2');
                var stt = $(this).closest('tr').find('td.cls_stt').text();
                if (document.getElementById("id_chitiet*" + stt).value == 0 || document.getElementById("id_chitiet*" + stt).value == "") {
                    document.getElementById("id_pr_chi_tiet").value = 0;
                }
                else {
                    document.getElementById("id_pr_chi_tiet").value = document.getElementById("id_chitiet*" + stt).value;
                }
                $("#mavattu").val($(this).closest('tr').find('td.cls_mavattu').text());
                $("#tenvattu").val($(this).closest('tr').find('td.cls_tenvattu').text());
                $("#dvt").val($(this).closest('tr').find('td.cls_dvt').text());
                $("#tonkho").val($(this).closest('tr').find('td.cls_tonkho').text());
                $("#soluongyeucau").val($(this).closest('tr').find('td.cls_soluongyeucau').text());
                $("#dongiatamtinh").val($(this).closest('tr').find('td.cls_dongiatamtinh').text());
                //lay thong tin gia tien chua co dinh dang
                var $tds = $(this).closest('tr').find('td');
                var st = 0;
                $tds.find("input[id^='dongiatamtinh*']").each(function () {
                    //alert(this.id)
                    st = this.value;

                });
                $("#dongiatamtinh_notmask").val(st);

                $("#tigia").val($(this).closest('tr').find('td.cls_tigia').text());
                $("#thanhtientamung").val($(this).closest('tr').find('td.cls_thanhtientamung').text());
                var tttu = 0;
                $tds.find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    tttu = this.value;

                });
                $("#thanhtientamung_notmask").val(tttu);


                $("#nhacungung").val($(this).closest('tr').find('td.cls_nhacungung').text());
                $("#tinhtrangvattu").val($(this).closest('tr').find('td.cls_tinhtrangvattu').text());

                $("#ngaycanhang").datepicker("setDate", $(this).closest('tr').find('td.cls_ngaycanhang').text());

                //$("#ngaycanhang").val($(this).closest('tr').find('td.cls_ngaycanhang').text());
                $("#thoigiansudung").val($(this).closest('tr').find('td.cls_thoigiansudung').text());
                $("#congdungchitiet").val($(this).closest('tr').find('td.cls_congdungchitiet').text());
                var leadtime = 0;
                $tds.find("input[id^='leadtime*']").each(function () {
                    //alert(this.id)
                    leadtime = this.value;

                });
                $("#leadtime").val(leadtime);
                var nmi = 0;
                $tds.find("input[id^='nhommuaid_so*']").each(function () {
                    //alert(this.id)
                    nmi = this.value;

                });
                $("#nhommuaid").val(nmi);
                var nmt = "";
                $tds.find("input[id^='nhommua_name*']").each(function () {
                    //alert(this.id)
                    nmt = this.value;

                });
                $("#nhommuaname").val(nmt);
            });
        //**********************//
            function LoadThongTinNguoiMuaHang()
            {

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDanhSachNguoiMuaHang",
                    dataType: "json",
                    success: function (data) {
                        //duyet array data tra ve gan tung dong cho table
                        for (var i = 0; i < data.length; i++) {
                          
                            var str = "";
                            for (var i = 0; i < data.length; i++) {
                                if (i == 0) {
                                    str = str + '<option value="' + data[i]["Ten_Hien_Thi"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                                   
                                }
                                else {
                                    str = str + '<option value="' + data[i]["Ten_Hien_Thi"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                                }

                            }
                            var opt_nguoimuahang = document.getElementById('select_nguoimuahang');
                            opt_nguoimuahang.insertAdjacentHTML('afterbegin', str);
                        }
                      
                    },

                })
                    .fail(function (jqXHR, textStatus, errorThrown) {
                        alert("error" + errorThrown);
                    });
            }
            $("#DongY").click(function () {
                
                var id_chitiet_pr = document.getElementById("id_pr_chi_tiet").value;
                var nguoimuahang = $("#select_nguoimuahang").val();
                console.log("select_nguoimuahang:" + nguoimuahang);
                var markup = "";
                markup = "<td class='cls_NguoiPTMuaHang'>" + nguoimuahang + "</td>";
                var temp_row = currentRow;
                temp_row.find('td.cls_NguoiPTMuaHang').replaceWith(markup);
                console.log("nguoimuahang:" + temp_row.html());
                $("#table_vattu tbody").find($(currentRow)).replaceWith(temp_row);
                
                //cap nhat xuong DB nguoi mua hang
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/UpdateNguoiMuaHang",
                    data: {
                        "id_pr_chitiet": $("#id_pr_chi_tiet").val(),
                        "nguoimuahang": nguoimuahang,
                     
                    },
                    dataType: "json",
                    success: function (data) {
                      

                    },

                })
                 .fail(function (jqXHR, textStatus, errorThrown) {
                     alert("error update người mua hàng" + errorThrown);
                 });
            
            
            });
            function Thoat() {
                window.location.replace("/Default");
            }
        </script>
</asp:Content>
