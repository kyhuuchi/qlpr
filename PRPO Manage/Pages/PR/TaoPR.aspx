﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.TaoPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-group col-md-12">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Thêm vật tư</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="InForm()">In</button>
    </div>

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
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sopr">Số PR</label>
                        <input type="text" class="form-control" id="sopr" readonly/>
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
                                                    <input type="number" class="form-control" id="dongiatamtinh" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tigia">Tỉ giá:</label>
                                                    <input type="number" class="form-control" id="tigia" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanhtientamung">Thành tiền tạm ứng:</label>
                                                    <input type="number" class="form-control" id="thanhtientamung" />
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
                                            <td></td>
                                            <td></td>
                                            <td style="font-weight:bold" id="tongtien">0</td>
                                            <td></td>
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
                    <div class="form-group col-md-6">
                        <label for="ghichu">Ghi chú</label>
                        <input type="text" class="form-control" id="ghichu" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="tongcongdong">Tổng cộng (đồng)</label>
                        <input type="text" class="form-control" id="tongcongdong">
                    </div>

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
                              <%--  <button type="button" class="btn btn-danger btn-sm" id="xoavattu">Xóa vật tư</button>--%>
                                
                            </div>
                        </div>
                    </div>
                </div>\
        </div>
    </div>
    <script type="text/javascript">
        var dsdata;
        var currentRow = null;
        $(document).ready(function () {
            //lay thong tin phong ban cua account dang truy cap
            $.ajax({
                type: "POST",
                async:false,
                url: "/Webservice/dsnguoidung.asmx/LayThongTinNguoiDung",
                data: {"tendangnhap": $("#LoginName1").text() },
                dataType: "json",
                success: function (data) {
                    $("#bophandexuat").val(data["Phong_Ban"]);
                },
                
            })
            .done(LaySoPR())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error" + errorThrown);
            });
      
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
                var i = jsObj.find(function (obj) { return obj.matnr === mavatu; });
                //console.log(i);
                $("#dvt").val(i.meins);
            }
         
            var stt = 0;
            $("#DongY").click(function () {
                
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
            var tigia = $("#tigia").val();
            var thanhtientamung = $("#thanhtientamung").val();
            var nhacungung = $("#nhacungung").val();
            var tinhtrangvattu = $("#tinhtrangvattu").val();
            var ngaycanhang = $("#ngaycanhang").val();
            var thoigiansudung = $("#thoigiansudung").val();
            var congdungchitiet = $("#congdungchitiet").val();
          
            var markup = "";
            if (currentRow) {
                var $tds = currentRow.find('td');
                stt= $tds.eq(2).text();

                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "</td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "</td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
                $("#table_vattu tbody").find($(currentRow)).replaceWith(markup);
                currentRow = null;
            }
            else {
                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "</td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "</td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
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
            $("#tigia").val("");
            $("#thanhtientamung").val("");
            $("#nhacungung").val("");
            $("#tinhtrangvattu").val("");
            $("#ngaycanhang").val("");
            $("#thoigiansudung").val("");
            $("#congdungchitiet").val("");
        });
        
        //// Find and remove selected table rows
        //    $("#xoavattu").click(function () {
        //    $("table tbody").find('input[name="record"]').each(function () {
        //    	if($(this).is(":checked")){
        //            $(this).parents("tr").remove();
        //        }
        //    });
        //    });
       
           //Xu ly nut edit vat tu
            $(document).on('click', 'span.editrow', function () {
                $("#myModal").modal('show');
                currentRow = $(this).parents('tr');
                //console.log(currentRow);
                $("#select_mavattu").val($(this).closest('tr').find('td.cls_mavattu').text()).trigger('change.select2');
                $("#mavattu").val($(this).closest('tr').find('td.cls_mavattu').text());
                $("#tenvattu").val($(this).closest('tr').find('td.cls_tenvattu').text());
                $("#dvt").val($(this).closest('tr').find('td.cls_dvt').text());
                $("#tonkho").val($(this).closest('tr').find('td.cls_tonkho').text());
                $("#soluongyeucau").val($(this).closest('tr').find('td.cls_soluongyeucau').text());
                $("#dongiatamtinh").val($(this).closest('tr').find('td.cls_dongiatamtinh').text());
                $("#tigia").val($(this).closest('tr').find('td.cls_tigia').text());
                $("#thanhtientamung").val($(this).closest('tr').find('td.cls_thanhtientamung').text());
                $("#nhacungung").val($(this).closest('tr').find('td.cls_nhacungung').text());
                $("#tinhtrangvattu").val($(this).closest('tr').find('td.cls_tinhtrangvattu').text());
                $("#ngaycanhang").val($(this).closest('tr').find('td.cls_ngaycanhang').text());
                $("#thoigiansudung").val($(this).closest('tr').find('td.cls_thoigiansudung').text());
                $("#congdungchitiet").val($(this).closest('tr').find('td.cls_congdungchitiet').text());
                
            });
            //**********************//

            //Xu ly nut xoa vat tu
                $(document).on('click', 'span.deleterow', function () {
                    $(this).parents('tr').remove();
                    CapNhatSoTT();
                    CapNhatSoLuongVaSoTien();
                    return false;
                });
            //*********************//
            
        //$.ajax({
        //    type: "GET",
        //    dataType: 'json',
        //    //url: "/Webservice/dsnguoidung.asmx/LayDSNguoiDung",
        //    headers: {
        //        'Access-Control-Allow-Origin': '*'
        //    },
        //    contentType: 'text/plain',
        //    url: "http://sap-test3.duytan.local:8000/sap/bc/ywsgpoitems?sap-client=900&MA=710000318",
        //    crossOrigin: true,
        //    success: function (data) {
        //        console.log(data);
        //        //var arr_obj = new Array();
        //        //var obj_data;
        //        //$.each(data, function (i, obj) {
        //        //    obj_data = Object.create(item_dta);
        //        //    obj_data.id = obj.matnr;
        //        //    obj_data.text = String(obj.matnr);
        //        //    arr_obj.push(obj_data);
        //        //});
        //        //dsdata = arr_obj;
        //        //$("#select_mavattu").select2({
        //        //    data: dsdata
        //        //})
        //    }
        //})
        //.fail(function (jqXHR, textStatus, errorThrown) {
        //    alert("error" + errorThrown);
        //});
       
        //$("#select_mavattu").select2({
        //    ajax: {
        //        url: "/Webservice/dsnguoidung.asmx/LayDSNguoiDung",
        //        contentType: "application/json; charset=utf-8",
        //        type: "POST",
        //        dataType: 'json',
        //        quietMillis: 50,
        //        //data: function (params) {
        //        //    return {
        //        //        q: params.term, // search term
        //        //        page: params.page
        //        //    };
        //        //},
        //        data: dsdata,
        //        processResults: function (data, params) {
        //            // parse the results into the format expected by Select2
        //            // since we are using custom formatting functions we do not need to
        //            // alter the remote JSON data, except to indicate that infinite
        //            // scrolling can be used
        //            params.page = params.page || 1;

        //            return {
        //                results: data.items,
        //                pagination: {
        //                    more: (params.page * 30) < data.total_count
        //                }
        //            };
        //        },
        //        //processResults: function (data, params) {
        //        //    var results = [];

        //        //    if (data != null && data.length > 0) {

        //        //        $.each(data, function (item) {

        //        //            results.push({
        //        //                id: item.id
        //        //            });
        //        //        });
        //        //    }
        //        //    return {
        //        //        results: results
        //        //    };
        //        //},
        //        //dropdownParent: $('#myModal'),
        //        //cache: true
        //    }
        //});
            
        });
        
        //Xu ly khi ti gia, don gia tam ung va so luong yeu cau thay doi thi tinh lai gia tien tam ung
        $("#tigia").change(function () {
            $("#thanhtientamung").val($("#dongiatamtinh").val() * $("#soluongyeucau").val() * $("#tigia").val());
            
        });
        $("#dongiatamtinh").change(function () {
            $("#thanhtientamung").val($("#dongiatamtinh").val() * $("#soluongyeucau").val() * $("#tigia").val());

        });
        $("#soluongyeucau").change(function () {
            $("#thanhtientamung").val($("#dongiatamtinh").val() * $("#soluongyeucau").val() * $("#tigia").val());

        });
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
                }
         
            });
                     
        }
        //**********************//

        //Xu ly cap nhat so luong va so tien khi them moi, chinh sua, xoa vat tu
        function CapNhatSoLuongVaSoTien()
        {

            var table = $("#table_vattu");
            var tongsoluong = 0, tongtien = 0;
            table.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');
                //cap nhat tong so luong yeu cau va tong tien
                tongsoluong = Number(tongsoluong) + Number($tds.eq(7).text());
                tongtien = Number(tongtien) + Number($tds.eq(10).text());
                $("#tongsoluong").html(tongsoluong);
                $("#tongtien").html(tongtien);
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
                    data: { "phongban": $("#bophandexuat").val(), nam: (new Date()).getFullYear() },
                    dataType: "json",
                    
                    success: function (data) {
                        var sopr;
                        if (data["So_PR"]<10)
                        {
                            sopr = "00" + data["So_PR"];
                        }
                        else if (data["So_PR"] < 100 && data["So_PR"]>10)
                        {
                            sopr = "0" + data["So_PR"];
                        }
                        else
                        {
                            sopr = data["So_PR"];
                        }
                        var year = data["Nam"].toString().slice(-2);

                        $("#sopr").val(sopr + "-" + data["Phong_Ban"] + "-" + year);
                        
                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lay so PR; " + errorThrown);
               });
            }
           
        }
        //*******************//

        
        function InForm() {
            //Get the HTML of div
            var divElements = document.getElementById("container").innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

          
        }
    
    </script>
</asp:Content>
