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
            <form>
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
                <div class="form-group">
                    <div class="form-group col-md-6">
                        <label for="congdung">Công dụng</label>
                        <input type="text" class="form-control" id="congdung" placeholder="Nhập nội dung công dụng"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="ngaydexuat">Ngày (*)</label>
                        <input type="date" class="form-control" id="ngaydexuat">
                    </div>
                </div>
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
                                        <h4 class="modal-title">Thêm mới người dùng</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="mavattu">Mã vật tư:</label>
                                                <select class="form-control" id="select_mavattu">
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
            </form>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
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
    });    
</script>
</asp:Content>
