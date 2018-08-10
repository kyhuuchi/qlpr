<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DuyetPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.DuyetPR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../Images/loader.gif" alt="" /></div>
    </div>
    <div class="container" id="container">
         <div class="row">
            <div class="col-md-12"><h3><p class="text-center font-weight-bold">THÔNG TIN PHÊ DUYỆT PR</p></h3></div>
        </div>
          <div class="row">
             <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="ngaynhanpr">Ngày nhận PR</label>
                        <input type="date" class="form-control" id="ngaynhanpr" runat="server"/>
                        
                    </div>
                    <div class="form-group col-md-6">
                        <label for="ngayduyetpr">Ngày duyệt PR</label>
                        <input type="date" class="form-control" id="ngayduyetpr" runat="server"/>
                        <input type="hidden" id="id_pr" runat="server"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-6">
                            <label for="nguoiduyetpr">Người duyệt PR</label>
                               <select class="form-control" id="nguoiduyetpr" runat="server" name="nguoiduyetpr">
                                   
                                </select>
                             <input type="hidden" id="id_nguoi_duyet" runat="server"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="uploadfele">Upload file</label>
                             <input type="file" id="uploadfile" name="uploadfile"/>
                            
                        </div>

                    </div>
                </div>
              
        </div>
        <div class="row">
             <div class="form-row">
                    <div class="form-group">
                        <div class="form-group col-md-4">
                              
                        </div>
                        <div class="form-group col-md-4" style="text-align:center">
                                <asp:Button class="btn btn-primary" ID="btt_OK" runat="server" Text="Đồng ý" OnClick="btt_OK_Click"/>
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
                        "quanlykho":false,
                        "quanlymuahang":false,
                        "matkhau":"",
                        "domain":false
                    
                    }, 
                    dataType: "json",
                    success: function (data) {
                        //console.log(data);
                        var str = "";
                        for (var i = 0; i < data.length;i++)
                        {
                            if(i==0)
                            {
                                str = str + '<option value="' + data[i]["ID_NguoiDung"] + '" selected="selected">' + data[i]["Ten_Hien_Thi"] + '</option>';
                            }
                            else
                            {
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
            }
           
        });

        $("#ContentPlaceHolder1_nguoiduyetpr").change(function () {
           
            document.getElementById("ContentPlaceHolder1_id_nguoi_duyet").value = $(this).val();
            
        });
        function Thoat()
        {
            window.location.replace("/Default");
        }
    </script>
</asp:Content>
