<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BaoCaoSoLuongPO.aspx.cs" Inherits="PRPO_Manage.Pages.BaoCao.BaoCaoSoLuongPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../../Images/loader.gif" alt="" /></div>
    </div>
     <div class="container" id="container">
         <div class="row">
            <div class="col-md-12">
                <h3>
                    <p class="text-center font-weight-bold">SỐ LƯỢNG PO THEO THÁNG, THEO ĐƠN VỊ</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="tuthang">Từ</label>
                   <div class="form-group">
                                                    <div class='input-group date' id='tuthang'>
                                                        <input type='text' class="form-control" />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>
                </div>
                <div class="form-group col-md-4">
                    <label for="tunam">Năm</label>
                    <div class="form-group">
                                                    <div class='input-group date' id='tunam'>
                                                        <input type='text' class="form-control" />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>
                 
                </div>
          
                 <div class="form-group col-md-4">
                    <label for="donvi">Đơn vị</label>
                    <select class="form-control" id="donvi" style="width: 100%;">
                        <option value="0">Tất cả</option>
                        <option value="1">MATA</option>
                        <option value="2">Bình Dương</option>
                        <option value="3">Tân Đô</option>
                        <option value="5">Đức Hòa</option>
                        
                    </select>
                    <input type="hidden" id="hidden_idphongban" value="0" />
                     <input type="hidden" id="hidden_danhsach" />
                </div>
                
            </div>
        </div> 
         <div class="row">
              <div class="form-group col-md-12" style="text-align:center">
                    <button type="button" class="btn btn-primary" onclick="Btt_DongY()">Đồng ý</button>
                </div>
         </div> 
          <div class="row">
                <div id="chart">

                </div>
           </div>
         <div class="row">
             <ul class="nav nav-tabs">
        
        <li class="active"><a data-toggle="tab" href="#chuaduyet">Danh sách PO chưa duyệt <span class="badge" id="soluongpr_chuaduyet"></span></a></li>
        <li><a data-toggle="tab" href="#daduyet">Danh sách PO đã duyệt <span class="badge" id="soluongpr_daduyet"></span></a></li>
        <li><a data-toggle="tab" href="#dadong">Danh sách PO đã đóng <span class="badge" id="soluongpr_dadong"></span></a></li>
    </ul>

    <div class="tab-content" style="margin-top: 5px;">
        
        <div id="chuaduyet" class="tab-pane fade in active">
            <div class="panel-group" id="accordion_chuaduyet">
              
            </div>
        </div>
        <div id="daduyet" class="tab-pane fade">
           <div class="panel-group" id="accordion_daduyet">
               </div>
        </div>
        
         <div id="dadong" class="tab-pane fade">
           <div class="panel-group" id="accordion_dadong">
               </div>
        </div>
    </div>
         </div>
    </div>
     <script type="text/javascript">
        var srt_pb = [], dadong = [], daduyet = [], chuaduyet = [], id_pb = [];
        $(document).ready(function () {
            $('#tuthang').datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: true
            });
            $('#tunam').datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: true
            });
          
        });
        $("#donvi").change(function () {
            $("#hidden_idphongban").val($("#donvi").val());
        })
        function LoadPhongBan()
        {
            var tungay = $("#tuthang").datepicker("getDate");
            var denngay = $("#tunam").datepicker("getDate");
            if (tungay == "") {
                alert("Vui lòng chọn từ ngày.");
                $("#tuthang").css("border-color", "red");
                return;
            }
            if (denngay == "") {
                alert("Vui lòng chọn đến ngày.");
                $("#tunam").css("border-color", "red");
                return;
            }
            var date = new Date(tungay);
            var thang = date.getMonth() + 1;
            var ngay = date.getDate();
            var nam = date.getFullYear();
            var tungay_format = nam + "-" + thang + "-" + ngay;

            var date2 = new Date(denngay);
            var thang2 = date2.getMonth() + 1;
            var ngay2 = date2.getDate();
            var nam2 = date2.getFullYear();
            var denngay_format = nam2 + "-" + thang2 + "-" + ngay2;
            id_pb = [];
            srt_pb = [];
            chuaduyet = [];
            daduyet = [];
            dadong = [];
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ReportDSPhongBan",
                data: {
                    "id_phongban": Number($("#hidden_idphongban").val()),
                    "tungay": tungay_format,
                    "denngay": denngay_format
                    
                },
                dataType: "json",

                success: function (data) {
                    if (data.length > 0) {
                        console.log(data);
                      
                        for (var i = 0; i < data.length;i++)
                        {
                            
                            srt_pb.push(data[i]["Ten_Phong_Ban"]);
                            id_pb.push(data[i]["ID_PhongBan"]);
                            chuaduyet.push(0);
                            daduyet.push(0);
                            dadong.push(0);
                            
                        }
                    
                    }



                },

            })
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error lay so phieu nhap kho : " + errorThrown);
         });

            //duyet cac phan tu trong mang pb
            for (var i = 0; i < id_pb.length; i++)
            {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/BaoCaoSoLuongPOTheoThangTheoDonVi",
                    data: {
                        "id_phongban": Number(id_pb[i]),
                        "tungay": tungay_format,
                        "denngay": denngay_format
                    },
                    dataType: "json",
                    success: function (data2) {

                        for (var y = 0; y < data2.length; y++) {
                            if (data2[y]["TinhTrang"] == 2) {
                                chuaduyet[i] = data2[y]["dem"];
                            }
                            else if (data2[y]["TinhTrang"] == 3) {
                                daduyet[i] = data2[y]["dem"];
                            }
                            else if (data2[y]["TinhTrang"] == 4) {
                                dadong[i] = data2[y]["dem"];

                            }
                        }

                    },

                })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error lấy phiếu nhập kho : " + errorThrown);
          });
            }
          
        }
        function Btt_DongY()
        {
            LoadPhongBan();
            
            
            var options = {
                chart: {
                    height: 430,
                    type: 'bar',
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        dataLabels: {
                            position: 'top',
                        },
                    }
                },
                dataLabels: {
                    enabled: true,
                    offsetX: -6,
                    style: {
                        fontSize: '12px',
                        colors: ['#000000']
                    }
                },
                stroke: {
                    show: true,
                    width: 1,
                    colors: ['#fff']
                },
                series: [{
                    name: "Chưa duyệt", data: chuaduyet
                }, {
                    name: "Đã duyệt", data: daduyet
                }, {
                    name: "Đã đóng", data: dadong
                }
                ],
                xaxis: {

                    //categories: ["Bình Dương", "Đức Hòa", "Tân Đô", "MATA"],
                    categories: srt_pb,
                },

            }
            var chart = new ApexCharts(
                document.querySelector("#chart"),
                options
            );

            chart.render();
        
            //
            ShowChuaDuyet();
           // ShowDaDuyet();
           // ShowDaDong();
        }
        function ShowChuaDuyet()
        {
            var soluongdata = 0;
            var dt_pr;
            $(".panel-default").remove();
            var ds_pr_luutam = document.getElementById('accordion_chuaduyet');
          
            var sl_luutam = 0;
            var str_dt = "";
        
            soluongdata = chuaduyet.length;
            for (var i = 0; i < soluongdata; i++) {
                sl_luutam += chuaduyet[i];
                str_dt = str_dt + '<div class="panel panel-primary">';
                str_dt = str_dt + '<div class="panel-heading">';
                str_dt = str_dt + '<h4 class="panel-title">';
                str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_chuaduyet' + i + '" href="#collapse_chuaduyet' + i + '">' + srt_pb[i] + '<span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;">' + chuaduyet[i] + '</span></a>';
                str_dt = str_dt + '</h4>';
                str_dt = str_dt + '</div>';
                str_dt = str_dt + '<div id="collapse_chuaduyet' + i + '" class="panel-collapse in">';
                str_dt = str_dt + '<div class="panel-body">';
                str_dt = str_dt + '<div>';
                str_dt = str_dt + '<table id="ChuaDuyetTable' + i + '" class="display" width="100%">';
                str_dt = str_dt + '<thead>';
                str_dt = str_dt + '<tr>';
                str_dt = str_dt + '<th>Số PO</th>';
                str_dt = str_dt + '<th>Ngày PO</th>';
                str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                str_dt = str_dt + '<th>Nhà cung cấp</th>';
                str_dt = str_dt + '<th>Kho nhận</th>';
            
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

            LayDataPOChuaDuyet(chuaduyet);
        }
        function LayDataPOChuaDuyet(chuaduyet) {

            for (var s = 0; s < chuaduyet.length; s++) {
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
                        "id_phongban": id_pb[s],
                        "nhacungcap": "",
                        "songaytre": 0,
                        "manhacuangcap": "",
                        "khonhan": "",
                        "tinhtrang": 2
                    },
                    dataType: "json",
                    success: function (data) {
                        var tble = document.getElementById("ChuaDuyetTable" + s);
                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(data[i]["Ngay_PO"]);
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
                                    str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td></tr>';
                                }
                                else {
                                    str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["Ten_NguoiMuaHang"] + '</td><td>' + data[i]["Ten_Nha_Cung_Cap"] + '</td><td>' + data[i]["Kho_Nhan"] + '</td></tr>';
                                }


                            }

                            $("#ChuaDuyetTable" + s + " tbody").append(str_tr);

                            $("#ChuaDuyetTable" + s).dataTable();
                        }
                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }

        }

        function ShowDaDuyet()
        {
            var ds_pr_luutam = document.getElementById('accordion_daduyet');
            var sl_luutam = 0;
            var str_dt = "";
          
            soluongdata = daduyet.length;
            for (var i = 0; i < soluongdata; i++) {
                sl_luutam += daduyet[i];
                str_dt = str_dt + '<div class="panel panel-default">';
                str_dt = str_dt + '<div class="panel-heading">';
                str_dt = str_dt + '<h4 class="panel-title">';
                str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_daduyet' + i + '" href="#collapse_daduyet' + i + '">' + srt_pb[i] + '<span class="badge" id="soluongpr_daduyet_pb' + i + ' " style="margin-left: 6px;">' + daduyet[i] + '</span></a>';
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

            LayDataPRDaDuyet(daduyet);
        }
        function LayDataPRDaDuyet(daduyet) {

            for (var s = 0; s < daduyet.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": id_pb[s],
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
                                    { 'data': 'Ten_Nguoi_De_Xuat' },
                                     { 'data': 'Ghi_Chu' },
                                     {
                                         'data': 'PR_Scan_File', 'render': function (data, type, row, meta) {
                                             if (type === 'display') {
                                                 data = '<a href="/upload/' + data + '" target="_blank">' + data + '</a>';
                                             }

                                             return data;
                                         }
                                     }

                                ],

                                "deferRender": true,
                                "order": [],
                                "iDisplayLength":-1
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
                                   

                                ],

                                "deferRender": true,
                                "order": [],
                                "iDisplayLength": -1
                            });
                        }


                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }

        }

        function ShowDaDong()
        {
            var ds_pr_luutam = document.getElementById('accordion_dadong');
            var sl_luutam = 0;
            var str_dt = "";
            
            soluongdata = dadong.length;
            for (var i = 0; i < soluongdata; i++) {
                sl_luutam += dadong[i];
                str_dt = str_dt + '<div class="panel panel-default">';
                str_dt = str_dt + '<div class="panel-heading">';
                str_dt = str_dt + '<h4 class="panel-title">';
                str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_dadong' + i + '" href="#collapse_dadong' + i + '">' + srt_pb[i] + '<span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;">' + dadong[i] + '</span></a>';
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
            LayDataPRDaDong(dadong);
        }
        function LayDataPRDaDong(dadong) {

            for (var s = 0; s < dadong.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR",
                    data: {
                        "action": 1,
                        "id": 0,
                        "id_phongban": id_pb[s],
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
                                    str_tr += '<tr role="row" class="odd"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td></tr>';
                                }
                                else {
                                    str_tr += '<tr role="row" class="even"><td>' + data[i]["So_PR_Full"] + '</td><td>' + Number(data[i]["Tong_Tien"]).toLocaleString('de-DE') + '</td><td>' + Number(data[i]["Tong_So_Luong_Yeu_cau"]).toLocaleString('de-DE') + '</td><td>' + data[i]["Cong_Dung"] + '</td><td>' + ngaytao + '</td><td>' + data[i]["Ten_Nguoi_De_Xuat"] + '</td><td>' + data[i]["Ghi_Chu"] + '</td></tr>';

                                }


                            }

                            $("#DaDongTable" + s + " tbody").append(str_tr);

                            $("#DaDongTable" + s).dataTable({
                                "order": [],
                                "iDisplayLength": -1

                            });
                        }
                    }

                })

                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            }

        }
    </script>
</asp:Content>
