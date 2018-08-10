﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPO.aspx.cs" Inherits="PRPO_Manage.Pages.PO.TaoPO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../../Images/loader.gif" alt="" /></div>
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
                    <select class="form-control" id="nhacungcap" style="width: 100%;">
                        <asp:Literal ID="lit_nhacc" runat="server" Mode="PassThrough"></asp:Literal>
                    </select>
                    <input type="hidden" id="tennhacungcap" />
                    <input type="hidden" id="manhacuangcap" />
                    
                </div>
                <div class="form-group col-md-4">
                    <label for="donvidexuat">Đơn vị đề xuất</label>
                    <select class="form-control" id="donvidexuat" style="width: 100%;">
                    </select>
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
                    <input type="text" class="form-control" id="sopo"/>
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
                <button type="button" class="btn btn-primary btn-sm" onclick="LuuPO()">Lưu PO và lấy thông tin PR đã duyệt</button>
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
                                <th scope="col">Nhà cung ứng-Nước sản xuất</th>
                                <th scope="col">Tình trạng VT, MMTB (Mới:100%Cũ:…%)</th>
                                <th scope="col">Ngày mua hàng(*)</th>
                                <th scope="col">Thời gian sử dụng</th>
                                <th scope="col">Công dụng (diễn giải chi tiết) </th>
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
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var currentRow = null;
       
        //kiem tra xem user hien tai co quyen truy cap vao trang PO khong, neu khong redirect
        if ($("#muahang").val() == 'false') {
            window.location.replace("/Default.aspx");
        }

        $("#ngaypo").focusout(function () {
            LaySoPO();
        });
        //**********//
        var dsdata;
        var currentRow = null;
        //hien thi nut loading...
        $("#overlay").show();
        document.getElementById("nguoimuahang").value = $("#tenhienthi").val();
        $(document).ready(function () {
            ///Lay thong tin phong ban
            LayThongTinPhongBan();

            $("#nhacungcap").select2({
                placeholder: "Chọn thông tin nhà cung cấp",
                allowClear: true

            });
            //ham lay ten vat tu va ma vat tu tu select2
            $('#nhacungcap').on('select2:selecting', function (e) {
                // console.log('Selecting: ', e.params.args.data);
                var res = e.params.args.data.text.split("--");
                $("#tennhacungcap").val(res[1]);
                $("#manhacuangcap").val(res[0]);

            });
            //lay danh sach nguoi duyet
            LayDanhSachNguoiDuyet();
            ///sau khi load xong het tat ca thi tat Loading...
            $("#overlay").hide();
        });
        $("#donvidexuat").change(function () {

            document.getElementById("id_donvidexuat").value = $(this).val();
            LaySoPO();

        });
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
                            document.getElementById("id_donvidexuat").value = data[i]["ID_PhongBan"];
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

        //Xu ly lay so PR tu he thong
        function LaySoPO() {
            var data;
            if ($("#donvidexuat ").val() == "") {
                alert("Chưa chọn bộ phận đề xuất.");
            }
            else {

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LaySoPO",
                    data: { "phongban": Number($("#id_donvidexuat").val()), "nam": Number((new Date()).getFullYear()) },
                    dataType: "json",

                    success: function (data) {
                        var sopo;

                        sopo = data["So_PO"] + 1;
                        document.getElementById("sothutupo").value = sopo;
                        if (sopo < 10) {
                            sopo = "00" + sopo;
                        }
                        else if (sopo < 100 && sopo >= 10) {
                            sopo = "0" + sopo;
                        }
                        else {
                            sopo = sopo;
                        }
                        var year = data["Nam"].toString().slice(-2);
                        $("#namdexuat").val(data["Nam"]);
                        $("#sopo").val(sopo + "/POMH-" + year + "-" + data["Phong_Ban"]);

                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lay so PO; " + errorThrown);
               });
            }

        }
        //*******************//
        //Lay thông tin nguoi duyet PO
        function LayDanhSachNguoiDuyet() {

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/Webservice/dsnguoidung.asmx/LayDSNguoiDuyet",
                success: function (data) {
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        if (i == 0) {
                            str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            document.getElementById("id_nguoiduyetpo").value = data[i]["ID_NguoiDung"];
                        }
                        else {
                            str = str + '<option value="' + data[i]["ID_NguoiDung"] + '">' + data[i]["Ten_Hien_Thi"] + '</option>';
                        }

                    }
                    var opt_phongban = document.getElementById('nguoiduyetpo');
                    opt_phongban.insertAdjacentHTML('afterbegin', str);
                }
            });
        }
        //Luu thông tin PO va lay thông tin các PR da duyet
        function LuuPO() {
            //kiem tra xem chuoi PO Full la dang HD hay dang PO
            var str_po=$("#sopo").val();
            var n=str_po.search("POMH");
            if (n>0)
            {
                CapNhatSoPO();
            }
            
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
        //Cap nhap so PO trong table So_PO
        function CapNhatSoPO() {


            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_SoPO",
                data: {
                    "action": 2,
                    "id": 1,
                    "idphongban": Number($("#id_donvidexuat").val()),
                    "sopo": Number($("#sothutupo").val()),
                    "nam": Number($("#namdexuat").val()),

                },
                dataType: "json",
                success: function (data) {

                    alert("So PO đã được cập nhật.")
                },

            })

         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
        //*******************//
        //lay thong tin PO vua moi luu
        function LayThongTinPO()
        {
            var date = new Date($("#ngaypo").val());
            var thangtao = date.getMonth() + 1;

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDSPO",
                data: {
                    "action": 1,
                    "id": 0,
                    "sopo": 0,
                    "sopo_full": $("#sopo").val(),
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
                    if(data.length>0)
                    {
                        document.getElementById("id_po").value = data[0]["ID_PO"];
                    }
                },

            })
            
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lay so PO sau khi da luu ; " + errorThrown);
            });
        }
        //********************//
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
            .done(LayThongTinPO())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
            });
        }
        //*******************//
        //// Find and remove selected table rows
        $("#themchitietPO").click(function () {
            var markup = "";
            var stt = 1;
            var mata_true = 0;
            //kiem tra xem phong ban do co phai la MATA hay khong, neu la MATA thi giu nguyen ngay hang, ko can cong them leadtime
            if ($("#id_donvidexuat").val()==1)
            {
                mata_true = 1;
            }
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
                    var new_ngaymuahang = ngaycanhang;
                    if(mata_true==0)
                    {
                        new_ngaymuahang = moment(ngaycanhang, "DD/MM/YYYY").add(leadtime, 'days');
                        new_ngaymuahang = moment(new_ngaymuahang).format("DD/MM/YYYY");
                    }
                    
                    $(this).parents("tr").remove();
                    markup = markup + "<tr><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongia + "'/><input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtien + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "</td></tr>";
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
            var leadtime = 0;
            currentRow.find('td').find("input[id^='leadtime*']").each(function () {
                //alert(this.id)
                leadtime = this.value;
            });
            //tinh ngay mua hang
            var new_ngaymuahang = moment(ngaycanhang, "DD/MM/YYYY").subtract(leadtime, 'days');
            new_ngaymuahang = moment(new_ngaymuahang).format("DD/MM/YYYY");
            $(this).parents('tr').remove();

            if (currentRow) {
                var $tds = currentRow.find('td');
                stt = $tds.eq(1).text();

                markup = markup + "<tr><td><input name='record' type='checkbox'></td><td>" + stt + "</td><td class='cls_sopr_full'>" + sopr_full + "<input type='hidden' name='sopr_chitiet' value='" + id_pr_chitiet + "' /></td><td class='cls_mavattu'>" + mahang + "</td><td class='cls_tenvattu'>" + tenhang + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_soluongyeucau'>" + soluongpo + "</td><td class='cls_dongiatamtinh'>" + dongia + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongia + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtien + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtien + "'/></td><td class='cls_nhacungung'>" + nhacungcap + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + new_ngaymuahang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdung + "</td></tr>";
                $("#table_vattu tbody").append(markup);
                currentRow = null;
            }

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
                ngaycanhang = moment(ngaycanhang, "DD/MM/YYYY").format("YYYY-MM-DD");

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
                        "id_prchitiet": id_pr_chitiet,
                        "ngaymuahang": ngaycanhang
                    },
                    dataType: "json",
                    success: function (data) {
                        alert("Da tao PO chi tiet thanh cong.");
                        //cap nhat trang thai cua vat tu trong PR chi tiet de biet vat tu do da duoc PO
                        Update_TrangThai_VatTu_PRChiTiet(id_pr_chitiet,1);
                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lấy PR chi tiết đã duyệt; " + errorThrown);
               });
            });
           
        }
        function Update_TrangThai_VatTu_PRChiTiet(id_pr_chitiet, tinhtrang)
        {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/UpdateTinhTrangPRChiTiet",
                data: {
                    "id_pr_chitiet": id_pr_chitiet,
                    "tinhtrang": tinhtrang
                },
                dataType: "json",
                success: function (data) {
                    //console.log("Đã cập nhật tình trạng PR chi tiết.")
                    window.location.replace("DanhSachPO");

                },

            })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error cập nhật PR chi tiết; " + errorThrown);
               });
        }
    </script>
</asp:Content>