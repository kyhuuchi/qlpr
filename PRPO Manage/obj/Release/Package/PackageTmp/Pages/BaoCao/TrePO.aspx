<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrePO.aspx.cs" Inherits="PRPO_Manage.Pages.BaoCao.TrePO" %>
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
                    <p class="text-center font-weight-bold">BÁO CÁO TRỄ PO</p>
                </h3>
            </div>
        </div>
         <div class="row">
              <div class="form-row">
                <div class="form-group col-md-4">
                   <%-- <label for="tuthang">Từ ngày</label>
                   <div class="form-group">
                                                    <div class='input-group date' id='tuthang'>
                                                        <input type='text' class="form-control" />
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                        </span>
                                                    </div>
                                                </div>--%>
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
                 <%--   <label for="donvi">Đơn vị</label>
                    <select class="form-control" id="donvi" style="width: 100%;">
                        <option value="0">Tất cả</option>
                        <option value="1">MATA</option>
                        <option value="2">Bình Dương</option>
                        <option value="3">Tân Đô</option>
                        <option value="5">Đức Hòa</option>
                        
                    </select>
                    <input type="hidden" id="hidden_idphongban" value="0" />
                     <input type="hidden" id="hidden_danhsach" />--%>
                </div>
                
            </div>
         </div>
          <div class="row">
              <div class="form-group col-md-12" style="text-align:center">
                    <button type="button" class="btn btn-primary" onclick="Btt_DongY()">Đồng ý</button>
                </div>
         </div> 
           <div class="row">
               <div class="tab-content" style="margin-top: 5px;">
        
                <div id="prtre" class="tab-pane fade in active">
                    <div class="panel-group" id="accordion_prtre">
              
                    </div>
                </div>
             
            </div>
           </div>
     </div>
     <script type="text/javascript">
         var srt_pb = [], dadong = [], daduyet = [], chuaduyet = [], id_pb = [];
         $(document).ready(function () {
             //$('#tuthang').datepicker({
             //    format: 'dd/mm/yyyy',
             //    todayHighlight: true
             //});
             $('#tunam').datepicker({
                 format: 'dd/mm/yyyy',
                 todayHighlight: true
             });

         });
         $("#donvi").change(function () {
             $("#hidden_idphongban").val($("#donvi").val());
         })
         function LoadPhongBan() {
             //var tungay = $("#tuthang").datepicker("getDate");
             var denngay = $("#tunam").datepicker("getDate");
             //if (tungay == "") {
             //    alert("Vui lòng chọn từ ngày.");
             //    $("#tuthang").css("border-color", "red");
             //    return;
             //}
             if (denngay == "") {
                 alert("Vui lòng chọn đến ngày.");
                 $("#tunam").css("border-color", "red");
                 return;
             }
             //var date = new Date(tungay);
             //var thang = date.getMonth() + 1;
             //var ngay = date.getDate();
             //var nam = date.getFullYear();
             //var tungay_format = nam + "-" + thang + "-" + ngay;

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
                 url: "/Webservice/dsnguoidung.asmx/BaoCaoTrePO",
                 data: {
                     "id_phongban": 0,
                     "denngay": denngay_format

                 },
                 dataType: "json",

                 success: function (data) {
                     if (data.length > 0) {
                        // console.log(data);
                         var soluongdata = 0;
                         var dt_pr;
                         $(".panel-default").remove();
                         var ds_pr_luutam = document.getElementById('accordion_prtre');

                         var sl_luutam = 0;
                         var str_dt = "";

                         soluongdata = data.length;

                         str_dt = str_dt + '<div class="panel panel-default">';
                         str_dt = str_dt + '<div class="panel-heading">';
                         str_dt = str_dt + '<h4 class="panel-title">';
                         str_dt = str_dt + '<a data-toggle="collapse" data-parent="#accordion_chuaduyet' + i + '" href="#collapse_chuaduyet' + i + '"><span class="badge" id="soluongpr_chuaduyet_pb' + i + ' " style="margin-left: 6px;"></span></a>';
                         str_dt = str_dt + '</h4>';
                         str_dt = str_dt + '</div>';
                         str_dt = str_dt + '<div id="collapse_chuaduyet' + i + '" class="panel-collapse in">';
                         str_dt = str_dt + '<div class="panel-body">';
                         str_dt = str_dt + '<div>';
                         str_dt = str_dt + '<table id="ChuaDuyetTable" class="display" width="100%">';
                         str_dt = str_dt + '<thead>';
                         str_dt = str_dt + '<tr>';
                         str_dt = str_dt + '<th>Số PO</th>';
                         str_dt = str_dt + '<th>Mã hàng</th>';
                         str_dt = str_dt + '<th>Tên hàng</th>';
                         str_dt = str_dt + '<th>Người phụ trách mua hàng</th>';
                         str_dt = str_dt + '<th>Số lượng PO</th>';
                         str_dt = str_dt + '<th>Ngày đáp ứng</th>';
                         str_dt = str_dt + '</tr>';
                         str_dt = str_dt + '</thead><tbody>';
                         str_dt = str_dt + '</tbody></table>';
                         str_dt = str_dt + '</div>';
                         str_dt = str_dt + '</div>';
                         str_dt = str_dt + '</div>';
                         str_dt = str_dt + '</div>';
                         ds_pr_luutam.insertAdjacentHTML('afterend', str_dt);
                         for (var i = 0; i < soluongdata; i++) {
                            
                             ////xu ly ngay duyet
                             //var date = new Date(data[i]["NgayDuyet"]);
                             //var month = date.getMonth() + 1;
                             //var ngay = date.getDate();
                             //if (month < 10) {
                             //    month = "0" + month;
                             //}
                             //if (ngay < 10) {
                             //    ngay = "0" + ngay;
                             //}
                             //var ngayduyet = ngay + "/" + month + "/" + date.getFullYear();
                             //xu ly ngay dap ung
                             var date2 = new Date(data[i]["NgayMuaHang"]);
                             var month2 = date2.getMonth() + 1;
                             var ngay2 = date2.getDate();
                             if (month2 < 10) {
                                 month2 = "0" + month2;
                             }
                             if (ngay2 < 10) {
                                 ngay2 = "0" + ngay2;
                             }
                             var ngaydapunghang = ngay2 + "/" + month2 + "/" + date2.getFullYear();
                             var str_tr;
                             if (i % 2 == 0) {
                                 str_tr += '<tr role="row" class="odd"><td>' + data[i]["SoPO_Full"] + '</td><td>' + data[i]["MaHang"] + '</td><td>' + data[i]["TenHang"] + '</td><td>' + data[i]["NguoiPTMuaHang"] + '</td><td>' + data[i]["SoLuongPO"] + '</td><td>' + ngaydapunghang + '</td></tr>';
                             }
                             else {  
                                 str_tr += '<tr role="row" class="even"><td>' + data[i]["SoPO_Full"] + '</td><td>' + data[i]["MaHang"] + '</td><td>' + data[i]["TenHang"] + '</td><td>' + data[i]["NguoiPTMuaHang"] + '</td><td>' + data[i]["SoLuongPO"] + '</td><td>' + ngaydapunghang + '</td></tr>';
                             }


                         }

                         $("#ChuaDuyetTable tbody").append(str_tr);

                         $("#ChuaDuyetTable").dataTable();

                
                         

                

                     }



                 },

             })
              .fail(function (jqXHR, textStatus, errorThrown) {
                  alert("error lay so phieu nhap kho : " + errorThrown);
              });

           

         }
         function Btt_DongY() {
             LoadPhongBan();

         }
      </script>
</asp:Content>
