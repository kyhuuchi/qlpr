<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuaPO.aspx.cs" Inherits="PRPO_Manage.Pages.PO.SuaPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../Images/loader.gif" alt="" /></div>
    </div>
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-6">Công ty CP Sản Xuất Nhựa Duy Tân</div>
            <div class="col-md-6"><span class="pull-right">Phụ lục 4 - QT-CUVT-01</span></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <p class="text-center font-weight-bold">ĐƠN ĐẶT HÀNG</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="nhacungcap">Nhà cung cấp</label>
                    <input type="text" class="form-control" id="nhacungcap" readonly/>
                    <input type="hidden" id="tennhacungcap" />
                    <input type="hidden" id="manhacuangcap" />
                </div>
                <div class="form-group col-md-4">
                    <label for="donvidexuat">Đơn vị đề xuất</label>
                <%--    <select class="form-control" id="donvidexuat" style="width: 100%;">
                    </select>--%>
                      <input type="text" class="form-control" id="donvidexuat" readonly/>
                    <input type="hidden" id="id_donvidexuat" />
                </div>

                <div class="form-group col-md-4">
                    <label for="ngaypo">Ngày PO</label>
                    <input type="date" class="form-control" id="ngaypo" />
                    <input type="hidden" id="namdexuat" />
                    <input type="hidden" id="sothutupo" />
                    <input type="hidden" id="id_po" />
                    <input type="hidden" id="tinhtrangPO" />
                    <input type="hidden" id="txt_ncc" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="sopo">Số PO</label>
                    <input type="text" class="form-control" id="sopo" readonly />
                </div>
                <div class="form-group col-md-4">
                    <label for="nguoimuahang">Người mua hàng</label>
                    <input type="text" class="form-control" id="nguoimuahang" readonly />
                </div>
                <div class="form-group col-md-4">
                    <label for="nguoiduyetpo">Người duyệt PO</label>
                    <select class="form-control" id="nguoiduyetpo" style="width: 100%;">
                    </select>
                    <input type="hidden" id="id_nguoiduyetpo" />
                </div>

            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered" id="table_vattu">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">STT</th>
                                <th scope="col">Số PR</th>
                                <th scope="col">Mã hàng</th>
                                <th scope="col">Tên hàng, Qui cách, Nhãn hiệu</th>
                                <th scope="col">ĐVT</th>
                                <th scope="col">Số lượng yêu cầu(*)</th>
                                <th scope="col">Đơn giá tạm tính</th>
                                <th scope="col">Tỉ giá(*)</th>
                                <th scope="col">Thành tiền tạm tính</th>
                                <th scope="col">Nhà cung ứng-Nước sản xuất</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày cần hàng(*)</th>
                                <th scope="col">Thời gian sử dụng</th>
                                <th scope="col">Công dụng (diễn giải chi tiết) </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <%--  <button type="button" class="btn btn-danger btn-sm" id="xoavattu">Xóa vật tư</button>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <button type="button" class="btn btn-primary btn-sm" id="themchitietPO">Thêm chi tiết PO</button>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered" id="table_chitietpo">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">STT</th>
                                 <th scope="col">Số PR</th>
                                <th scope="col">Mã hàng</th>
                                <th scope="col">Tên hàng, Qui cách, Nhãn hiệu</th>
                                <th scope="col">ĐVT</th>
                                <th scope="col">Số lượng yêu cầu(*)</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Tỉ giá(*)</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày mua hàng(*)</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
         <div class="row">
            <div class="form-group col-md-12">
                <button type="button" class="btn btn-primary btn-sm" onclick="LayDanhSachPOChiTiet()">Lưu PO</button>
                <button type="button" class="btn btn-success btn-sm" id="btt_chuyen" style="display:none">Lưu và chuyển phê duyệt</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var currentRow = null;
        var arr_rows = new Array();
        //kiem tra xem user hien tai co quyen truy cap vao trang PO khong, neu khong redirect
        if ($("#muahang").val() == 'false') {
            window.location.replace("/Default.aspx");
        }
        //**********//
        var dsdata;
        var currentRow = null;
        var id_nguoiduyet = "";
        //hien thi nut loading...
        $("#overlay").show();
        document.getElementById("nguoimuahang").value = $("#tenhienthi").val();
       
        $(document).ready(function () {
            var urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('po')) {
                alert("Tham số PO không có.");
                window.location.replace("../../Default");
            }
            else {

                var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

                //// Decode the String
                var decodedString = Base64.decode(urlParams.get('po'));

                ////lay thong tin phong ban cua account dang truy cap
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                    data: {
                        "action": 1,
                        "id": 0,
                        "sopo": 0,
                        "sopo_full": decodedString,
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
                        "tinhtrang": 0
                    },
                    dataType: "json",
                    success: function (data) {
                        document.getElementById("sopo").value = data[0]["So_PO_Full"];
                        document.getElementById("nhacungcap").value = data[0]["Ten_Nha_Cung_Cap"];
                        document.getElementById("tennhacungcap").value = data[0]["Ten_Nha_Cung_Cap"];
                        document.getElementById("manhacuangcap").value = data[0]["Ma_Nha_Cung_Cap"];
                        document.getElementById("donvidexuat").value = data[0]["Ten_Phong_Ban"];
                        document.getElementById("id_donvidexuat").value = data[0]["ID_Phong_Ban"];
                        document.getElementById("namdexuat").value = data[0]["Nam"];
                        document.getElementById("sothutupo").value = data[0]["So_PO"];
                        document.getElementById("id_po").value = data[0]["ID_PO"];
                        document.getElementById("tinhtrangPO").value = data[0]["Tinh_Trang"];
                        document.getElementById("ContentPlaceHolder1_txt_ncc").value = data[0]["Ten_Nha_Cung_Cap"];
                        document.getElementById("id_nguoiduyetpo").value = data[0]["ID_Nguoi_Duyet_PO"];
                        id_nguoiduyet = data[0]["ID_Nguoi_Duyet_PO"];
                        ////kiem tra xem tinh trang la luu tam hay chua duyet, neu la chua duyet thi khong cho hien thi nut chuyen
                        if (data[0]["Tinh_Trang"] == 1) {
                            $("#btt_chuyen").removeAttr("style");
                        }
                        ////load ngay de xuat
                        var dateString = data[0]["Ngay_PO"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = year + "-" + month + "-" + day;
                        document.getElementById("ngaypo").value = date;


                    },

                })
                  //.done(LayThongTinPRChiTiet())
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }


           
            //lay danh sach nguoi duyet
            LayDanhSachNguoiDuyet(id_nguoiduyet);
            LayPR_PR_ChiTiet_DaDuyet();
            LayThongTinPOChiTiet();
            ///sau khi load xong het tat ca thi tat Loading...
            $("#overlay").hide();
        });
        //$("#donvidexuat").change(function () {

        //    document.getElementById("id_donvidexuat").value = $(this).val();
        //    //LaySoPO();

        //});
        $("#nguoiduyetpo").change(function () {

            document.getElementById("id_nguoiduyetpo").value = $(this).val();
        });
        //Lay thong tin tat ca phong ban 
        function LayThongTinPhongBan() {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDSPhongBan",
                dataType: "json",
                success: function (data) {
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        if (i == 0) {
                            str = str + '<option value="' + data[i]["ID_PhongBan"] + '" selected="selected">' + data[i]["Ten_Phong_Ban"] + '</option>';
                           // document.getElementById("id_donvidexuat").value = data[i]["ID_PhongBan"];
                        }
                        else {
                            str = str + '<option value="' + data[i]["ID_PhongBan"] + '">' + data[i]["Ten_Phong_Ban"] + '</option>';
                        }

                    }
                    var opt_phongban = document.getElementById('donvidexuat');
                    opt_phongban.insertAdjacentHTML('afterbegin', str);
                },

            })
            //.done(LaySoPO())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lay so PR; " + errorThrown);
            });
        }
        //*******************//

      
        //Lay thông tin nguoi duyet PO
        function LayDanhSachNguoiDuyet(id_nguoiduyetpo) {

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/Webservice/dsnguoidung.asmx/LayDSNguoiDuyet",
                success: function (data) {
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        if (i == 0) {
                            
                            //  document.getElementById("id_nguoiduyetpo").value = data[i]["ID_NguoiDung"];
                            if (id_nguoiduyet == data[i]["ID_NguoiDung"])
                            {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            else
                            {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                        }
                        else
                        {
                            if (id_nguoiduyet == data[i]["ID_NguoiDung"])
                            {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            else
                            {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            
                        }

                    }
                    var opt_phongban = document.getElementById('nguoiduyetpo');
                    opt_phongban.insertAdjacentHTML('afterbegin', str);
                }
            });
        }
        //Luu thông tin PO va lay thông tin các PR da duyet
        function LuuPO() {
          
            var date = new Date($("#ngaypo").val());
            var thangtao = date.getMonth() + 1;

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                data: {
                    "action": 2,
                    "id": 0,
                    "sopo": Number($("#sothutupo").val()),
                    "sopo_full": $("#sopo").val(),
                    "nam": Number($("#namdexuat").val()),
                    "ngaypo": $("#ngaypo").val(),
                    "thangpo": Number(thangtao),
                    "id_nguoiphutrach": $("#id_user").val(),
                    "id_nguoiduyet": $("#id_nguoiduyetpo").val(),
                    "id_phongban": $("#id_donvidexuat").val(),
                    "nhacungcap": $("#tennhacungcap").val(),
                    "songaytre": 0,
                    "manhacuangcap": $("#manhacuangcap").val(),
                    "khonhan": $("#donvidexuat option:selected").text(),
                    "tinhtrang": 1
                },
                dataType: "json",

                success: function (data) {
                    alert("Thông tin PO đã được tạo thành công.");

                },

            })
            .done(LayPR_PR_ChiTiet_DaDuyet())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lay so PO; " + errorThrown);
            });


        }
        //*************************//
       
        //lay thong tin PR PR chi tiet da duyet
        function LayPR_PR_ChiTiet_DaDuyet() {
            
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDS_PRChiTiet_DaDuyet",
                data: {
                    "id_phongban": $("#id_donvidexuat").val(),
                    "tinhtrangvattu": 0
                },
                dataType: "json",
                success: function (data) {
                    var markup = "";
                    var stt = 1;
                    for (var i = 0; i < data.length; i++) {
                        var dateString = data[i]["Ngay_Can_Hang"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var ngaycanhang = day + "/" + month + "/" + year;

                        markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"] + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["Thanh_Tien_Tam_Ung"] + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td></tr>";
                        stt++;
                    }

                    $("#table_vattu tbody").append(markup);

                },

            })
            //.done(LayThongTinPO())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
            });
        }
        //*******************//
        function LayThongTinPOChiTiet()
        {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_POChiTiet",
                data: {
                    "action": 1,
                    "id": 0,
                    "idpo": $("#id_po").val(),
                    "mahang": "",
                    "tenhang": "",
                    "dvt": "",
                    "soluong": 0,
                    "dongia": 0,
                    "tigia": 0,
                    "thanhtien": 0,
                    "tinhtrangvt": 0,
                    "id_prchitiet": 0,
                    "ngaymuahang": ""
                },
                dataType: "json",
                success: function (data) {
                    var markup = "";
                    var stt = 1;
                    for (var i = 0; i < data.length;i++)
                    {
                        ////load ngay de xuat
                        var dateString = data[i]["Ngay_Mua_Hang"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = day + "/" + month + "/" + year;
                        var ngaymuahang = date;

                        
                        markup = markup + "<tr><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["PO_ChiTiet_DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_PO"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["PO_ChiTiet_Don_Gia"] + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["PO_ChiTiet_Don_Gia"] + "'/></td><td class='cls_tigia'>" + data[i]["PO_ChiTiet_Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["PO_ChiTiet_Thanh_Tien"] + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["PO_ChiTiet_Thanh_Tien"] + "'/></td><td class='cls_tinhtrangvattu'>" + data[i]["PO_ChiTiet_Tinh_Trang"] + "</td><td class='cls_ngaycanhang'>" + ngaymuahang + "</td></tr>";
                        stt++;
                    }
                  
                    $("#table_chitietpo tbody").append(markup);
                },

            })
             .fail(function (jqXHR, textStatus, errorThrown) {
                 alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
             });
        }
        //// Find and remove selected table rows
        $("#themchitietPO").click(function () {
            var markup = "";
            var stt = 1;
            $("#table_vattu tbody").find('input[name="record"]').each(function () {
                if ($(this).is(":checked")) {
                    //lay thong tin item trong table vat tu
                    var id_po = $("#id_po").val();
                    var sopr_full = $(this).closest('tr').find('td.cls_sopr_full').text();
                    
                    var mahang = $(this).closest('tr').find('td.cls_mavattu').text();
                    var tenhang = $(this).closest('tr').find('td.cls_tenvattu').text();
                    var dvt = $(this).closest('tr').find('td.cls_dvt').text();
                    var soluongpo = $(this).closest('tr').find('td.cls_soluongyeucau').text();
                    var dongia = $(this).closest('tr').find('td.cls_dongiatamtinh').text();
                    var tigia = $(this).closest('tr').find('td.cls_tigia').text();
                    var thanhtien = $(this).closest('tr').find('td.cls_thanhtientamung').text();
                    var nhacungcap = $(this).closest('tr').find('td.cls_nhacungung').text();
                    var tinhtrangvattu = $(this).closest('tr').find('td.cls_tinhtrangvattu').text();
                    var thoigiansudung = $(this).closest('tr').find('td.cls_thoigiansudung').text();
                    var congdung = $(this).closest('tr').find('td.cls_congdungchitiet').text();
                    var ngaycanhang = $(this).closest('tr').find('td.cls_ngaycanhang').text();
                    var id_pr_chitiet;
                    $(this).closest('tr').find('td').find("input[name='sopr_chitiet']").each(function () {
                        //alert(this.id)
                        id_pr_chitiet = this.value;
                    });
                    var leadtime = 0;
                    $(this).closest('tr').find('td').find("input[id^='leadtime*']").each(function () {
                        //alert(this.id)
                        leadtime = this.value;
                    });
                    //tinh ngay mua hang
                    var new_ngaymuahang = moment(ngaycanhang, "DD/MM/YYYY").add(leadtime, 'days');
                    new_ngaymuahang = moment(new_ngaymuahang).format("DD/MM/YYYY");

                    arr_rows.push($(this).parents('tr'));
                    $(this).parents("tr").remove();
                    //markup = markup + "<tr><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /></td><td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongia + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtien + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "</td></tr>";
                    markup = markup + "<tr><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /></td><td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongia + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtien + "'/></td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td></tr>";
                    stt++;
                    
                }
            });
            $("#table_chitietpo tbody").append(markup);
        });
        //****************************//
        //Xu ly nut xoa vat tu
        $(document).on('click', 'span.deleterow', function () {
            var markup = "";
            currentRow = $(this).parents('tr');

            var id_po = $("#id_po").val();
            var sopr_full = currentRow.find('td.cls_sopr_full').text();

            var mahang = currentRow.find('td.cls_mavattu').text();
            var tenhang = currentRow.find('td.cls_tenvattu').text();
            var dvt = currentRow.find('td.cls_dvt').text();
            var soluongpo = currentRow.find('td.cls_soluongyeucau').text();
            var dongia = currentRow.find('td.cls_dongiatamtinh').text();
            var tigia = currentRow.find('td.cls_tigia').text();
            var thanhtien = currentRow.find('td.cls_thanhtientamung').text();
            var nhacungcap = currentRow.find('td.cls_nhacungung').text();
            var tinhtrangvattu = currentRow.find('td.cls_tinhtrangvattu').text();
            var thoigiansudung = currentRow.find('td.cls_thoigiansudung').text();
            var congdung = currentRow.find('td.cls_congdungchitiet').text();
            var ngaycanhang = currentRow.find('td.cls_ngaycanhang').text();
            var id_pr_chitiet;
            currentRow.find('td').find("input[name='sopr_chitiet']").each(function () {
                //alert(this.id)
                id_pr_chitiet = this.value;
            });
            //kiem tra trong mang array_rows co dong tr do hay khong, neu co thi lay ra
            for (var i = 0; i < arr_rows.length;i++)
            {
                if (arr_rows[i].find('td').find("input[name='sopr_chitiet']").value == id_pr_chitiet)
                {
                    markup = arr_rows[i].innerHTML;
                }
            }
            $(this).parents('tr').remove();
            $("#table_vattu tbody").append(markup);
            currentRow = null;
            //if (currentRow) {
            //    var $tds = currentRow.find('td');
            //    stt = $tds.eq(1).text();

            //    markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /></td><td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongia + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtien + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "</td></tr>";
            //    $("#table_vattu tbody").append(markup);
            //    currentRow = null;
            //}

            CapNhatSoTT();
            
            return false;

        });
        //Xu ly cap nhat lai so thu tu khi delete vat tu
        function CapNhatSoTT() {
            var table = $("#table_chitietpo");
            var table_vattu = $("#table_vattu");
            var rowCount = $('#table_chitietpo >tbody >tr').length;
            var rowCount_vattu = $('#table_vattu >tbody >tr').length;
            var sothutu = 0;
            var sothutu_vattu = 0;
            table.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');

                sothutu++;
                if (sothutu <= rowCount) {
                    $tds.eq(1).html(sothutu);

                }

            });
            table_vattu.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');

                sothutu_vattu++;
                if (sothutu_vattu <= rowCount_vattu) {
                    $tds.eq(1).html(sothutu_vattu);

                }

            });

        }
        //Lay thong tin PR chi tiet vua tao//
        //*********************************//
        function LayDanhSachPOChiTiet()
        {
            var table = $("#table_chitietpo");
            table.find('tbody > tr').each(function () {
                //lay thong tin item trong table vat tu
                var id_po = $("#id_po").val();
                var sopr_full = $(this).closest('tr').find('td.cls_sopr_full').text();

                var mahang = $(this).closest('tr').find('td.cls_mavattu').text();
                var tenhang = $(this).closest('tr').find('td.cls_tenvattu').text();
                var dvt = $(this).closest('tr').find('td.cls_dvt').text();
                var soluongpo = $(this).closest('tr').find('td.cls_soluongyeucau').text();
                var dongia = $(this).closest('tr').find('td.cls_dongiatamtinh').text();
                var tigia = $(this).closest('tr').find('td.cls_tigia').text();
                var thanhtien = $(this).closest('tr').find('td.cls_thanhtientamung').text();
                var nhacungcap = $(this).closest('tr').find('td.cls_nhacungung').text();
                var tinhtrangvattu = $(this).closest('tr').find('td.cls_tinhtrangvattu').text();
                var thoigiansudung = $(this).closest('tr').find('td.cls_thoigiansudung').text();
                var congdung = $(this).closest('tr').find('td.cls_congdungchitiet').text();
                var ngaycanhang = $(this).closest('tr').find('td.cls_ngaycanhang').text();
                var id_pr_chitiet;
                $(this).closest('tr').find('td').find("input[name='sopr_chitiet']").each(function () {
                    //alert(this.id)
                    id_pr_chitiet = this.value;
                });

                //chay webservice insert po chitiet
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/Action_POChiTiet",
                    data: {
                        "action": 2,
                        "id": 0,
                        "idpo": id_po,
                        "mahang": mahang,
                        "tenhang": tenhang,
                        "dvt": dvt,
                        "soluong": soluongpo,
                        "dongia": dongia,
                        "tigia": tigia,
                        "thanhtien": thanhtien,
                        "tinhtrangvt": tinhtrangvattu,
                        "id_prchitiet": id_pr_chitiet
                    },
                    dataType: "json",
                    success: function (data) {

                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
               });
            });
           
        }
    </script>
</asp:Content>
