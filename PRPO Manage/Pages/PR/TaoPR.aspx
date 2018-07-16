<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.TaoPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-group col-md-12">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Thêm vật tư</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="InForm()">In</button>
        <button type="button" class="btn btn-info btn-sm" onclick="LuuPR()">Lưu</button>
        <button type="button" class="btn btn-success btn-sm" >Chuyển</button>
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
                        <input type="hidden" id="ID_bophandexuat"/>
                        <input type="hidden" id="ID_nguoidexuat"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sopr">Số PR</label>
                        <input type="text" class="form-control" id="sopr" readonly/>
                        <input type="hidden" id="namdexuat"/>
                        <input type="hidden" id="sothutupr"/>
                         <input type="hidden" id="id_pr"/>
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
                                                    <input type="text" class="form-control" id="dongiatamtinh" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tigia">Tỉ giá:</label>
                                                    <input type="number" class="form-control" id="tigia" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="thanhtientamung">Thành tiền tạm ứng:</label>
                                                    <input type="text" class="form-control" id="thanhtientamung" />
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
                    //document.getElementById("bophandexuat").innerText = data["Phong_Ban"];
                    //document.getElementById("bophandexuat").value = data["Phong_Ban"];
                   // $("#bophandexuat").text(data["Phong_Ban"]);
                    $("#bophandexuat").val(data["Phong_Ban"]);
                    //$("#ID_bophandexuat").val(data["ID_PhongBan"]);
                    
                    document.getElementById("ID_bophandexuat").value = data["ID_Phong_Ban"];
                    document.getElementById("ID_nguoidexuat").value = data["ID_NguoiDung"];
                    
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
            $('#dongiatamtinh').mask("000.000.000.000.000,00", { reverse: false });
            $('#thanhtientamung').mask('000.000.000.000.000,00');
            

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
            $("#thanhtientamung").val($("#dongiatamtinh").cleanVal() * $("#soluongyeucau").val() * $("#tigia").val());
            

        });
        //$("#dongiatamtinh").change(function () {
        //    $("#thanhtientamung").val($("#dongiatamtinh").val() * $("#soluongyeucau").val() * $("#tigia").val());
        

        //});
        $("#soluongyeucau").change(function () {
            $("#thanhtientamung").val($("#dongiatamtinh").cleanVal() * $("#soluongyeucau").val() * $("#tigia").val());
            

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
                    data: { "phongban": $("#ID_bophandexuat").val(), nam: (new Date()).getFullYear() },
                    dataType: "json",
                    
                    success: function (data) {
                        var sopr;
                        $("#sothutupr").val(data["So_PR"]);
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
                        $("#namdexuat").val(data["Nam"]);
                        $("#sopr").val(sopr + "-" + data["Phong_Ban"] + "-" + year);
                        
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
            var thangtao = date.getMonth();
            var nguoidexuat= $("#ID_nguoidexuat").val();
            
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ActionPR",
                data: {
                    "action": 2,
                    "id": 0,
                    "id_phongban": Number($("#ID_bophandexuat").val()),
                    "sopr": Number($("#sothutupr").val()),
                    "nam": Number($("#namdexuat").val()),
                    "congdung": $("#congdung").val(),
                    "ngaytao": $("#ngaydexuat").val(),
                    "thangtao": Number(thangtao),
                    "tongsoluongyeucau": Number($("#tongsoluong").html()),
                    "tongtien": Number($("#tongtien").html()),
                    "ghichu": $("#ghichu").val(),
                    "ngayduyet": $("#ngaydexuat").val(),
                    "id_nguoiduyet": 0,
                    "id_nguoidexuat": Number(nguoidexuat),
                    "tinhtrang": 1,
                    "prscanfile": "",
                    "sendmail": false,
                },
                dataType: "json",
                success: function (data) {
                  alert("PR đã được tạo thành công.")
                },

            })
         .done(LayThongTinPR())
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
        //*******************//
        //Lay thong tin PR vua tao
        function LayThongTinPR() {
            
            var date = new Date($("#ngaydexuat").val());
            var thangtao = date.getMonth();
            var nguoidexuat = $("#ID_nguoidexuat").val();

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/ActionPR",
                data: {
                    "action": 1,
                    "id": 0,
                    "id_phongban": Number($("#ID_bophandexuat").val()),
                    "sopr": Number($("#sothutupr").val()),
                    "nam": Number($("#namdexuat").val()),
                    "congdung": $("#congdung").val(),
                    "ngaytao": $("#ngaydexuat").val(),
                    "thangtao": Number(thangtao),
                    "tongsoluongyeucau": Number($("#tongsoluong").html()),
                    "tongtien": Number($("#tongtien").html()),
                    "ghichu": $("#ghichu").val(),
                    "ngayduyet": $("#ngaydexuat").val(),
                    "id_nguoiduyet": 0,
                    "id_nguoidexuat": Number(nguoidexuat),
                    "tinhtrang": 1,
                    "prscanfile": "",
                    "sendmail": false,
                },
                dataType: "json",
                success: function (data) {
                    
                    document.getElementById("id_pr").value = data["ID"];
                },

            })
         .done(TaoPRChiTiet())
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
        //*********************//
        // Xu ly PR chi tiet //
        function TaoPRChiTiet()
        {
            var table = $("#table_vattu");
          
            table.find('tbody > tr').each(function () {
                var $tds = $(this).find('td');
                var mavt = $tds.eq(3).html();
                var tenvt = $tds.eq(4).html();
                var dvt = $tds.eq(5).html();
                var tonkho = $tds.eq(6).html();
                var slyc = $tds.eq(7).html();
                var dgtt = $tds.eq(8).html();
                var tgia = $tds.eq(9).html();
                var thanhtientu = $tds.eq(10).html();
                var nccvt = $tds.eq(11).html();
                var tinhtrangvt = $tds.eq(12).html();
                var ngaych = $tds.eq(13).html();
                var thoigiansd = $tds.eq(14).html();
                var congdungchitiet = $tds.eq(15).html();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/ActionPR_ChiTiet",
                    data: {
                        "action": 2,
                        "id": 0,
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
                        "congdung": congdungchitiet
                       
                    },
                    dataType: "json",
                    success: function (data) {
                        alert("PR chi tiết đã được tạo thành công.")
                    },

                })
                  .done(TaoPRChiTiet())
                  .fail(function (jqXHR, textStatus, errorThrown) {
                      alert("error" + errorThrown);
                  });
            });
        }
        //******************//
        function InForm() {
            //Get the HTML of div
            //var divElements = document.getElementById("container").innerHTML;
            //var printWindow = window.open('', '', 'height=400,width=800');
            //printWindow.document.write('<html><head><title></title>');
            //printWindow.document.write('<link rel="stylesheet" href="/Content/bootstrap.min.css" type="text/css"/>');
            //printWindow.document.write('</head><body >');
            //printWindow.document.write(divElements);
            //printWindow.document.write('</body></html>');
            //printWindow.document.close();
            //printWindow.print();
            window.print();

          
        }
    
    </script>
</asp:Content>
