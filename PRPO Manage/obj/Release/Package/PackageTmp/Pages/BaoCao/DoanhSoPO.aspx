<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoanhSoPO.aspx.cs" Inherits="PRPO_Manage.Pages.BaoCao.DonhSoPO" %>
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
                    <p class="text-center font-weight-bold">DOANH SỐ PO THEO THÁNG, THEO ĐƠN VỊ</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="tuthang">Từ ngày</label>
                   <div class="form-group">
                                                    <div class='input-group date' id='tuthang'>
                                                        <input type='text' class="form-control" />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>
                </div>
                <div class="form-group col-md-4">
                    <label for="tunam">Đến ngày</label>
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
            <div id="chuaduyet" class="tab-pane fade in active">
           
            </div>
            
    
         </div>
    </div>
    <script type="text/javascript">
        var srt_pb = [], id_pb = [], doanhso = [];
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
        function LoadPhongBan() {
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
         
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ReportDanhSachPhongBan_DoanhSo",
                data: {
                    "id_phongban": Number($("#hidden_idphongban").val()),
                    "tungay": tungay_format,
                    "denngay": denngay_format

                },
                dataType: "json",

                success: function (data) {
                    if (data.length > 0) {
                        console.log(data);

                        for (var i = 0; i < data.length; i++) {

                            srt_pb.push(data[i]["Ten_Phong_Ban"]);
                            id_pb.push(data[i]["ID_PhongBan"]);
                           

                        }

                    }



                },

            })
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error lay so phieu nhap kho : " + errorThrown);
         });
            doanhso=[];
            //duyet cac phan tu trong mang pb
            for (var i = 0; i < id_pb.length; i++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/BaoCaoDoanhSoPOTheoThangTheoDonVi",
                    data: {
                        "id_phongban": Number(id_pb[i]),
                        "tungay": tungay_format,
                        "denngay": denngay_format
                    },
                    dataType: "json",
                    success: function (data2) {

                        for (var y = 0; y < data2.length; y++) {
                            doanhso[i] = data2[y]["doanhso"];
                        }

                    },

                })
          .fail(function (jqXHR, textStatus, errorThrown) {
              alert("error lấy phiếu nhập kho : " + errorThrown);
          });
            }

        }
        function Btt_DongY() {
            LoadPhongBan();
            var colors = ['#008FFB', '#00E396', '#FEB019', '#FF4560'];
            var options = {
                chart: {
                    height: 380,
                    type: 'bar',
                    events: {
                        click: function (chart, w, e) {
                            console.log(chart, w, e)
                        }
                    },
                },
                colors: colors,
                plotOptions: {
                    bar: {
                        columnWidth: '45%',
                        distributed: true
                    }
                },
                dataLabels: {
                    enabled: false,
                },
                series: [{
                    data: doanhso
                }],
                xaxis: {
                    categories: srt_pb,
                    labels: {
                        style: {
                            colors: colors,
                            fontSize: '14px'
                        }
                    }
                }
            }

            var chart = new ApexCharts(
                document.querySelector("#chart"),
                options
            );

            chart.render();
            HienThiTable();
        }
        function HienThiTable()
        {
            var sl_luutam = 0;
            var str_dt = "";
            $(".panel-primary").remove();
            var ds_pr_luutam = document.getElementById('chuaduyet');
            for (var i = 0; i < srt_pb.length; i++) {
                sl_luutam += doanhso[i];
                str_dt = str_dt + '<div class="panel panel-primary">';
                str_dt = str_dt + '<div class="panel-heading">';
                str_dt = str_dt + '<h4 class="panel-title">';
                str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_chuaduyet' + i + '" href="#collapse_chuaduyet' + i + '">' + srt_pb[i] + '<span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;">' + Number(doanhso[i]).toLocaleString('de-DE') + '</span></a>';
                str_dt = str_dt + '</h4>';
                str_dt = str_dt + '</div>';
                str_dt = str_dt + '<div id="collapse_chuaduyet' + i + '" class="panel-collapse in">';
                str_dt = str_dt + '<div class="panel-body">';
                str_dt = str_dt + '<div>';
                str_dt = str_dt + '<table id="DaDongTable' + i + '" class="display" width="100%">';
                str_dt = str_dt + '<thead>';
                str_dt = str_dt + '<tr>';
                str_dt = str_dt + '<th>Số PO</th>';
                str_dt = str_dt + '<th>Ngày PO</th>';
                str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                str_dt = str_dt + '<th>Nhà cung cấp</th>';
                str_dt = str_dt + '<th>Kho nhận</th>';
                str_dt = str_dt + '<th>Doanh số</th>';
                str_dt = str_dt + '</tr>';
                str_dt = str_dt + '</thead><tbody>';
                str_dt = str_dt + '</tbody></table>';
                str_dt = str_dt + '</div>';
                str_dt = str_dt + '</div>';
                str_dt = str_dt + '</div>';
                str_dt = str_dt + '</div>';

               
            }
            ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);
            LayDataPODaDong(id_pb);
        }
        function LayDataPODaDong(pb) {

            for (var s = 0; s < pb.length; s++) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/BaoCaoDoanhSoPODetail",
                    data: {
                        "id_phongban": pb[s],
                    },
                    dataType: "json",
                    success: function (data) {
                        var table = document.getElementById("DaDongTable" + s);

                        if (data.length > 0) {
                            var str_tr = "";
                            for (var i = 0; i < data.length; i++) {

                                var date = new Date(data[i]["NgayPO"]);
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
                                    str_tr += '<tr role="row" class="odd"><td>' + data[i]["SoPO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["TenHienThi"] + '</td><td>' + data[i]["NhaCungCap"] + '</td><td>' + data[i]["KhoNhan"] + '</td><td>' + Number(data[i]["TongTien"]).toLocaleString('de-DE') + '</td></tr>';
                                }
                                else {
                                    str_tr += '<tr role="row" class="even"><td>' + data[i]["SoPO_Full"] + '</td><td>' + ngaypo + '</td><td>' + data[i]["TenHienThi"] + '</td><td>' + data[i]["NhaCungCap"] + '</td><td>' + data[i]["KhoNhan"] + '</td><td>' + Number(data[i]["TongTien"]).toLocaleString('de-DE') + '</td></tr>';
                                }


                            }

                            $("#DaDongTable" + s + " tbody").append(str_tr);

                            $("#DaDongTable" + s).dataTable();
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
