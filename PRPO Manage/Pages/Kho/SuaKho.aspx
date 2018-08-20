<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuaKho.aspx.cs" Inherits="PRPO_Manage.Pages.Kho.SuaKho" %>

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
            <div class="col-md-6">Công ty CP Sản Xuất Nhựa Duy Tân</div>
            <div class="col-md-6"><span class="pull-right">Phụ lục 4 - QT-CUVT-01</span></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <p class="text-center font-weight-bold">THÔNG TIN ĐƠN ĐẶT HÀNG VÀ DANH SÁCH PHIẾU NHẬP KHO</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="nhacungcap">Nhà cung cấp</label>
                    <input type="text" class="form-control" id="nhacungcap" readonly />
                    <input type="hidden" id="tennhacungcap" />
                    <input type="hidden" id="manhacuangcap" />
                </div>
                <div class="form-group col-md-4">
                    <label for="donvidexuat">Đơn vị đề xuất</label>
                    <%--    <select class="form-control" id="donvidexuat" style="width: 100%;">
                    </select>--%>
                    <input type="text" class="form-control" id="donvidexuat" readonly />
                    <input type="hidden" id="id_donvidexuat" />
                </div>

                <div class="form-group col-md-4">
                    <label for="ngaypo">Ngày PO</label>
                    <input type="date" class="form-control" id="ngaypo" readonly />
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
                                <h4 class="modal-title">Phiếu nhập kho</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="mahang">Mã hàng:</label>
                                        <input type="text" class="form-control" id="mahang" readonly/>

                                    </div>
                                    <div class="form-group">
                                        <label for="tenhang">Tên hàng:</label>
                                        <input type="text" class="form-control" id="tenhang" readonly/>

                                    </div>
                                    <div class="form-group">
                                        <label for="soluongpo">Số lượng PO:</label>
                                        <input type="text" class="form-control" id="soluongpo" readonly/>

                                    </div>
                                    <div class="form-group">
                                        <label for="sophieunhapkho">Số PN Kho:</label>
                                        <input type="text" class="form-control" id="sophieunhapkho" readonly/>

                                    </div>


                                    <div class="form-group">
                                        <label for="ngaynhapkho">Ngày nhập kho</label>
                                        <div class="form-group">
                                            <div class='input-group date' id='ngaynhapkho'>
                                                <input type='text' class="form-control" />
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="soluongnhapkho">Số lượng nhập kho</label>
                                        <input type="number" class="form-control" id="soluongnhapkho" />
                                         <input type="hidden" id="id_po_chi_tiet" />
                                         <input type="hidden" id="sophieunk" />
                                        <input type="hidden" id="id_sophieunk" />
                                        <input type="hidden" id="id_kho" />
                                    </div>
                                  
                                    <input type="button" class="btn btn-primary" id="DongY" data-dismiss="modal" value="Đồng ý" />
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="table_pochiettiet">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">STT</th>
                                <th scope="col">Số PR</th>
                                <th scope="col">Mã hàng</th>
                                <th scope="col">Tên hàng, Qui cách, Nhãn hiệu</th>
                                <th scope="col">ĐVT</th>
                                <th scope="col">Số lượng PO(*)</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Tỉ giá(*)</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày mua hàng(*)</th>
                                <th scope="col" style="background-color:#f5a0a0">Số lượng còn lại</th>
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
                <div class="table-responsive">
                    <table class="table table-bordered" id="table_chitietphieunhap">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">#</th>
                                <th scope="col">STT</th>
                                <th scope="col">Số PR</th>
                                <th scope="col">Số PO</th>
                                <th scope="col">Số phiếu nhập kho</th>
                                <th scope="col">Ngày nhập kho</th>
                                <th scope="col">Số lượng nhập kho</th>

                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
       
    </div>
    <script type="text/javascript">
        var currentRow = null;
        var arr_rows = new Array();
        var arr_vattu_daco_muonxoa = new Array();
        $('#ngaynhapkho').datepicker({
            format: 'dd/mm/yyyy',
            todayHighlight: true
        });
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
                window.location.replace("/Default");
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
                        var dateString = data[0]["Ngay_PO"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
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
        //Xu ly lay so phieu nhap tu he thong
        function LayMaSoPNKho() {
            var data;
       
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_SoPhieuNhapKho",
                data: {
                    "action": 1,
                    "id": 0,
                    "idphongban": $("#id_donvidexuat").val(),
                    "sophieunhap":0,
                    "nam": Number((new Date()).getFullYear()),
                },
                dataType: "json",

                success: function (data) {
                    var sopn;
                    var tem_sopn;
                    if(data.length>0)
                    {
                        sopn = data[0]["So_Phieu_Nhap_Kho"] + 1;
                        $("#sophieunk").val(sopn);
                        $("#id_sophieunk").val(data[0]["ID_So_Phieu_Nhap"]);
                        if (sopn < 10) {
                            sopn = "000" + sopn;
                        }
                        else if (sopn < 100 && sopn >= 10) {
                            sopn = "00" + sopn;
                        }
                        else if (sopn < 1000 && sopn >= 100) {
                            sopn = "0" + sopn;
                        }
                        else {
                            sopn = sopn;
                        }
                        var year = data[0]["Nam"].toString().slice(-2);
                        var pb = $("#ten_bophan").val();
                        $("#sophieunhapkho").val("PN" + sopn + "-" + year + "-" + pb);
                    }

                    

                },

            })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error lay so phieu nhap kho : " + errorThrown);
          });

        }
        function CapNhatMaSoPNKho() {
            var data;

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_SoPhieuNhapKho",
                data: {
                    "action": 2,
                    "id": $("#id_sophieunk").val(),
                    "idphongban": $("#id_donvidexuat").val(),
                    "sophieunhap": $("#sophieunk").val(),
                    "nam": Number((new Date()).getFullYear()),
                },
                dataType: "json",

                success: function (data) {


                },

            })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error lay so phieu nhap kho : " + errorThrown);
          });

        }
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
                            if (id_nguoiduyet == data[i]["ID_NguoiDung"]) {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            else {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                        }
                        else {
                            if (id_nguoiduyet == data[i]["ID_NguoiDung"]) {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            else {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }

                        }

                    }
                    var opt_phongban = document.getElementById('nguoiduyetpo');
                    opt_phongban.insertAdjacentHTML('afterbegin', str);
                }
            });
        }
        
        //*************************//
        //*******************//
        function LayThongTinPOChiTiet() {
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
                    for (var i = 0; i < data.length; i++) {
                        //neu khong co so luong con lai thi ko hien thi
                        if (data[i]["So_Luong_Con_Lai"] == 0 || data[i]["So_Luong_Con_Lai"] <= 0)
                        {
                            continue;
                        }
                        ////load ngay de xuat
                        
                        var dateString = data[i]["Ngay_Mua_Hang"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = day + "/" + month + "/" + year;
                        var ngaymuahang = date;


                        markup = markup + "<tr><td><span class='editrow'><a class='glyphicon glyphicon-shopping-cart' href='javascript: void(0);'></a></span></td><td class='cls_sott'>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "<input type='hidden' name='sopr_chitiet' value='" + data[i]["ID_PR_Chi_Tiet"] + "' /></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["PO_ChiTiet_DVT"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_PO"] + "</td><td class='cls_dongiatamtinh'>" + data[i]["PO_ChiTiet_Don_Gia"].toLocaleString('de-DE') + "</td><td class='cls_tigia'>" + data[i]["PO_ChiTiet_Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + data[i]["PO_ChiTiet_Thanh_Tien"].toLocaleString('de-DE') + "</td><td class='cls_tinhtrangvattu'>" + data[i]["PO_ChiTiet_Tinh_Trang"] + "</td><td class='cls_ngaycanhang'>" + ngaymuahang + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["PO_ChiTiet_Don_Gia"] + "'/><input type='hidden' id='tontai*" + stt + "' value='1'/><input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["PO_ChiTiet_Thanh_Tien"] + "'/><input type='hidden' id='id_po_chi_tiet*" + stt + "' value='" + data[i]["ID_PO_Chi_Tiet"] + "'/></td><td class='cls_soluongconlai'>" + data[i]["So_Luong_Con_Lai"] + "</td></tr>";
                        stt++;
                    }

                    $("#table_pochiettiet tbody").append(markup);
                    //cap nhap tinh trang PO
                    var bool_po = 0;
                    $('#table_pochiettiet > tbody  > tr').each(function () {
                        bool_po = 1
                    });
                    if (bool_po == 0) {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "/Webservice/dsnguoidung.asmx/UpdateTinhTrangNhapKho",
                            data: {
                                "id_po": $("#id_po").val(),
                                "tinhtrangnhapkho": 2,
                                "tinhtrangdongPO": 5,
                                "tinhtrangdongPR": 4,
                            },
                            dataType: "json",
                            success: function (data) {

                                //   alert("Đã cập nhật thông tin nhập kho thành công.");
                                //  location.reload();
                            },

                        })
                        .fail(function (jqXHR, textStatus, errorThrown) {
                            alert("error cap nhat tinh trang nhap kho cua po: " + errorThrown);
                        });
                    }
                    LayDanhSachKho();
                },

            })
             .fail(function (jqXHR, textStatus, errorThrown) {
                 alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
             });
        }
        /*****************/
      

        function LaySoPhieuNhapKho()
        {
            var ng = $("#ngaynhapkho").datepicker("getDate");
            if (ng == "") {
                alert("Vui lòng chọn ngày nhập kho.");
                $("#ngaynhapkho").css("border-color", "red");
                return;
            }
            var date = new Date(ng);
            var thangtao = date.getMonth() + 1;
            var ngaytao = date.getDate();
            var namtao = date.getFullYear();
            var ngaynhapkho = namtao + "-" + thangtao + "-" + ngaytao;

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_Kho",
                data: {
                    "action": 2,
                    "id": 0,
                    "sonhapkho": $("#sophieunhapkho").val(),
                    "soluong": $("#soluongnhapkho").val(),
                    "ngaynhapkho": ngaynhapkho,
                    "id_po": $("#id_po").val(),
                    "id_po_chi_tiet": $("#id_po_chi_tiet").val(),
                    "id_phongban": $("#id_bophan").val()
                },
                dataType: "json",
                success: function (data) {
                   
                },

            })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error tạo phiếu nhập kho:  " + errorThrown);
          });
        }
        $("#DongY").click(function () {
            var id_sophieunk = $("#id_sophieunk").val();
            var id_po_chi_tiet = 0;
            var soluongdanhapkho = 0;
            if(id_sophieunk==0)
            {
                var ng = $("#ngaynhapkho").datepicker("getDate");
                if (ng == "") {
                    alert("Vui lòng chọn ngày nhập kho.");
                    $("#ngaynhapkho").css("border-color", "red");
                    return;
                }
                var date = new Date(ng);
                var thangtao = date.getMonth() + 1;
                var ngaytao = date.getDate();
                var namtao = date.getFullYear();
                var ngaynhapkho = namtao + "-" + thangtao + "-" + ngaytao;
                soluongdanhapkho = $("#soluongnhapkho").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/Action_Kho",
                    data: {
                        "action": 2,
                        "id": $("#id_kho").val(),
                        "sonhapkho": "",
                        "soluong":  $("#soluongnhapkho").val(),
                        "ngaynhapkho": ngaynhapkho,
                        "id_po": 0,
                        "id_po_chi_tiet": 0,
                        "id_phongban": $("#id_bophan").val()
                    },
                    dataType: "json",
                    success: function (data) {

                        alert("Đã cập nhật thông tin nhập kho thành công.");
                        
                    },

                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    alert("error cap nhat phiếu nhập kho: " + errorThrown);
                });
            }
            else
            {
                //luu phieu nhap kho
                LaySoPhieuNhapKho();
                LayDanhSachKho();
                CapNhatMaSoPNKho();
                soluongdanhapkho = $("#soluongnhapkho").val();

                $("#mahang").val("");
                $("#tenhang").val("");
                $("#soluongpo").val("");
                $("#sophieunhapkho").val("");
                //$("#ngaynhapkho").val("");
                $("#ngaynhapkho").datepicker("setDate", null);
                $("#soluongnhapkho").val("");
            }
           
            //cap nhap tinh trang PO
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/UpdateTinhTrangNhapKho",
                data: {
                    "id_po": $("#id_po").val(),
                    "tinhtrangnhapkho": 1,
                    "tinhtrangdongPO": 0,
                    "tinhtrangdongPR": 0,
                },
                dataType: "json",
                success: function (data) {

                    //   alert("Đã cập nhật thông tin nhập kho thành công.");
                    //  location.reload();
                },

            })
                 .fail(function (jqXHR, textStatus, errorThrown) {
                     alert("error cap nhat tinh trang nhap kho cua po: " + errorThrown);
                 });
            
            //cap nhat so luong con lai sau khi da nhap kho
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/UpdateSoLuongConLaiSauNhapKho",
                data: {
                    "id_po_chi_tiet": Number($("#id_po_chi_tiet").val()),
                    "soluongconlai": Number(soluongdanhapkho)
                },
                dataType: "json",
                success: function (data) {

                    //   alert("Đã cập nhật thông tin nhập kho thành công.");
                    //  location.reload();
                },

            })
              .fail(function (jqXHR, textStatus, errorThrown) {
                  alert("error cap nhat tinh trang nhap kho cua po: " + errorThrown);
              });
            location.reload();
        });
        function LayDanhSachKho() {
            $("#table_chitietphieunhap tbody").empty();
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_Kho",
                data: {
                    "action": 1,
                    "id": 0,
                    "sonhapkho": "",
                    "soluong": 0,
                    "ngaynhapkho": "",
                    "id_po": $("#id_po").val(),
                    "id_po_chi_tiet": 0,
                    "id_phongban": $("#id_bophan").val()
                },
                dataType: "json",
                success: function (data) {
                    var markup = "";
                    var stt = 1;
                    for (var i = 0; i < data.length; i++) {
                        ////load ngay de xuat
                        var ngaynk= new Date(data[i]["Ngay_Nhap_Kho"]);
                        var dateString = data[i]["Ngay_Nhap_Kho"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = ngaynk.getMonth() + 1;
                        var day = ngaynk.getDate();
                        var year = ngaynk.getFullYear();
                        var date = day + "/" + month + "/" + year;
                        var ngaynhapkho = date;


                        markup = markup + "<tr><td><span class='editphieunhap'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td class='cls_sott'>" + stt + "</td><td class='cls_sopr_full'>" + data[i]["So_PR_Full"] + "</td><td class='cls_sopo_full'>" + data[i]["So_PO_Full"] + "</td><td class='cls_phieunhapkho'>" + data[i]["So_Nhap_Kho"] + "</td><td class='cls_ngaynhapkho'>" + ngaynhapkho + "</td><td class='cls_soluongnhapkho'>" + data[i]["So_Luong"].toLocaleString('de-DE') + "<input type='hidden' id='soluongnhapkho*" + stt + "' value='" + data[i]["So_Luong"] + "'/><input type='hidden' id='id_pnk*" + stt + "' value='" + data[i]["ID_Kho"] + "'/></td></tr>";
                        stt++;
                    }

                    $("#table_chitietphieunhap tbody").append(markup);
                },

            })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error lấy phiếu nhập kho : " + errorThrown);
          });
        }
        //Xu ly edit vat tu trong PO//
        $(document).on('click', 'span.editrow', function () {

            $("#myModal").modal('show');
            //lay so phieu nhap kho tu dong
            LayMaSoPNKho();
            currentRow = $(this).parents('tr');
            $("#mahang").val($(this).closest('tr').find('td.cls_mavattu').text());
            $("#tenhang").val($(this).closest('tr').find('td.cls_tenvattu').text());
            $("#soluongpo").val($(this).closest('tr').find('td.cls_soluongyeucau').text());

            //lay thong tin id po chi tiet
            var $tds = $(this).closest('tr').find('td');
            $tds.find("input[id^='id_po_chi_tiet*']").each(function () {
                //alert(this.id)
                $("#id_po_chi_tiet").val(this.value);

            });

        }); 
        $(document).on('click', 'span.editphieunhap', function () {

            $("#myModal").modal('show');
            currentRow = $(this).parents('tr');
            $("#sophieunhapkho").val($(this).closest('tr').find('td.cls_phieunhapkho').text());
            $("#soluongnhapkho").val($(this).closest('tr').find('td.cls_soluongnhapkho').text());
            var ngaynk = $(this).closest('tr').find('td.cls_ngaynhapkho').text();

            $("#ngaynhapkho").datepicker("setDate", ngaynk);
            
            var $tds = $(this).closest('tr').find('td');
            var id_kho = 0;
            $tds.find("input[id^='id_pnk*']").each(function () {
                //alert(this.id)
                id_kho=this.value;
                $("#id_kho").val(id_kho);
            });
            
            $tds.find("input[id^='soluongnhapkho*']").each(function () {
                //alert(this.id)
                $("#soluongnhapkho").val(this.value);
                
            });
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_Kho",
                data: {
                    "action": 1,
                    "id": Number(id_kho),
                    "sonhapkho": $("#sophieunhapkho").val(),
                    "soluong": 0,
                    "ngaynhapkho": "",
                    "id_po": $("#id_po").val(),
                    "id_po_chi_tiet": 0,
                    "id_phongban": $("#id_bophan").val()
                },
                dataType: "json",
                success: function (data) {
                    
                    for (var i = 0; i < data.length; i++) {
                        $("#mahang").val(data[i]["Ma_Hang"]);
                        $("#tenhang").val(data[i]["Ten_Hang"]);

                        $("#soluongpo").val(data[i]["So_Luong_PO"]);
                        $("#id_sophieunk").val(0);
                    }

                   
                },

            })
        .fail(function (jqXHR, textStatus, errorThrown) {
            alert("error lấy phiếu nhập kho de chinh sua: " + errorThrown);
        });


        }); 
        $(document).on('click', 'span.deleterow', function () {
            //$(this).parents('tr').remove();
            $this = $(this);
            var dtRow = $this.parents('tr');
            if (confirm("Bạn có chắc muốn xóa phiếu nhập kho này?")) {


                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/Action_Kho",
                    data: {
                        "action": 0,
                        "id": 0,
                        "sonhapkho": dtRow[0].cells[5].innerHTML,
                        "soluong": 0,
                        "ngaynhapkho": "",
                        "id_po": $("#id_po").val(),
                        "id_po_chi_tiet": 0,
                        "id_phongban": $("#id_bophan").val()

                    },
                    dataType: "json",

                    success: function (data) {
                        location.reload();
                    }
                });


            }
            return false;

        });
      
    </script>
</asp:Content>
