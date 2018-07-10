<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPR.aspx.cs" Inherits="PRPO_Manage.Pages.PR.TaoPR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
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
        <form>
               
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
                                            <h4 class="modal-title">Thêm mới vật tư</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="mavattu">Mã vật tư:</label>
                                                    <select class="form-control" id="select_mavattu" runat="server">
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="tenvattu">Tên vật tư:</label>
                                                    <input type="text" class="form-control" id="tenvattu" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="dvt">Đơn vị tính:</label>
                                                    <input type="text" class="form-control" id="dvt" />
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

                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                <input type="button" class="btn btn-primary" id="DongY" data-dismiss="modal" value="Đồng ý" />
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
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
                                    <tbody>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-danger btn-sm">Xóa vật tư</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
    </div>
    <script type="text/javascript">
        var dsdata;
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

            $("#select_mavattu").select2();
        $("#DongY").click(function () {
            var name = $("#tendangnhap").val();
            var email = $("#tenhienthi").val();
            var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + name + "</td><td>" + email + "</td></tr>";
            $("table tbody").append(markup);
            $('#tendangnhap').val('');
            $('#tenhienthi').val('');
        });
        
        // Find and remove selected table rows
        $(".btn btn-danger").click(function () {
            $("table tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
      
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
    
      
        //var newOption = new Option(data.text, data.id, false, false);
        //$('#select_mavattu').append(newOption).trigger('change');

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
</script>
</asp:Content>
