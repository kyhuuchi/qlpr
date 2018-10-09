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
                    <select class="form-control" id="nguoiduyetpo" style="width: 100%;" disabled>
                    </select>
                    <input type="hidden" id="id_nguoiduyetpo" />
                </div>

            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-12">
                 <div class="modal fade" id="myModal" role="form" data-backdrop="static">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Cập nhật vật tư</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="soluongyeucaupo">Số lượng yêu cầu PO:</label>
                                                    <input type="number" class="form-control" id="soluongyeucaupo"/>
                                                    <input type="hidden" id="sttpochitiet"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="dongiapo">Đơn giá:</label>
                                                    <input type="number" class="form-control" id="dongiapo" />
                                                    <input type="hidden" id="dongiatamtinh_notmask" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tigiapo">Tỉ giá:</label>
                                                    <input type="number" class="form-control" id="tigiapo" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanhtienpo">Thành tiền:</label>
                                                    <input type="text" class="form-control" id="thanhtienpo" readonly/>
                                                    <input type="hidden" id="thanhtientamung_notmask" />
                                                </div>
                                                
                                                <input type="button" class="btn btn-primary" id="DongY" data-dismiss="modal" value="Đồng ý" />
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
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
                                <th scope="col">Thành tiền tạm tính(VAT)</th>
                                <th scope="col">Nhà cung ứng-Nước sản xuất</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày cần hàng(*)</th>
                                <th scope="col">Thời gian sử dụng</th>
                                <th scope="col">Công dụng (diễn giải chi tiết) </th>
                                <th scope="col">Người PT mua hàng</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>

                    </table>
                    <span style="background-color:#ffbc0066">Vật tư chưa PO hết</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color:#bb270f66;color:#fff">Vật tư nhập giá tay</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color:#6e00ff66;color:#fff">Vật tư vừa nhập giá tay, vừa chưa PO hết</span>
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
                                 <th scope="col">Thành tiền (VAT)</th>
                                <th scope="col">Nhà cung ứng-Nước sản xuất</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày đáp ứng hàng(*)</th>
                                <th scope="col">Thời gian sử dụng</th>
                                <th scope="col">Công dụng (diễn giải chi tiết) </th>
                                 <th scope="col">Người PT mua hàng</th>
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
                <button type="button" class="btn btn-primary btn-sm" id="btt_luupo">Lưu PO</button>
                <button type="button" class="btn btn-success btn-sm" id="btt_chuyen" style="display:none" onclick="LuuVaChuyenPheDuyet()">Lưu và chuyển phê duyệt</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var currentRow = null;
        var arr_rows = new Array();
        var arr_vattu_daco_muonxoa = new Array();
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
                        if (data[0]["Tinh_Trang"] == 1 || data[0]["Tinh_Trang"] == 4) {
                            $("#btt_chuyen").removeAttr("style");
                        }
                        ////load ngay de xuat
                       // var dateString = data[0]["Ngay_PO"].substr(6);
                        //var currentTime = new Date(parseInt(dateString));
                        var dateString = data[0]["Ngay_PO"];
                        var currentTime = new Date(dateString);
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        if (day < 10) {
                            day = "0" + day;
                        }
                        if (month < 10) {
                            month = "0" + month;
                        }
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
        function LuuPO(ttrang) {
          
            var date = new Date($("#ngaypo").val());
            var thangtao = date.getMonth() + 1;
            var tinhtrang = ttrang;
            if ($("#tinhtrangPO").val() == tinhtrang)
            {
                tinhtrang = $("#tinhtrangPO").val();
            }
           
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                data: {
                    "action": 2,
                    "id": $("#id_po").val(),
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
                    "khonhan": $("#donvidexuat").val(),
                    "tinhtrang": tinhtrang
                },
                dataType: "json",

                success: function (data) {
                    //alert("Thông tin PO đã được c thành công.");

                },

            })
            
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
                    "id_phongban": $("#id_donvidexuat").val()
                    
                },
                dataType: "json",
                success: function (data) {
                    var markup = "";
                    var stt = 1;
                    for (var i = 0; i < data.length; i++) {
                        var dateString = data[i]["Ngay_Can_Hang"];
                        var currentTime = new Date(dateString);
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var ngaycanhang = day + "/" + month + "/" + year;


                        var vat = Number(data[i]["VAT"]);
                        var thanhtienvat = data[i]["Thanh_Tien_Tam_Ung"];
                        var tienvat = 0;
                        if (vat != 0) {
                            tienvat = (thanhtienvat * vat) / 100;
                        }
                        thanhtienvat = thanhtienvat + tienvat;
                        if (data[i]["So_Luong_Con_Lai"] > 0) {
                            var soluongconlai = data[i]["So_Luong_Con_Lai"];
                            var tigia = data[i]["Ti_Gia"];
                            var dongia = data[i]["Don_Gia"];
                            var thanhtienvat_conlai = Number(tigia) * Number(dongia) * Number(soluongconlai);

                            var tienvat = 0;
                            if (vat != 0) {
                                tienvat = (thanhtienvat_conlai * vat) / 100;
                            }
                            thanhtienvat_conlai = thanhtienvat_conlai + tienvat;
                        }
                        //xu lý ngay duyet cua PR
                        var dateduyet = data[i]["Ngay_Duyet_PR"];
                        //var currentTime = new Date(parseInt(dateString));
                        var currentTime2 = new Date(dateduyet);
                        var month2 = currentTime2.getMonth() + 1;
                        var day2 = currentTime2.getDate();
                        var year2 = currentTime2.getFullYear();
                        var ngayduyetpr = year2 + "-" + month2 + "-" + day2;

                        //if (data[i]["So_Luong_Con_Lai"] > 0) {
                        //    markup = markup + "<tr style='background-color: #ffa7a7;'><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Con_Lai"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + (Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"])).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"]) + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        //}
                        //else {
                        //    markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["Thanh_Tien_Tam_Ung"].toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        //}
                        if (data[i]["So_Luong_Con_Lai"] > 0 && data[i]["GiaNhapTay"] == "1") {
                            markup = markup + "<tr style='background-color: #6e00ff66;color:#fff'><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Con_Lai"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + (Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"])).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"]) + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtienvat_conlai).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtienvat_conlai + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        }
                        else if (data[i]["So_Luong_Con_Lai"] > 0 && data[i]["GiaNhapTay"] == "0") {
                            markup = markup + "<tr style='background-color: #ffbc0066;'><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Con_Lai"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + (Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"])).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + Number(data[i]["Ti_Gia"]) * Number(data[i]["Don_Gia"]) * Number(data[i]["So_Luong_Con_Lai"]) + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtienvat_conlai).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtienvat_conlai + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        }
                        else if (data[i]["So_Luong_Con_Lai"] == 0 && data[i]["GiaNhapTay"] == "1") {
                            markup = markup + "<tr style='background-color: #bb270f66;color:#fff'><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["Thanh_Tien_Tam_Ung"].toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtienvat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtienvat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        }
                        else {
                            markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["Thanh_Tien_Tam_Ung"].toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtienvat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtienvat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                        }
                        //markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["Don_Gia"].toLocaleString('de-DE') + "</td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["Thanh_Tien_Tam_Ung"].toLocaleString('de-DE') + "</td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td></tr>";
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
                    "ngaymuahang": "",
                    "nguoiptmuahang": ""
                },
                dataType: "json",
                success: function (data) {
                    var markup = "";
                    var stt = 1;
                    for (var i = 0; i < data.length;i++)
                    {
                        ////load ngay de xuat
                        var dateString = data[i]["Ngay_Mua_Hang"];
                        var currentTime = new Date(dateString);
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = day + "/" + month + "/" + year;
                        var ngaymuahang = date;
                        //tinh thanh tien VAT
                        var vat = 0;
                        if( data[i]["VAT"]!="")
                        {
                            vat = data[i]["VAT"];
                        }
                        
                        var thanhtienvat = Number(data[i]["PO_ChiTiet_Thanh_Tien"]);
                        var tienvat = 0;
                        
                        if (vat != 0) {
                            tienvat = (thanhtienvat * vat) / 100;
                        }
                        thanhtienvat = thanhtienvat + tienvat;

                        markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td class='cls_sott'>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["PO_ChiTiet_DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_PO"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["PO_ChiTiet_Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["PO_ChiTiet_Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["PO_ChiTiet_Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["PO_ChiTiet_Thanh_Tien"].toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["PO_ChiTiet_Thanh_Tien"] + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtienvat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtienvat + "'/><td class='cls_nhacungung'>" + data[i]["Nha_Cung_Cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["PO_ChiTiet_Tinh_Trang"] + "</td><td class='cls_ngaycanhang'>" + ngaymuahang + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["PO_ChiTiet_Don_Gia"] + "'/><input type='hidden' id='tontai*" + stt + "' value='1'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["PO_ChiTiet_Thanh_Tien"] + "'/><input type='hidden' id='id_po_chi_tiet*" + stt + "' value='" + data[i]["ID_PO_Chi_Tiet"] + "'/></td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Su_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td><td class='cls_NguoiPTMuaHang'>" + data[i]["Nguoi_Phu_Trach_Mua_Hang"] + "</td></tr>";
                       // markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["PO_ChiTiet_DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_PO"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["PO_ChiTiet_Don_Gia"].toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["PO_ChiTiet_Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtientamtinh_nomask_vat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtientamtinh_nomask_vat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_NguoiPTMuaHang'>" + nguoiptmuahang + "</td></tr>";
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
            var mata_true = 0;
            var tongtien = 0;
            //kiem tra xem phong ban do co phai la MATA hay khong, neu la MATA thi giu nguyen ngay hang, ko can cong them leadtime
            if ($("#id_donvidexuat").val() == 1) {
                mata_true = 1;
            }
            $("#table_vattu tbody").find('input[name="record"]').each(function () {
                if ($(this).is(":checked")) {
                    //lay thong tin item trong table vat tu
                    var id_po = $("#id_po").val();
                    var sopr_full = $(this).closest('tr').find('td.cls_sopr_full').text();
                    
                    var mahang = $(this).closest('tr').find('td.cls_mavattu').text();
                    var gia_tructiep;
                    var vat_tructiep;
                    //goi webservice SAP de check gia
                    if (mahang != "Không mã") {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "/Webservice/dsnguoidung.asmx/CheckGiaLiveSAP",
                            data: {
                                "mahang": mahang
                            },
                            dataType: "json",
                            success: function (data) {
                                if (data.length > 0) {
                                    //code da ok chi con lay gia ra thoi
                                    console.log("data:" + data);
                                    var jsObj = JSON.parse(data);
                                    console.log("jsObj:" + jsObj.dg);
                                    gia_tructiep = jsObj.dg;
                                    vat_tructiep = jsObj.vat;
                                    console.log("gia_tructiep:" + gia_tructiep);
                                }

                            },

                        })
                       .fail(function (jqXHR, textStatus, errorThrown) {
                           alert("error lấy giá trên SAP bị lỗi; " + errorThrown);
                       });
                    }
                    var tenhang = $(this).closest('tr').find('td.cls_tenvattu').text();
                    var dvt = $(this).closest('tr').find('td.cls_dvt').text();
                    var soluongpo = $(this).closest('tr').find('td.cls_soluongyeucau').text();
                    var dongia;
                    if (mahang != "Không mã") {
                        dongia = gia_tructiep;
                    }
                    else {
                        dongia = $(this).closest('tr').find('td.cls_dongiatamtinh').text();
                    }
                    var tigia = $(this).closest('tr').find('td.cls_tigia').text();
                    var thanhtien;
                    if (mahang != "Không mã") {
                        thanhtien = Number(gia_tructiep) * Number(soluongpo) * Number(tigia);
                    }
                    else {
                        thanhtien = $(this).closest('tr').find('td.cls_thanhtientamung').text();
                    }
                    var nhacungcap = $(this).closest('tr').find('td.cls_nhacungung').text();
                    var tinhtrangvattu = $(this).closest('tr').find('td.cls_tinhtrangvattu').text();
                    var thoigiansudung = $(this).closest('tr').find('td.cls_thoigiansudung').text();
                    var congdung = $(this).closest('tr').find('td.cls_congdungchitiet').text();
                    var ngaycanhang = $(this).closest('tr').find('td.cls_ngaycanhang').text();
                    var nguoiptmuahang = $(this).closest('tr').find('td.cls_NguoiPTMuaHang').text();
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
                    var dongiatamtinh_nomask = 0;
                    $(this).closest('tr').find('td').find("input[id^='dongiatamtinh*']").each(function () {
                        //alert(this.id)
                        if (mahang != "Không mã") {
                            dongiatamtinh_nomask = gia_tructiep;
                        }
                        else {
                            dongiatamtinh_nomask = this.value;
                        }
                    });
                    var thanhtientamtinh_nomask = 0;
                    $(this).closest('tr').find('td').find("input[id^='thanhtientamung*']").each(function () {

                        if (mahang != "Không mã") {
                            thanhtientamtinh_nomask = Number(gia_tructiep) * Number(soluongpo) * Number(tigia);
                            tongtien += Number(Number(gia_tructiep) * Number(soluongpo) * Number(tigia));
                        }
                        else {
                            thanhtientamtinh_nomask = this.value;
                            tongtien += Number(this.value);
                        }
                        
                    });
                    var thanhtientamtinh_nomask_vat = 0;
                    $(this).closest('tr').find('td').find("input[id^='thanhtientamungvat*']").each(function () {
                        //alert(this.id)
                        // thanhtientamtinh_nomask_vat = this.value;
                        if (mahang != "Không mã") {
                            var tienvat = Math.round((thanhtientamtinh_nomask * vat_tructiep) / 100);
                            thanhtientamtinh_nomask_vat = Number(thanhtientamtinh_nomask) + Number(tienvat);
                        }
                        else {
                            thanhtientamtinh_nomask_vat = this.value;
                        }

                    });
                    //tinh ngay mua hang. Neu la MATA thi van giu nguyen ngay mua hang, con cac don vi khac
                    //thi se cong leadtime
                    var ngayduyetpr = "";
                    $(this).closest('tr').find('td').find("input[id^='ngayduyetpr*']").each(function () {
                        ngayduyetpr = this.value;

                    });

                    //tinh ngay mua hang
                    var new_ngaymuahang = ngayduyetpr;

                    new_ngaymuahang = new Date(new_ngaymuahang);

                    if (mata_true == 0) {
                        new_ngaymuahang.setDate(new_ngaymuahang.getDate() + Number(leadtime));
                       

                    }
                        //neu la MATA thi giu nguyen ngay can hang
                    else {
                        new_ngaymuahang = ngaycanhang;
                        new_ngaymuahang = moment(new_ngaymuahang,"DD/MM/YYYY").format("YYYY-MM-DD");
                        new_ngaymuahang = new Date(new_ngaymuahang);
                    }
                    var month = new_ngaymuahang.getMonth() + 1;
                    
                    var day = new_ngaymuahang.getDate();

                    var year = new_ngaymuahang.getFullYear();
                    if (day < 10) {
                        day = "0" + day;
                    }
                    if (month < 10) {
                        month = "0" + month;
                    }
                    var date = day + "/" + month + "/" + year;
                    //new_ngaymuahang = moment(ngayduyetpr, "YYYY-MM-DD").add(leadtime, 'days');

                    new_ngaymuahang = date;

                    arr_rows.push($(this).parents('tr'));
                    arr_rows.push(id_pr_chitiet);
                    $(this).parents("tr").remove();
                    
                    
                    //    markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtientamtinh_nomask_vat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtientamtinh_nomask_vat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_NguoiPTMuaHang'>" + nguoiptmuahang + "</td></tr>";
                    if (mahang != "Không mã") {
                        markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + Number(dongia).toLocaleString('de-DE') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + Number(thanhtien).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtientamtinh_nomask_vat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtientamtinh_nomask_vat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_NguoiPTMuaHang'>" + nguoiptmuahang + "</td></tr>";
                    }
                    else {
                        markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_thanhtientamungvat'>" + Number(thanhtientamtinh_nomask_vat).toLocaleString('de-DE') + "<input type='hidden' id='thanhtientamungvat*" + stt + "' value='" + thanhtientamtinh_nomask_vat + "'/><input type='hidden' id='ngayduyetpr*" + stt + "' value='" + ngayduyetpr + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamtinh_nomask + "'/></td><td class='cls_NguoiPTMuaHang'>" + nguoiptmuahang + "</td></tr>";
                    }
                    stt++;
                    
                }
            });
            $("#table_chitietpo tbody").append(markup);
            CapNhatSoTT();
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
                arr_vattu_daco_muonxoa.push(id_pr_chitiet);
            });
            //kiem tra trong mang array_rows co dong tr do hay khong, neu co thi lay ra
            
            for (var i = 1; i < arr_rows.length;i++)
            {
                
                if (arr_rows[i] == id_pr_chitiet)
                {
                    markup = arr_rows[i-1];
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
                    $tds.eq(2).html(sothutu);

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
        $("#btt_luupo").click(function () {
            
            LayDanhSachPOChiTiet($("#tinhtrangPO").val());
        });
        function LayDanhSachPOChiTiet(ttrang)
        {
            LuuPO(ttrang);
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
                ngaycanhang = moment(ngaycanhang, "DD/MM/YYYY").format("YYYY-MM-DD");
               // var ngaycanhang = currentRow.find('td.cls_ngaycanhang').text();
                var nguoiptmuahang = $(this).closest('tr').find('td.cls_NguoiPTMuaHang').text();
                var id_pr_chitiet;
                $(this).closest('tr').find('td').find("input[name='sopr_chitiet']").each(function () {
                    //alert(this.id)
                    id_pr_chitiet = this.value;
                });
                var tontai=0;
                $(this).closest('tr').find('td').find("input[id^='tontai*']").each(function () {
                    //alert(this.id)
                    tontai = this.value;
                });
                var dongiatamtinh_nomask = 0;
                $(this).closest('tr').find('td').find("input[id^='dongiatamtinh*']").each(function () {
                    //alert(this.id)
                    dongiatamtinh_nomask = this.value;
                });
                var thanhtientamtinh_nomask = 0;
                $(this).closest('tr').find('td').find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    thanhtientamtinh_nomask = this.value;
                });
                //kiem tra xem dong item do la da co hay chua, neu chua co thi insert vao
                if(tontai==0)
                {
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
                            "dongia": dongiatamtinh_nomask,
                            "tigia": tigia,
                            "thanhtien": thanhtientamtinh_nomask,
                            "tinhtrangvt": tinhtrangvattu,
                            "id_prchitiet": id_pr_chitiet,
                            "ngaymuahang": ngaycanhang,
                            "nguoiptmuahang": nguoiptmuahang
                        },
                        dataType: "json",
                        success: function (data) {
                          //  alert("Da tao PO chi tiet thanh cong.");
                            var table = $("#table_chitietpo");
                            table.find('tbody > tr').each(function () {
                                $(this).closest('tr').find('td').find("input[id^='tontai*']").each(function () {
                                    //alert(this.id)
                                    this.value = 1;
                                });
                            });
                            
                            //cap nhat trang thai cua vat tu trong PR chi tiet de biet vat tu do da duoc PO
                            Update_TrangThai_VatTu_PRChiTiet(id_pr_chitiet, 1, soluongpo);
                        },

                    })
                   .fail(function (jqXHR, textStatus, errorThrown) {
                       alert("error lấy PR chi tiết đã duyệt chua co tontai; " + errorThrown);
                   });
                }
                else
                {
                    var id_po_chitiet;
                    $(this).closest('tr').find('td').find("input[id^='id_po_chi_tiet*']").each(function () {
                        //alert(this.id)
                        id_po_chitiet = this.value;
                    });
                    
                    //chay webservice insert po chitiet
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "/Webservice/dsnguoidung.asmx/Action_POChiTiet",
                        data: {
                            "action": 2,
                            "id": id_po_chitiet,
                            "idpo": id_po,
                            "mahang": mahang,
                            "tenhang": tenhang,
                            "dvt": dvt,
                            "soluong": soluongpo,
                            "dongia": dongiatamtinh_nomask,
                            "tigia": tigia,
                            "thanhtien": thanhtientamtinh_nomask,
                            "tinhtrangvt": tinhtrangvattu,
                            "id_prchitiet": id_pr_chitiet,
                            "ngaymuahang": ngaycanhang,
                            "nguoiptmuahang": nguoiptmuahang
                        },
                        dataType: "json",
                        success: function (data) {
                            //  alert("Da tao PO chi tiet thanh cong.");
                            var table = $("#table_chitietpo");
                            table.find('tbody > tr').each(function () {
                                $(this).closest('tr').find('td').find("input[id^='tontai*']").each(function () {
                                    //alert(this.id)
                                    this.value = 1;
                                });
                            });
                           
                            //cap nhat trang thai cua vat tu trong PR chi tiet de biet vat tu do da duoc PO
                            Update_TrangThai_VatTu_PRChiTiet(id_pr_chitiet, 1, soluongpo);
                        },

                    })
                   .fail(function (jqXHR, textStatus, errorThrown) {
                       alert("error lấy PR chi tiết đã duyệt da tontai; " + errorThrown);
                   });
                }
            });

            //kiem tra xem co cac item da them vao truoc do co xoa ra khoi po hay ko
            if (arr_vattu_daco_muonxoa.length > 0) {
                for (var i = 0; i < arr_vattu_daco_muonxoa.length; i++) {
                    Update_TrangThai_VatTu_PRChiTiet(arr_vattu_daco_muonxoa[i], 0);
                    //chay webservice insert po chitiet
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "/Webservice/dsnguoidung.asmx/Action_POChiTiet",
                        data: {
                            "action": 0,
                            "id": 0,
                            "idpo": 0,
                            "mahang": "",
                            "tenhang": "",
                            "dvt": "",
                            "soluong": 0,
                            "dongia": 0,
                            "tigia": 0,
                            "thanhtien": 0,
                            "tinhtrangvt": 0,
                            "id_prchitiet": arr_vattu_daco_muonxoa[i],
                            "ngaymuahang": "",
                             "nguoiptmuahang": ""
                        },
                        dataType: "json",
                        success: function (data) {
                            
                        },

                    })
                   .fail(function (jqXHR, textStatus, errorThrown) {
                       alert("error xoa PO chi tiết đã có; " + errorThrown);
                   });
                }
            }
            window.location.replace("DanhSachPO");
        }
        function Update_TrangThai_VatTu_PRChiTiet(id_pr_chitiet, tinhtrang, soluongpo) {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/UpdateTinhTrangPRChiTiet",
                data: {
                    "id_pr_chitiet": id_pr_chitiet,
                    "tinhtrang": tinhtrang,
                    "soluongpo": soluongpo
                },
                dataType: "json",
                success: function (data) {
                    // console.log("Đã cập nhật tình trạng PR chi tiết.")
                    
                },

            })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error cập nhật PR chi tiết; " + errorThrown);
               });
        }
        function LuuVaChuyenPheDuyet()
        {
            LayDanhSachPOChiTiet(2);
            
        }
        //********************************//

        //Xu ly edit vat tu trong PO//
        $(document).on('click', 'span.editrow', function () {
            //$("#myModal").modal('show');
            //currentRow = $(this).parents('tr');
            //$("#sttpochitiet").val($(this).closest('tr').find('td.cls_sott').text());
            //$("#soluongyeucaupo").val($(this).closest('tr').find('td.cls_soluongyeucau').text());
            ////lay thong tin gia tien chua co dinh dang
            //var $tds = $(this).closest('tr').find('td');
            //var st = 0;
            //$tds.find("input[id^='dongiatamtinh*']").each(function () {
            //    //alert(this.id)
            //    st = this.value;

            //});
            //$("#dongiapo").val(st);
            //$("#tigiapo").val($(this).closest('tr').find('td.cls_tigia').text());
            //var tttu = 0;
            //$tds.find("input[id^='thanhtientamung*']").each(function () {
            //    //alert(this.id)
            //    tttu = this.value;

            //});
            //$("#thanhtienpo").val(tttu);
            $("#myModal").modal('show');
            currentRow = $(this).parents('tr');
            $("#sttpochitiet").val($(this).closest('tr').find('td.cls_sott').text());
            $("#soluongyeucaupo").val($(this).closest('tr').find('td.cls_soluongyeucau').text());
            //lay thong tin gia tien chua co dinh dang
            var $tds = $(this).closest('tr').find('td');
            var st = 0;
            $tds.find("input[id^='dongiatamtinh*']").each(function () {
                //alert(this.id)
                st = this.value;

            });
            $("#dongiapo").val(Number(st).toLocaleString('de-DE'));
            $("#dongiatamtinh_notmask").val(st);
            $("#tigiapo").val($(this).closest('tr').find('td.cls_tigia').text());
            var tttu = 0;
            $tds.find("input[id^='thanhtientamung*']").each(function () {
                //alert(this.id)
                tttu = this.value;

            });
            $("#thanhtienpo").val(Number(tttu).toLocaleString('de-DE'));
            $("#thanhtientamung_notmask").val(tttu);
        
        });
        //* Tinh lai gia khi chinh sua thong tin vat tu *//
        $("#tigiapo").change(function () {

            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        $("#dongiapo").change(function () {
            $("#dongiatamtinh_notmask").val($("#dongiapo").val());
            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        $("#soluongyeucaupo").change(function () {

            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        function TinhKhiThayDoiTiGiaVaSoLuong() {

            var total = $("#dongiatamtinh_notmask").val() * $("#soluongyeucaupo").val() * $("#tigiapo").val();

            document.getElementById("thanhtientamung_notmask").value = total;

            $('#thanhtienpo').val(total.toLocaleString('de-DE'));
            $('#dongiapo').val(Number($("#dongiatamtinh_notmask").val()).toLocaleString('de-DE'));
        }
        //**************************//
        $("#DongY").click(function () {

            //var soluongyeucaupo = $("#soluongyeucaupo").val();
            //var dongiapo = $("#dongiapo").val();
            //var tigiapo = $("#tigiapo").val();
            //var thanhtienpo = $("#thanhtienpo").val();
            //var markup = "";
            //var stt;
            //if (currentRow) {
            //    var curr = currentRow;
            //    var $tds = curr.find('td');
            //    stt = $tds.eq(2).text();
            //    curr.find('td.cls_soluongyeucau').text(soluongyeucaupo);
            //    $tds.find("input[id^='dongiatamtinh*']").each(function () {
            //        //alert(this.id)
            //        $(this).val(dongiapo);

            //    });
            //    curr.find('td.cls_dongiatamtinh').text(dongiapo);

            //    curr.find('td.cls_tigia').text(tigiapo);

            //    $tds.find("input[id^='thanhtientamung*']").each(function () {
            //        //alert(this.id)
            //        $(this).val(thanhtienpo);

            //    });
            //    curr.find('td.cls_thanhtientamung').text(thanhtienpo);
                
            //    $("#table_chitietpo tbody").find($(currentRow)).replaceWith(curr);
            //    currentRow = null;
            //}
            
            
            
            //$("#soluongyeucaupo").val("");
            //$("#dongiapo").val("");
            //$("#tigiapo").val("");
            //$("#thanhtienpo").val("");
            var soluongyeucaupo = $("#soluongyeucaupo").val();
            var dongiapo = $("#dongiapo").val();
            var dongiapo_nomask = $("#dongiatamtinh_notmask").val();
            var tigiapo = $("#tigiapo").val();
            var thanhtienpo = $("#thanhtienpo").val();
            var thanhtienpo_nomask = $("#thanhtientamung_notmask").val();
            var markup = "";
            var stt;
            if (currentRow) {
                var curr = currentRow;
                var $tds = curr.find('td');
                stt = $tds.eq(2).text();
                curr.find('td.cls_soluongyeucau').text(soluongyeucaupo);

                curr.find('td.cls_dongiatamtinh').text(dongiapo);
                $tds.find("input[id^='dongiatamtinh*']").each(function () {
                    //alert(this.id)
                    $(this).val(dongiapo_nomask);

                });
                curr.find('td.cls_tigia').text(tigiapo);
                curr.find('td.cls_thanhtientamung').text(thanhtienpo);
                $tds.find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    $(this).val(thanhtienpo_nomask);

                });


                $("#table_chitietpo tbody").find($(currentRow)).replaceWith(curr);
                currentRow = null;
            }



            $("#soluongyeucaupo").val("");
            $("#dongiapo").val("");
            $("#tigiapo").val("");
            $("#thanhtienpo").val("");
        });
        //**************************//
    </script>
</asp:Content>
