<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BaoCaoSoLuongPR.aspx.cs" Inherits="PRPO_Manage.Pages.BaoCao.BaoCaoSoLuongPR" %>
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
                    <p class="text-center font-weight-bold">SỐ LƯỢNG PR THEO THÁNG, THEO ĐƠN VỊ</p>
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
                        <option>MATA</option>
                        <option>Bình Dương</option>
                        <option>Tân Đô</option>
                        
                    </select>
                 
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
    </div>
   
    <script type="text/javascript">
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

        function Btt_DongY()
        {
            var ss=[44, 55, 41, 64];
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
                        colors: ['#fff']
                    }
                },
                stroke: {
                    show: true,
                    width: 1,
                    colors: ['#fff']
                },
                series: [{
                    name: "Đã đóng", data: ss
                }, {
                    name: "Đã duyệt", data: [53, 32, 33, 52]
                }, {
                    name: "Chưa duyệt", data: [22, 33, 5, 6]
                }
                ],
                xaxis: {
                    categories: ["Bình Dương", "Đức Hòa", "Tân Đô", "MATA"],
                },

            }

            var chart = new ApexCharts(
                 document.querySelector("#chart"),
                 options
             );

            chart.render();
        }
        
    </script>
</asp:Content>
