<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuaPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.SuaPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay"><div id="text"><img class="img-responsive" src="../../Images/loader.gif" alt=""/></div></div> 


    <div class="container" id="container">
        <div class="row">
            <div class="col-md-6">Công ty CP Sản Xuất Nhựa Duy Tân</div>
            <div class="col-md-6"><span class="pull-right">Phụ lục 5 - QT-CUVT-01</span></div>
        </div>
        <div class="row">
            <div class="col-md-12"><h3><p class="text-center font-weight-bold">PHIẾU ĐỀ XUẤT MUA HÀNG</p></h3></div>
        </div>
        <div class="row">
             <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="bophan">Bộ phận đề xuất</label>
                        <input type="text" class="form-control" id="bophandexuat" readonly/>
                        <input type="hidden" id="ID_bophandexuat"/>
                        <input type="hidden" id="ID_nguoidexuat"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sopr">Số PR</label>
                        <input type="text" class="form-control" id="sopr" readonly/>
                        <input type="hidden" id="namdexuat"/>
                        <input type="hidden" id="sothutupr"/>
                         <input type="hidden" id="id_pr"/>
                        <input type="hidden" id="tinhtrangPR"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-6">
                            <label for="congdung">Công dụng</label>
                            <input type="text" class="form-control" id="congdung" placeholder="Nhập nội dung công dụng" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="ngaydexuat">Ngày (*)</label>
                            <input type="date" class="form-control" id="ngaydexuat">
                            
                        </div>

                    </div>
                </div>
        </div>
        <div class="row">
            <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-12">
                             <div class="form-group col-md-12">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Thêm vật tư</button>
        
    </div>
                            <div class="modal fade" id="myModal" role="form" data-backdrop="static">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Thêm mới / cập nhật vật tư</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="mavattu">Mã vật tư:</label>
                                                    <select class="form-control" id="select_mavattu" style="width: 100%;">
                                                        <asp:Literal id="lit_vattu" runat="server" Mode="PassThrough"></asp:Literal>
                                                    </select>
                                                    <input type="hidden" id="txt_vattu" runat="server"/>
                                                    <input type="hidden" id="mavattu"/>
                                                    <input type="hidden" id="id_pr_chi_tiet"/>
                                                    <input type="hidden" id="leadtime"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tenvattu">Tên vật tư:</label>
                                                    <input type="text" class="form-control" id="tenvattu" readonly/>
                                                </div>
                                                <div class="form-group">
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
                                                    <input type="text" class="form-control" id="dongiatamtinh" />
                                                    <input type="hidden" id="dongiatamtinh_notmask"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tigia">Tỉ giá:</label>
                                                    <input type="number" class="form-control" id="tigia" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanhtientamung">Thành tiền tạm ứng:</label>
                                                    <input type="text" class="form-control" id="thanhtientamung"/>
                                                    <input type="hidden" id="thanhtientamung_notmask"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="nhacungung">Nhà cung ứng:</label>
                                                    <input type="text" class="form-control" id="nhacungung" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tinhtrangvattu">Tình trạng VT:</label>
                                                    <input type="number" class="form-control" id="tinhtrangvattu" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="ngaycanhang">Ngày cần hàng:</label>
                                                    <input type="date" class="form-control" id="ngaycanhang" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thoigiansudung">Thời gian sử dụng:</label>
                                                    <input type="text" class="form-control" id="thoigiansudung" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="congdungchitiet">Công dụng:</label>
                                                    <input type="text" class="form-control" id="congdungchitiet" />
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
                                            <th scope="col"></th>
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
                                            <th scope="col">Công dụng (diễn giải chi tiết) </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <td colspan="7" style="font-weight:bold">Tổng cộng</td>
                                            <td style="font-weight:bold" id="tongsoluong">0</td>
                                            <td><input type="hidden" id="tongsoluong_notmask"/></td>
                                            <td></td>
                                            <td style="font-weight:bold" id="tongtien">0</td>
                                            <td><input type="hidden" id="tongtien_notmask"/></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    </tbody>
                                </table>
                              <%--  <button type="button" class="btn btn-danger btn-sm" id="xoavattu">Xóa vật tư</button>--%>
                                
                            </div>

                        </div>
                    </div>
                </div>
        </div>
       
        <div class="row">
            <div class="form-row">
                <div class="form-group">
                    <div class="form-group col-md-12">
                        <label for="ghichu">Ghi chú</label>
                        <input type="text" class="form-control" id="ghichu" />
                    </div>
                    <%--<div class="form-group col-md-6">
                        <label for="tongcongdong">Tổng cộng (đồng)</label>
                        <input type="text" class="form-control" id="tongcongdong">
                    </div>--%>

                </div>
            </div>
        </div>
          <div class="row">
                  <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-12">
                               <div class="table-responsive">
                                <table class="table table-bordered" id="table_ngansach">
                                   
                                    <tbody>
                                        <tr>
                                            <td style="border:none">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="1"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="2"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="3"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="4"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="5"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="6"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ngân sách được duyệt
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="11"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="22"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="33"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="44"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="55"/>
                                            </td>
                                            <td>
                                                 <input type="text" class="form-control" id="66"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Đề xuất lần này
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="111"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="222"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="333"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="444"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="555"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="666"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Lũy kế
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="1111"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="2222"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="3333"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="4444"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="5555"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="6666"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Thừa thiếu (NS-LK)
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="11111"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="22222"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="33333"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="44444"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="55555"/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" id="66666"/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <div class="row">
            <div class="form-group">
                <div class="form-group col-md-12">
                         <div class="table-responsive">
                                <table class="table" id="table_chuky">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col">Ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tháng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    năm</th>
                                        
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>PHÊ DUYỆT</td>
                                            <td>KẾ TOÁN QUẢN TRỊ</td>
                                            <td>GIÁM ĐỐC BỘ PHẬN</td>
                                            <td>KẾ TOÁN TRƯỞNG</td>
                                            <td>NGƯỜI ĐỀ XUẤT</td>
                                        </tr>
                                    </tbody>
                                </table>
                              <%--  <button type="button" class="btn btn-danger btn-sm" id="xoavattu">Xóa vật tư</button>--%>
                                
                            </div>
                </div>
            </div>
        </div>
        <div class="row">
         <div class="form-group col-md-12" style="text-align:center">
        <button type="button" class="btn btn-info btn-sm" onclick="LuuPR()">Lưu</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="InForm()">In</button>
        <button type="button" class="btn btn-success btn-sm" onclick="ChuyenTrangThai()" id="btt_chuyen" style="display:none">Chuyển</button>
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
            else
            {

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

                        document.getElementById("id_pr").value = data[0]["ID_PR"];
                        document.getElementById("sopr").value = data[0]["So_PR_Full"];
                        document.getElementById("bophandexuat").value = data[0]["Ten_PhongBan"];
                        document.getElementById("ID_bophandexuat").value = data[0]["ID_PhongBan"];
                        document.getElementById("ID_nguoidexuat").value = data[0]["ID_Nguoi_De_Xuat"];
                        document.getElementById("congdung").value = data[0]["Cong_Dung"];
                        document.getElementById("namdexuat").value = data[0]["Nam"];
                        document.getElementById("sothutupr").value = data[0]["So_PR"];
                        document.getElementById("tinhtrangPR").value = data[0]["Tinh_Trang"];
                        //kiem tra xem tinh trang la luu tam hay chua duyet, neu la chua duyet thi khong cho hien thi nut chuyen
                        if (data[0]["Tinh_Trang"]==1)
                        {
                            $("#btt_chuyen").removeAttr("style");
                        }
                        //load ngay de xuat
                        var dateString = data[0]["Ngay_Tao"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = year + "-" + month + "-" + day;
                        document.getElementById("ngaydexuat").value = date;

                        document.getElementById("tongsoluong").innerHTML = Number(data[0]["Tong_So_Luong_Yeu_cau"]).toLocaleString('vn');
                        document.getElementById("tongsoluong_notmask").value = data[0]["Tong_So_Luong_Yeu_cau"];
                        document.getElementById("tongtien").innerHTML = Number(data[0]["Tong_Tien"]).toLocaleString('vn');
                        document.getElementById("tongtien_notmask").value = data[0]["Tong_Tien"];
                        document.getElementById("ghichu").value = data[0]["Ghi_Chu"];
                        document.getElementById("1").value = data[0]["Tieu_De_1"];
                        document.getElementById("2").value = data[0]["Tieu_De_2"];
                        document.getElementById("3").value = data[0]["Tieu_De_3"];
                        document.getElementById("4").value = data[0]["Tieu_De_4"];
                        document.getElementById("5").value = data[0]["Tieu_De_5"];
                        document.getElementById("6").value = data[0]["Tieu_De_6"];
                        if (data[0]["Ngan_Sach_Duoc_Duyet_1"] != 0) {
                            document.getElementById("11").value = data[0]["Ngan_Sach_Duoc_Duyet_1"];
                        }
                        if (data[0]["Ngan_Sach_Duoc_Duyet_2"] != 0) {
                            document.getElementById("22").value = data[0]["Ngan_Sach_Duoc_Duyet_2"];
                        }
                        if (data[0]["Ngan_Sach_Duoc_Duyet_3"] != 0) {
                            document.getElementById("33").value = data[0]["Ngan_Sach_Duoc_Duyet_3"];
                        }
                        if (data[0]["Ngan_Sach_Duoc_Duyet_4"] != 0) {
                            document.getElementById("44").value = data[0]["Ngan_Sach_Duoc_Duyet_4"];
                        }
                        if (data[0]["Ngan_Sach_Duoc_Duyet_5"] != 0) {
                            document.getElementById("55").value = data[0]["Ngan_Sach_Duoc_Duyet_5"];
                        }
                        if (data[0]["Ngan_Sach_Duoc_Duyet_6"] != 0) {
                            document.getElementById("66").value = data[0]["Ngan_Sach_Duoc_Duyet_6"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_1"] != 0) {
                            document.getElementById("111").value = data[0]["De_Xuat_Lan_Nay_1"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_2"] != 0) {
                            document.getElementById("222").value = data[0]["De_Xuat_Lan_Nay_2"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_3"] != 0) {
                            document.getElementById("333").value = data[0]["De_Xuat_Lan_Nay_3"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_4"] != 0) {
                            document.getElementById("444").value = data[0]["De_Xuat_Lan_Nay_4"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_5"] != 0) {
                            document.getElementById("555").value = data[0]["De_Xuat_Lan_Nay_5"];
                        }
                        if (data[0]["De_Xuat_Lan_Nay_6"] != 0) {
                            document.getElementById("666").value = data[0]["De_Xuat_Lan_Nay_6"];
                        }
                        if (data[0]["Luy_Ke_1"] != 0) {
                            document.getElementById("1111").value = data[0]["Luy_Ke_1"];
                        }
                        if (data[0]["Luy_Ke_2"] != 0) {
                            document.getElementById("2222").value = data[0]["Luy_Ke_2"];
                        }
                        if (data[0]["Luy_Ke_3"] != 0) {
                            document.getElementById("3333").value = data[0]["Luy_Ke_3"];
                        }
                        if (data[0]["Luy_Ke_4"] != 0) {
                            document.getElementById("4444").value = data[0]["Luy_Ke_4"];
                        }
                        if (data[0]["Luy_Ke_5"] != 0) {
                            document.getElementById("5555").value = data[0]["Luy_Ke_5"];
                        }
                        if (data[0]["Luy_Ke_6"] != 0) {
                            document.getElementById("6666").value = data[0]["Luy_Ke_6"];
                        }
                        if (data[0]["Thua_Thieu_1"] != 0) {
                            document.getElementById("11111").value = data[0]["Thua_Thieu_1"];
                        }
                        if (data[0]["Thua_Thieu_2"] != 0) {
                            document.getElementById("22222").value = data[0]["Thua_Thieu_2"];
                        }
                        if (data[0]["Thua_Thieu_3"] != 0) {
                            document.getElementById("33333").value = data[0]["Thua_Thieu_3"];
                        }
                        if (data[0]["Thua_Thieu_4"] != 0) {
                            document.getElementById("44444").value = data[0]["Thua_Thieu_4"];
                        }
                        if (data[0]["Thua_Thieu_5"] != 0) {
                            document.getElementById("55555").value = data[0]["Thua_Thieu_5"];
                        }
                        if (data[0]["Thua_Thieu_6"] != 0) {
                            document.getElementById("66666").value = data[0]["Thua_Thieu_6"];
                        }



                    },

                })
                  .done(LayThongTinPRChiTiet())
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }
            $("#overlay").hide();



            //khai bao mau data cho dropdown list chon vat tu
            var item_dta = { id: 0, text: "" };

            $("#select_mavattu").select2({
                placeholder: "Chọn thông tin vật tư",
                minimumInputLength: 3,
                allowClear: true
                
            });
          
            //ham lay ten vat tu va ma vat tu tu select2
            $('#select_mavattu').on('select2:selecting', function (e) {
                // console.log('Selecting: ', e.params.args.data);
                var res = e.params.args.data.text.split("--");
                $("#tenvattu").val(res[1]);
                $("#mavattu").val(e.params.args.data.id);
                TimVatTu(e.params.args.data.id);
                
            });
            function TimVatTu(mavatu)
            {

                var jsObj = JSON.parse($("#ContentPlaceHolder1_txt_vattu").val());

                var i = jsObj.find(function (obj) { return obj.mvt === mavatu; });
                console.log(i);
                $("#dvt").val(i.dvt);
                $("#dongiatamtinh").val(i.dg);
                $("#leadtime").val(i.lt);
            }
         
            var stt = 0;
            $("#DongY").click(function ()
            {
                
                var rowCount = $('#table_vattu >tbody >tr').length;
                if (rowCount==0)
                {
                    stt++;
                }
                else
                {
                    stt = rowCount+1;

                }

            var mavattu = $("#mavattu").val();
            var tenvattu = $("#tenvattu").val();
            var dvt = $("#dvt").val();
            var tonkho = $("#tonkho").val();
            var soluongyeucau = $("#soluongyeucau").val();
            var dongiatamtinh = $("#dongiatamtinh").val();
            var dongiatamtinh_nomask= $("#dongiatamtinh_notmask").val();
            var tigia = $("#tigia").val();
            var thanhtientamung = $("#thanhtientamung").val();
            var thanhtientamung_nomask = $("#thanhtientamung_notmask").val();
            var nhacungung = $("#nhacungung").val();
            var tinhtrangvattu = $("#tinhtrangvattu").val();
            var ngaycanhang = $("#ngaycanhang").val();
            var thoigiansudung = $("#thoigiansudung").val();
            var congdungchitiet = $("#congdungchitiet").val();
            var leadtime = $("#leadtime").val();
            var id_chitiet_pr = document.getElementById("id_pr_chi_tiet").value;
                
            var markup = "";
            if (currentRow) {
                var $tds = currentRow.find('td');
                stt= $tds.eq(2).text();

                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td class='cls_stt'>" + stt + "<input type='hidden' id='id_chitiet*" + stt + "' value='" + id_chitiet_pr + "'/></td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamung_nomask + "'/></td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
                $("#table_vattu tbody").find($(currentRow)).replaceWith(markup);
                currentRow = null;
            }
            else {
                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td class='cls_stt'>" + stt + "<input type='hidden' id='id_chitiet*" + stt + "' value='0'/></td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamung_nomask + "'/></td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
                $("#table_vattu tbody").append(markup);
            }
            //cap nhat tong so luong va tong so tien
            CapNhatSoLuongVaSoTien();
            //**************//
            $("#select_mavattu").val("").trigger('change.select2');
            $("#tenvattu").val("");
            $("#dvt").val("");
            $("#tonkho").val("");
            $("#soluongyeucau").val("");
            $("#dongiatamtinh").val("");
            $("#dongiatamtinh_notmask").val("");
            $("#congdungchitiet").val("");
            $("#tigia").val("");
            $("#thanhtientamung").val("");
            $("#thanhtientamung_notmask").val("");
            $("#nhacungung").val("");
            $("#tinhtrangvattu").val("");
            $("#ngaycanhang").val("");
            $("#thoigiansudung").val("");
            $("#congdungchitiet").val("");
            $("#leadtime").val("");
        });
        
       
           //Xu ly nut edit vat tu
            $(document).on('click', 'span.editrow', function () {
                $("#myModal").modal('show');
                currentRow = $(this).parents('tr');
                //console.log(currentRow);
                $("#select_mavattu").val($(this).closest('tr').find('td.cls_mavattu').text()).trigger('change.select2');
                var stt = $(this).closest('tr').find('td.cls_stt').text();
                if(document.getElementById("id_chitiet*" + stt).value==0 ||document.getElementById("id_chitiet*" + stt).value=="")
                {
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
                $("#ngaycanhang").val($(this).closest('tr').find('td.cls_ngaycanhang').text());
                $("#thoigiansudung").val($(this).closest('tr').find('td.cls_thoigiansudung').text());
                $("#congdungchitiet").val($(this).closest('tr').find('td.cls_congdungchitiet').text());
                var leadtime=0;
                $tds.find("input[id^='leadtime*']").each(function () {
                    //alert(this.id)
                    leadtime = this.value;

                });
                $("#leadtime").val(leadtime);
            });
            //**********************//

           
            
        
            
        });
        //Xu ly nut xoa vat tu
        $(document).on('click', 'span.deleterow', function () {
            $(this).parents('tr').remove();
            CapNhatSoTT();
            CapNhatSoLuongVaSoTien();
            return false;

        });
        //*********************//
        //Xu ly khi ti gia, don gia tam ung va so luong yeu cau thay doi thi tinh lai gia tien tam ung
        $("#tigia").change(function () {
            
            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        $("#dongiatamtinh").change(function () {
            var dgtt = $("#dongiatamtinh").val();
            document.getElementById("dongiatamtinh_notmask").value = dgtt;
        

        });
        $("#soluongyeucau").change(function () {
           
            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        function TinhKhiThayDoiTiGiaVaSoLuong()
        {
            //gan thong tin don gia tam tinh cho notmask
            if (document.getElementById("dongiatamtinh_notmask").value=="")
            {
                var dgtt = $("#dongiatamtinh").val();
                document.getElementById("dongiatamtinh_notmask").value = dgtt;
            }
            
            $("#thanhtientamung").val($("#dongiatamtinh_notmask").val() * $("#soluongyeucau").val() * $("#tigia").val());
            
            var tt = $("#thanhtientamung").val();

            document.getElementById("thanhtientamung_notmask").value = tt;
            
            $('#thanhtientamung').val(Number($('#thanhtientamung').val()).toLocaleString('vn'));
            $('#dongiatamtinh').val(Number($('#dongiatamtinh_notmask').val()).toLocaleString('vn'));
        }
        //*********************//

        //Xu ly cap nhat lai so thu tu khi delete vat tu
        function CapNhatSoTT()
        {
            var table = $("#table_vattu");
            var rowCount = $('#table_vattu >tbody >tr').length;
            var sothutu = 0;
            table.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');
               
                sothutu++;
                if (sothutu <= rowCount)
                {
                    $tds.eq(2).html(sothutu);
                    ////thay doi gia tri ID nhung chua duoc...nhung ko bao loi
                    //$tds.find("input[id^='thanhtientamung*']").each(function () {
                    //    //alert(this.id)
                    //    var id_new = "thanhtientamung*" + sothutu;
                    //    $("#"+this.id).attr("id", id_new);
                       
                    //});
                   
                 
                }
         
            });
                     
        }
        //**********************//

        //Xu ly cap nhat so luong va so tien khi them moi, chinh sua, xoa vat tu
        function CapNhatSoLuongVaSoTien()
        {
            var stt = 1;
            var table = $("#table_vattu");
            var tongsoluong = 0, tongtien = 0;
            
            table.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');
                //cap nhat tong so luong yeu cau va tong tien
                tongsoluong = Number(tongsoluong) + Number($tds.eq(7).text());
                document.getElementById("tongsoluong_notmask").value = tongsoluong;
                //lay thong tin gia tien chua co dinh dang
                var st = 0;
                $tds.find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    st = this.value;

                });
                var tt = st;
                tongtien = Number(tongtien) + Number(tt);
                document.getElementById("tongtien_notmask").value = tongtien;
                $("#tongsoluong").html(tongsoluong.toLocaleString('vn'));
                
                $("#tongtien").html(tongtien.toLocaleString('vn'));
                stt++;
            });
        }
        //********************//

        //Xu ly khi nhan link chinh sua vat tu
        function ChinhSuaVatTu() {
            currentRow = $(this).parents('tr');
           // console.log(currentRow);
            $("#myModal").modal('show');

        }
        //********************//

        //Xu ly lay so PR tu he thong
        function LaySoPR()
        {
            var data;
            if ($("#bophandexuat").val()=="")
            {
                alert("Không có bộ phận đề xuất.");
            }
            else
            {
               
                $.ajax({
                    type: "POST",
                    url: "/Webservice/dsnguoidung.asmx/LaySoPR",
                    data: { "phongban": $("#ID_bophandexuat").val(), nam: (new Date()).getFullYear() },
                    dataType: "json",
                    
                    success: function (data) {
                        var sopr;
                        
                        sopr = data["So_PR"] + 1;
                        document.getElementById("sothutupr").value = sopr;
                        if (sopr<10)
                        {
                            sopr = "00" + sopr;
                        }
                        else if (sopr < 100 && sopr > 10)
                        {
                            sopr = "0" + sopr;
                        }
                        else
                        {
                            sopr = sopr;
                        }
                        var year = data["Nam"].toString().slice(-2);
                        $("#namdexuat").val(data["Nam"]);
                        //$("#sopr").val(sopr + "-" + data["Phong_Ban"] + "-" + year);
                        
                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lay so PR; " + errorThrown);
               });
            }
           
        }
        //*******************//
        $("#ngaydexuat").change(function () {
            $("#ngaydexuat").removeAttr( 'style');

        });
        //Xu ly luu PR
        function LuuPR()
        {
            if ($("#ngaydexuat").val()=="")
            {
                alert("Vui lòng chọn ngày tạo phiếu.");
                $("#ngaydexuat").css("border-color", "red");
                return;
            }
            var date = new Date($("#ngaydexuat").val());
            var thangtao = date.getMonth()+1;
            var nguoidexuat= $("#ID_nguoidexuat").val();
            var tinhtrangPR = $("#tinhtrangPR").val();
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ActionPR",
                data: {
                    "action": 2,
                    "id": $("#id_pr").val(),
                    "id_phongban": Number($("#ID_bophandexuat").val()),
                    "sopr": Number($("#sothutupr").val()),
                    "sopr_full": $("#sopr").val(),
                    "nam": Number($("#namdexuat").val()),
                    "congdung": $("#congdung").val(),
                    "ngaytao": $("#ngaydexuat").val(),
                    "thangtao": Number(thangtao),
                    "tongsoluongyeucau": Number($("#tongsoluong_notmask").val()),
                    "tongtien": Number($("#tongtien_notmask").val()),
                    "ghichu": $("#ghichu").val(),
                    "ngayduyet": $("#ngaydexuat").val(),
                    "id_nguoiduyet": 0,
                    "id_nguoidexuat": 0,
                    "tinhtrang": Number(tinhtrangPR),
                    "prscanfile": "",
                    "sendmail": false,
                    "tieude1": $("#1").val(),
                    "tieude2": $("#2").val(),
                    "tieude3": $("#3").val(),
                    "tieude4": $("#4").val(),
                    "tieude5": $("#4").val(),
                    "tieude6": $("#6").val(),
                    "ngansachduocduyet1": Number($("#11").val()),
                    "ngansachduocduyet2": Number($("#22").val()),
                    "ngansachduocduyet3": Number($("#33").val()),
                    "ngansachduocduyet4": Number($("#44").val()),
                    "ngansachduocduyet5": Number($("#55").val()),
                    "ngansachduocduyet6": Number($("#66").val()),
                    "dexuatlannay1": Number($("#111").val()),
                    "dexuatlannay2": Number($("#222").val()),
                    "dexuatlannay3": Number($("#333").val()),
                    "dexuatlannay4": Number($("#444").val()),
                    "dexuatlannay5": Number($("#555").val()),
                    "dexuatlannay6": Number($("#666").val()),
                    "luyke1":  Number($("#1111").val()),
                    "luyke2":  Number($("#2222").val()),
                    "luyke3": Number($("#3333").val()),
                    "luyke4": Number($("#4444").val()),
                    "luyke5": Number($("#5555").val()),
                    "luyke6": Number($("#6666").val()),
                    "thuathieu1": Number($("#11111").val()),
                    "thuathieu2": Number($("#22222").val()),
                    "thuathieu3": Number($("#33333").val()),
                    "thuathieu4": Number($("#44444").val()),
                    "thuathieu5": Number($("#55555").val()),
                    "thuathieu6": Number($("#66666").val())
                },
                dataType: "json",
                success: function (data) {
                  alert("PR đã được cập nhật thành công.")
                },

            })
         .done(TaoPRChiTiet())
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
        //*******************//
       
        // Xu ly PR chi tiet //
        function TaoPRChiTiet()
        {
            var stt = 1;
            var table = $("#table_vattu");
            var rowCount = $('#table_vattu >tbody >tr').length;
            table.find('tbody > tr').each(function () {
                
                var $tds = $(this).find('td');
                var mavt = $tds.eq(3).html();
                var tenvt = $tds.eq(4).html();
                var dvt = $tds.eq(5).html();
                var tonkho = $tds.eq(6).html();
                var slyc = $tds.eq(7).html();
                var idchitiet = 0;
                $tds.find("input[id^='id_chitiet*']").each(function () {
                    //alert(this.id)
                    idchitiet = this.value;

                });
                var id_pr_chi_tiet = idchitiet;
                var gd = 0;
                $tds.find("input[id^='dongiatamtinh*']").each(function () {
                    //alert(this.id)
                    gd = this.value;

                });
                var dgtt = gd;

                var tgia = $tds.eq(9).html();

                var tt = 0;
                $tds.find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    tt = this.value;

                });
                var thanhtientu = tt;
                var nccvt = $tds.eq(11).html();
                var tinhtrangvt = $tds.eq(12).html();
                var ngaych = $tds.eq(13).html();
                var thoigiansd = $tds.eq(14).html();
                var congdungchitiet = $tds.eq(15).html();
                var leadtime = 0;
                $tds.find("input[id^='leadtime*']").each(function () {
                    //alert(this.id)
                    leadtime = this.value;

                });
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR_ChiTiet",
                    data: {
                        "action": 2,
                        "id": Number(id_pr_chi_tiet),
                        "idpr": Number($("#id_pr").val()),
                        "mahang": mavt,
                        "tenhang": tenvt,
                        "dvt": dvt,
                        "tonkho": Number(tonkho),
                        "soluongyeucau": Number(slyc),
                        "dongia": Number(dgtt),
                        "tigia": Number(tgia),
                        "thanhtientamung": Number(thanhtientu),
                        "nhacungcap": nccvt,
                        "tinhtrangvattu": tinhtrangvt,
                        "ngaycanhang": ngaych,
                        "thoigiansudung": thoigiansd,
                        "congdung": congdungchitiet,
                        "leadtime":leadtime
                    },
                    dataType: "json",
                    success: function (data) {
                       
                        stt++;
                    },

                })
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            });
        }
        //******************//
        function InForm() {
            $this = $(this);
            // Create Base64 Object
            var Base64 = { _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=", encode: function (e) { var t = ""; var n, r, i, s, o, u, a; var f = 0; e = Base64._utf8_encode(e); while (f < e.length) { n = e.charCodeAt(f++); r = e.charCodeAt(f++); i = e.charCodeAt(f++); s = n >> 2; o = (n & 3) << 4 | r >> 4; u = (r & 15) << 2 | i >> 6; a = i & 63; if (isNaN(r)) { u = a = 64 } else if (isNaN(i)) { a = 64 } t = t + this._keyStr.charAt(s) + this._keyStr.charAt(o) + this._keyStr.charAt(u) + this._keyStr.charAt(a) } return t }, decode: function (e) { var t = ""; var n, r, i; var s, o, u, a; var f = 0; e = e.replace(/[^A-Za-z0-9+/=]/g, ""); while (f < e.length) { s = this._keyStr.indexOf(e.charAt(f++)); o = this._keyStr.indexOf(e.charAt(f++)); u = this._keyStr.indexOf(e.charAt(f++)); a = this._keyStr.indexOf(e.charAt(f++)); n = s << 2 | o >> 4; r = (o & 15) << 4 | u >> 2; i = (u & 3) << 6 | a; t = t + String.fromCharCode(n); if (u != 64) { t = t + String.fromCharCode(r) } if (a != 64) { t = t + String.fromCharCode(i) } } t = Base64._utf8_decode(t); return t }, _utf8_encode: function (e) { e = e.replace(/rn/g, "n"); var t = ""; for (var n = 0; n < e.length; n++) { var r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r) } else if (r > 127 && r < 2048) { t += String.fromCharCode(r >> 6 | 192); t += String.fromCharCode(r & 63 | 128) } else { t += String.fromCharCode(r >> 12 | 224); t += String.fromCharCode(r >> 6 & 63 | 128); t += String.fromCharCode(r & 63 | 128) } } return t }, _utf8_decode: function (e) { var t = ""; var n = 0; var r = c1 = c2 = 0; while (n < e.length) { r = e.charCodeAt(n); if (r < 128) { t += String.fromCharCode(r); n++ } else if (r > 191 && r < 224) { c2 = e.charCodeAt(n + 1); t += String.fromCharCode((r & 31) << 6 | c2 & 63); n += 2 } else { c2 = e.charCodeAt(n + 1); c3 = e.charCodeAt(n + 2); t += String.fromCharCode((r & 15) << 12 | (c2 & 63) << 6 | c3 & 63); n += 3 } } return t } }

            var dtRow = $this.parents('tr');
            // Encode the String
            var encodedString = Base64.encode($("#sopr").val());
            window.location.replace("View.html?pr=" + encodedString);

          
        }
        function LayThongTinPRChiTiet() {
            var stt = 0;
            var markup = "";

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ActionPR_ChiTiet",
                data: {
                    "action": 1,
                    "id": 0,
                    "idpr": Number($("#id_pr").val()),
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
                    "leadtime":0
                },
                dataType: "json",
                success: function (data) {
                    //duyet array data tra ve gan tung dong cho table
                    for (var i = 0; i < data.length; i++) {
                        stt++;
                        //load ngay de xuat
                        var dateString = data[i]["Ngay_Can_Hang"].substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        var date = year + "-" + month + "-" + day;


                        markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td class='cls_stt'>" + stt + "<input type='hidden' id='id_chitiet*" + stt + "' value='" + data[i]["ID_PR_Chi_Tiet"] + "'/></td><td class='cls_mavattu'>" + data[i]["Ma_Hang"] + "</td><td class='cls_tenvattu'>" + data[i]["Ten_Hang"] + "</td><td class='cls_dvt'>" + data[i]["DVT"] + "</td><td class='cls_tonkho'>" + data[i]["Ton_Kho"] + "</td><td class='cls_soluongyeucau'>" + data[i]["So_Luong_Yeu_cau"] + "</td><td class='cls_dongiatamtinh'>" + Number(data[i]["Don_Gia"]).toLocaleString('vn') + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + data[i]["Don_Gia"] + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + data[i]["Lead_Time"] + "'/></td><td class='cls_tigia'>" + data[i]["Ti_Gia"] + "</td><td class='cls_thanhtientamung'>" + Number(data[i]["Thanh_Tien_Tam_Ung"]).toLocaleString('vn') + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + data[i]["Thanh_Tien_Tam_Ung"] + "'/></td><td class='cls_nhacungung'>" + data[i]["Nha_Cung_cap"] + "</td><td class='cls_tinhtrangvattu'>" + data[i]["Tinh_Trang_Vat_Tu"] + "</td><td class='cls_ngaycanhang'>" + date + "</td><td class='cls_thoigiansudung'>" + data[i]["Thoi_Gian_Xu_Dung"] + "</td><td class='cls_congdungchitiet'>" + data[i]["Cong_Dung"] + "</td></tr>";
                        $("#table_vattu tbody").append(markup);
                    }
                    //an loading
                    $("#overlay").hide();
                },

            })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    alert("error" + errorThrown);
                });


        }
        function ChuyenTrangThai()
        {
            if ($("#ngaydexuat").val() == "") {
                alert("Vui lòng chọn ngày tạo phiếu.");
                $("#ngaydexuat").css("border-color", "red");
                return;
            }
            var date = new Date($("#ngaydexuat").val());
            var thangtao = date.getMonth() + 1;
            var nguoidexuat = $("#ID_nguoidexuat").val();

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ActionPR",
                data: {
                    "action": 2,
                    "id": $("#id_pr").val(),
                    "id_phongban": Number($("#ID_bophandexuat").val()),
                    "sopr": Number($("#sothutupr").val()),
                    "sopr_full": $("#sopr").val(),
                    "nam": Number($("#namdexuat").val()),
                    "congdung": $("#congdung").val(),
                    "ngaytao": $("#ngaydexuat").val(),
                    "thangtao": Number(thangtao),
                    "tongsoluongyeucau": Number($("#tongsoluong_notmask").val()),
                    "tongtien": Number($("#tongtien_notmask").val()),
                    "ghichu": $("#ghichu").val(),
                    "ngayduyet": $("#ngaydexuat").val(),
                    "id_nguoiduyet": 0,
                    "id_nguoidexuat": 0,
                    "tinhtrang": 2,
                    "prscanfile": "",
                    "sendmail": false,
                    "tieude1": $("#1").val(),
                    "tieude2": $("#2").val(),
                    "tieude3": $("#3").val(),
                    "tieude4": $("#4").val(),
                    "tieude5": $("#4").val(),
                    "tieude6": $("#6").val(),
                    "ngansachduocduyet1": Number($("#11").val()),
                    "ngansachduocduyet2": Number($("#22").val()),
                    "ngansachduocduyet3": Number($("#33").val()),
                    "ngansachduocduyet4": Number($("#44").val()),
                    "ngansachduocduyet5": Number($("#55").val()),
                    "ngansachduocduyet6": Number($("#66").val()),
                    "dexuatlannay1": Number($("#111").val()),
                    "dexuatlannay2": Number($("#222").val()),
                    "dexuatlannay3": Number($("#333").val()),
                    "dexuatlannay4": Number($("#444").val()),
                    "dexuatlannay5": Number($("#555").val()),
                    "dexuatlannay6": Number($("#666").val()),
                    "luyke1": Number($("#1111").val()),
                    "luyke2": Number($("#2222").val()),
                    "luyke3": Number($("#3333").val()),
                    "luyke4": Number($("#4444").val()),
                    "luyke5": Number($("#5555").val()),
                    "luyke6": Number($("#6666").val()),
                    "thuathieu1": Number($("#11111").val()),
                    "thuathieu2": Number($("#22222").val()),
                    "thuathieu3": Number($("#33333").val()),
                    "thuathieu4": Number($("#44444").val()),
                    "thuathieu5": Number($("#55555").val()),
                    "thuathieu6": Number($("#66666").val())
                },
                dataType: "json",
                success: function (data) {
                    alert("PR đã được cập nhật thành công.")
                },

            })
         .done(TaoPRChiTiet())
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
    </script>
   
</asp:Content>
