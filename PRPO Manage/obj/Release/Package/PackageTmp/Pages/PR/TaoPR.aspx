<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.TaoPR" %>
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
        <button type="button" class="btn btn-success btn-sm" onclick="ChuyenTrangThai()">Chuyển</button>
    </div>
        </div>
    </div>
    <script type="text/javascript">
        var dsdata;
        var currentRow = null;
        $("#overlay").show();
        
       

        $("#bophandexuat").val($("#ten_bophan").val());
        document.getElementById("ID_bophandexuat").value = $("#id_bophan").val(); 
        document.getElementById("ID_nguoidexuat").value = $("#id_user").val();

        $(document).ready(function () {
          
            LaySoPR();

            //khai bao mau data cho dropdown list chon vat tu
            var item_dta = { id: 0, text: "" };

            $("#select_mavattu").select2({
                placeholder: "Chọn thông tin vật tư",
                minimumInputLength: 3,
                allowClear: true
                
            });
            //$('#dongiatamtinh').mask("000.000.000.000.000", { reverse: false });
            //$('#thanhtientamung').mask('000.000.000.000.000', { reverse: true });
            
            

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
            var markup = "";
            if (currentRow) {
                var $tds = currentRow.find('td');
                stt= $tds.eq(2).text();

                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamung_nomask + "'/></td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
                $("#table_vattu tbody").find($(currentRow)).replaceWith(markup);
                currentRow = null;
            }
            else {
                markup = "<tr><td><span class='editrow'><a class='glyphicon glyphicon-pencil' href='javascript: void(0);'></a></span></td><td><span class='deleterow'><a class='glyphicon glyphicon-trash' href=''></a></span></td><td>" + stt + "</td><td class='cls_mavattu'>" + mavattu + "</td><td class='cls_tenvattu'>" + tenvattu + "</td><td class='cls_dvt'>" + dvt + "</td><td class='cls_tonkho'>" + tonkho + "</td><td class='cls_soluongyeucau'>" + soluongyeucau + "</td><td class='cls_dongiatamtinh'>" + dongiatamtinh + "<input type='hidden' id='dongiatamtinh*" + stt + "' value='" + dongiatamtinh_nomask + "'/><input type='hidden' id='leadtime*" + stt + "' value='" + leadtime + "'/></td><td class='cls_tigia'>" + tigia + "</td><td class='cls_thanhtientamung'>" + thanhtientamung + "<input type='hidden' id='thanhtientamung*" + stt + "' value='" + thanhtientamung_nomask + "'/></td><td class='cls_nhacungung'>" + nhacungung + "</td><td class='cls_tinhtrangvattu'>" + tinhtrangvattu + "</td><td class='cls_ngaycanhang'>" + ngaycanhang + "</td><td class='cls_thoigiansudung'>" + thoigiansudung + "</td><td class='cls_congdungchitiet'>" + congdungchitiet + "</td></tr>";
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
            $("#nhacungung").val("");
            $("#tinhtrangvattu").val("");
            $("#ngaycanhang").val("");
            $("#thoigiansudung").val("");
            $("#congdungchitiet").val(""); 
            $("#leadtime").val("");
            
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
                $("#overlay").hide();
        });
      
        //Xu ly khi ti gia, don gia tam ung va so luong yeu cau thay doi thi tinh lai gia tien tam ung
        $("#tigia").change(function () {
            
            TinhKhiThayDoiTiGiaVaSoLuong();
        });
        //$("#dongiatamtinh").change(function () {
        //    $("#thanhtientamung").val($("#dongiatamtinh").val() * $("#soluongyeucau").val() * $("#tigia").val());
        

        //});
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
                var gd = 0;
                $tds.find("input[id^='thanhtientamung*']").each(function () {
                    //alert(this.id)
                    gd = this.value;

                });
                var tt = gd;
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
            var thangtao = date.getMonth()+1;
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
                    "id_nguoidexuat": Number(nguoidexuat),
                    "tinhtrang": 1,
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
                  alert("PR đã được tạo thành công.")
                },

            })
         .done(CapNhatSoPR())
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
        //*******************//
        //Cap nhap so PR trong table So_PR
        function CapNhatSoPR() {
           

            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/Action_SoPR",
                data: {
                    "action": 2,
                    "id": 1,
                    "idphongban": Number($("#ID_bophandexuat").val()),
                    "sopr": Number($("#sothutupr").val()),
                    "nam": Number($("#namdexuat").val()),
                   
                },
                dataType: "json",
                success: function (data) {
                    alert("So PR đã được cập nhật.")
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
            var thangtao = date.getMonth()+1;
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
                    "id_nguoidexuat": Number(nguoidexuat),
                    "tinhtrang": 1,
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
                    console.log(data);
                    document.getElementById("id_pr").value = data[0]["ID_PR"];
                    
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
            var stt = 1;
            var table = $("#table_vattu");
            var rowCount = $('#table_vattu >tbody >tr').length;
            table.find('tbody > tr').each(function () {
                
                var $tds = $(this).find('td');
                var mavt = $tds.eq(3).html();
               
                var tenvt =$tds.eq(4).html();
                
                var dvt = $tds.eq(5).html();
                var tonkho = $tds.eq(6).html();
                var slyc = $tds.eq(7).html();
                var gd = 0;
                var leadtime = 0;
                $tds.find("input[id^='dongiatamtinh*']").each(function () {
                    //alert(this.id)
                    gd = this.value;

                });
                $tds.find("input[id^='leadtime*']").each(function () {
                    //alert(this.id)
                    leadtime = this.value;

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
                        "congdung": congdungchitiet,
                        "leadtime": leadtime
                       
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
        function ChuyenTrangThai() {
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
                    "id": Number($("#id_pr").val()),
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
         .fail(function (jqXHR, textStatus, errorThrown) {
             alert("error" + errorThrown);
         });
        }
      

    </script>
</asp:Content>
