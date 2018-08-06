<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormXuLyLoi.ascx.cs" Inherits="QLCL.Share.FormXuLyLoi" %>
<style type="text/css">
    .form-group {
        margin-bottom: 0px;
    }

        .form-group label {
            font-weight: 200;
        }

    .heading {
        cursor: pointer;
        background-color: #0072c6;
        border-bottom: 1px solid #fff;
        padding: 5px 5px 0 5px;
        color: #fff;
    }
</style>

<div id="myModalXyLyLoi" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <input type="hidden" id="hdIdItemOrigial" />
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">BÁO CÁO SỰ KHÔNG PHÙ HỢP TRONG SẢN XUẤT</h4>
                <iframe id="uploadFrame" frameborder="0" height="25" width="200" scrolling="no" src="/WebService/UploadEngine.aspx" style="display: none;"></iframe>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" style="padding: 0 10px;">
                    <div class="form-group heading pstep1" style="position: relative;">
                        <label style="font-weight: 700;">I/ PHẦN DÀNH CHO QC/NHÂN VIÊN PHÁT HIỆN:</label>
                        <div class="float-right">
                            <span class="OwnerWorkStep"></span>
                        </div>
                    </div>
                    <div id="KhoiTao" class="content">
                        <div class="form-group" style="position: relative;">
                            <div style="position: relative;" class="col-md-6">
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Report No./Số phiếu</label>
                                <div class="col-sm-7">
                                    <input id="txtSoPhieu" name="SoPhieu" autocomplete="off" class="form-control form-control-sm" />
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Phân loại yêu cầu</label>
                                <div class="col-sm-7">
                                    <select id="ddlPhanLoaiYeuCau" name="PhanLoaiYeuCau" class="form-control required">
                                        <option value="">----Chọn ----</option>
                                        <option value="DichVu">Dịch vụ</option>
                                        <option value="SanPham">Sản phẩm</option>
                                    </select>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Nhà máy</label>
                                <div class="col-sm-7">
                                    <select id="ddlNhaMay" name="NhaMay" class="form-control required"></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Xưởng sản xuất</label>
                                <div class="col-sm-7">
                                    <select id="ddlXuongSanXuat" name="XuongSanXuat" class="form-control required"></select>
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Khách hàng</label>
                                <div class="col-sm-7">
                                    <select id="ddlKhachHang" name="KhachHang" class="form-control"></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Quản đốc</label>
                                <div class="col-sm-7">
                                    <select id="ddlQuanDoc" name="QuanDoc" class="form-control required"></select>
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">KCS phát hiện</label>
                                <div class="col-sm-7">
                                    <select id="ddlKCS" name="KCS" class="form-control required"></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Công nhân</label>
                                <div class="col-sm-7">
                                    <input id="txtCongNhan" name="CongNhan" class="form-control" autocomplete="off" />
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Trưởng ca</label>
                                <div class="col-sm-7">
                                    <input id="txtTruongCa" name="TruongCa" class="form-control" autocomplete="off" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Giai đoạn phát hiện</label>
                                <div class="col-sm-7">
                                    <select id="ddlGiaiDoanPhatHien" name="GiaiDoanPhatHien" class="form-control required">
                                        <option value="">----Chọn ----</option>
                                        <option value="KiemTraDauVao">Kiểm tra đầu vào</option>
                                        <option value="SanXuatBanThanhPham">Sản xuất bán thành phẩm</option>
                                        <option value="SanXuatThanhPham">Sản xuất thành phẩm</option>
                                        <option value="LuuKho">Lưu kho</option>
                                        <option value="ThiTruong">Thị trường</option>
                                        <option value="TimNhaCungCap">Tìm nhà cung cấp</option>
                                        <option value="BaoGia">Báo giá</option>
                                        <option value="GiaoHang">Giao hàng</option>
                                        <option value="KyMau">Ký mẫu</option>
                                        <option value="Khac">Khác</option>
                                    </select>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Ngày phát hiện</label>
                                <div class="col-sm-7">
                                    <input id="txtNgayPhatHien" name="NgayPhatHien" class="form-control date required" autocomplete="off" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Mã ERP sản phẩm</label>
                                <div class="col-sm-7">
                                    <input id="txtMaERPSanPham" name="MaERPSanPham" class="form-control number required" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Số lô:</label>
                                <div class="col-sm-7">
                                    <input id="txtSoLo" name="SoLo" class="form-control required" autocomplete="off" />
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5" style="">Tên sản phẩm</label>
                                <div class="col-sm-7">
                                    <textarea id="txtTenSanPham" name="TenSanPham" style="height: 60px;" class="form-control required" autocomplete="off"></textarea>
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <div>
                                    <label class="col-sm-5">Ngày Sản xuất BTP</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgaySanXuatBTP" name="NgaySanXuatBTP" class="form-control date required" autocomplete="off" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="col-sm-5">Ngày Sản xuất TP</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgaySanXuatTP" name="NgaySanXuatTP" class="form-control date required" autocomplete="off" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Ngày nhập kho</label>
                                <div class="col-sm-7">
                                    <input id="txtNgayNhapKho" name="NgayNhapKho" class="form-control date required" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Số lượng sản xuất</label>
                                <div class="col-sm-4">
                                    <input id="txtSoLuongSanXuat" name="SoLuongSanXuat" class="form-control number required" autocomplete="off" />
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                                <div class="col-sm-3">
                                    <select id="ddlDonViTinh" name="DonViTinh" class="form-control required"></select>
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Máy</label>
                                <div class="col-sm-7">
                                    <input id="txtMay" name="May" class="form-control" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Khuôn</label>
                                <div class="col-sm-7">
                                    <input id="txtKhuon" name="Khuon" class="form-control" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Yêu cầu xử lý</label>
                                <div class="col-sm-7">
                                    <input type="radio" id="rdYeuCauXuLyYes" name="optradioYeuCauXuLy">Yes&nbsp;&nbsp;
                                <input type="radio" id="rdYeuCauXuLyNo" name="optradioYeuCauXuLy" checked>No
                                <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Lệnh sản xuất</label>
                                <div class="col-sm-7">
                                    <input id="txtLenhSanXuat" name="LenhSanXuat" class="form-control" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                                <%--<label class="col-sm-5"></label>
                                <div class="col-sm-4">
                                    <input id="txtChiPhi" name="ChiPhi" class="form-control money" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                                 <div class="col-sm-3">
                                    <select id="ddlDonViTinhChiPhi" name="DonViTinhChiPhi" class="form-control"></select>
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>--%>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Số mẫu kiểm</label>
                                <div class="col-sm-7">
                                    <input id="txtSoMauKiem" name="SoMauKiem" class="form-control number" autocomplete="off" />
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Số lượng mẫu lỗi</label>
                                <div class="col-sm-7">
                                    <input id="txtSoMauLoi" name="SoMauLoi" class="form-control number" autocomplete="off" />
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 5px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-3">Phân loại</label>
                                <div class="col-sm-9">
                                    <div class="group_optradioPL">
                                        <input id="rdPhanLoaiGopY" type="radio" name="optradioPL" value="GopY" class="required rad">Góp ý&nbsp;&nbsp;
                                <input id="rdPhanLoaiNhe" type="radio" name="optradioPL" value="Nhe" class="required rad">Nhẹ&nbsp;&nbsp;
                                <input id="rdPhanLoaiNang" type="radio" name="optradioPL" value="Nang" class="required rad">Nặng&nbsp;&nbsp;
                                <input id="rdPhanLoaiNghiemTrong" type="radio" name="optradioPL" value="NghiemTrong" class="required rad">Nghiêm trọng
                                <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Tỷ lệ lỗi</label>
                                <div class="col-sm-7">
                                    <input id="txtTyLeLoi" disabled name="TyLeLoi" class="form-control number" autocomplete="off" />
                                    <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative;" class="col-md-4">
                                <label class="col-sm-5">Dòng sản phẩm</label>
                                <div class="col-sm-7">
                                    <select id="ddlDongSanPham" name="DongSanPham" class="form-control required"></select>
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="col-sm-5">Nhóm sản phẩm</label>
                                <div class="col-sm-7">
                                    <select id="ddlNhomSanPham" name="NhomSanPham" class="form-control required"></select>
                                    <span class="error taixeerror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="col-sm-4">Loại lỗi</label>
                                <div class="col-sm-8">
                                    <select multiple id="ddlLoaiLoi" name="LoaiLoi" class="form-control required" style="height: 30px;"></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative;">
                            <div style="position: relative;" class="col-md-6">
                                <label class="col-sm-5">Lỗi lập lại</label>
                                <div class="col-sm-7">
                                    <input id="ckLoiLapLai" type="checkbox" name="optcheckboxLoiLap">
                                    <label id="displayLoiLapLai"></label>
                                    <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                </div>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                            </div>
                        </div>
                        <div class="form-group" style="position: relative;">
                            <div class="col-md-12" style="padding: 0 0 0 30px;">
                                <label style="font-weight: 700;">Mô tả sự không phù hợp & Hình ảnh lỗi (nếu có)</label>
                            </div>
                            <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                <textarea id="txtMoTaSuKhongPhuHop" name="MoTaSuKhongPhuHop" class="form-control" style="height: 110px;"></textarea>
                            </div>
                            <div style="position: relative; padding: 10px 0 0 30px;" class="col-md-12">
                                <button class="addImageDescription btn btn-default btn-success btn-sm" id="addImageDescription" type="button"><span class="glyphicon glyphicon-picture"></span>&nbsp;Thêm ảnh</button>
                            </div>
                            <div class="dsPictureDescription col-md-12"></div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                            <div style="position: relative; padding: 0 0 0 30px;" class="col-md-6">
                                <label>Công xử lý/sản phẩm phế (nếu có)</label>
                            </div>
                            <div style="position: relative;" class="col-md-6">
                                <div class="col-sm-5"></div>
                                <div class="col-sm-7">
                                    <input id="txtCongXuLyPhePham" name="CongXuLyPhePham" class="form-control number" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; margin-left: 2px;">
                            <div style="position: relative;" class="col-md-4">
                                <label class="" style="text-align: center;">Người lập phiếu</label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="">Ngày lập phiếu</label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="">Cấp trên người lập phiếu</label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <input id="txtNguoiLapPhieu" name="NguoiLapPhieu" class="form-control" />
                                <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <input id="txtNgayLapPhieu" name="NgayLapPhieu" class="form-control date" />
                                <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <input id="txtCapTrenNguoiLapPhieu" name="CapTrenNguoiLapPhieu" class="form-control" />
                                <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; margin-left: 2px;">
                            <div style="position: relative;" class="col-md-4">
                                <label class="">Người xử lý </label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="">Cấp trên người xử lý</label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <label class="">Người liên quan</label>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <input id="txtNguoiXuLy" name="NguoiXuLy" class="form-control timeC" />
                                <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <input id="txtCapTrenNguoiXuLy" name="CapTrenNguoiXuLy" class="form-control" />
                                <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                            <div style="position: relative;" class="col-md-4">
                                <select multiple id="ddlNguoiLienQuan" name="NguoiLienQuan" class="form-control required" style="height: 30px;"></select>
                                <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                            </div>
                        </div>
                        <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                            <div style="position: relative;" class="col-md-12">
                                <button type="button" class="btn btn-default" id="btSaveKhoiTao">Lưu</button>
                                <button type="button" class="btn btn-default" id="btSendApproveKhoiTao">Gửi Phê Duyệt</button>
                                <button type="button" class="btn btn-default" id="btCancelKhoiTao">Hủy yêu cầu</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group heading pstep2">
                        <label style="font-weight: 700;">II/ PHẦN DÀNH CHO QUẢN LÝ CHẤT LƯỢNG</label>
                        <div class="float-right">
                            <span class="OwnerWorkStep"></span>
                        </div>
                    </div>
                    <div id="XuLyVaQuyetDinh" class="content">
                        <div class="AreaCaptrenNguoiLapPhieu" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                            <div class="form-group" style="position: relative;">
                                <div style="position: relative;" class="col-md-12">
                                    <label class="col-sm-3">Quyết định</label>
                                    <div class="col-sm-9">
                                        <div class="group_optradioQD">
                                            <input id="rdQuyetDinhGiaoHang" type="radio" name="optradioQD" value="GiaoHang" class="required rad">Giao hàng&nbsp;&nbsp;
                                <input id="rdQuyetDinhXuLy" type="radio" name="optradioQD" value="XuLy" class="required rad">Xử lý&nbsp;&nbsp;                               
                                <input id="rdQuyetDinhHuy" type="radio" name="optradioQD" value="Huy" class="required rad">Hủy&nbsp;&nbsp;
                                        <input id="rdQuyetDinhKhac" type="radio" name="optradioQD" value="Khac" class="required rad">Khác
                                        </div>
                                        <input type="checkbox" id="ckYeuCauKPPN" name="optradioYCKPPN" checked="checked" style="display: none;"><span style="font-weight: bold; color: red; display: none;">Yêu cầu KPPN</span>
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-12">
                                    <div class="col-sm-3">
                                        <label style="">Nhân viên kỹ thuật</label>
                                    </div>
                                    <div class="col-sm-9">
                                        <select id="ddlNhanVienKyThuat" name="NhanVienKyThuat" class="form-control required"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="">Nội dung quyết định</label>
                                </div>
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                    <textarea id="txtCommentXuLyQuyetDinh" name="CommentXuLyQuyetDinh" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNguoiDungXuLyQuyetDinh" name="NguoiDungXuLyQuyetDinh" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Ngày duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgayDuyetXuLyQuyetDinh" name="NgayDuyetXuLyQuyetDinh" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btXuLyVaQuyetDinhLuu">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btXuLyVaQuyetDinhDuyet">Duyệt</button>
                                    <button type="button" class="btn btn-default" id="btXuLyVaQuyetDinhTuChoi">Từ Chối</button>
                                </div>
                            </div>
                        </div>
                        <div class="AreaQuanDoc" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                            <div class="AreaDanhGiaLoHang">
                                <div class="form-group" style="position: relative; padding: 10px 0 10px 0;">
                                    <div class="col-md-12" style="padding: 0 0 0 15px;">
                                        <label style="font-weight: bold; font-size: 13px; font-style: italic; display: inline">Đánh giá lô hàng tồn kho hoặc đã giao đến khách hàng</label>&nbsp;
                                        <button class="addEvaluate btn btn-default btn-success btn-xs" type="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Thêm đánh giá</button>
                                        <span class="lbErroraddEvaluate" style="color: red; margin-left: 10px; background-color: rgba(242, 222, 222, 1); font-style: italic; display: none">(*) Nhập đánh giá</span>
                                    </div>
                                </div>
                                <div class="table-responsive" style="padding-left: 7px;">
                                    <table class="table table-bordered table-intel" id="tbDanhGiaLoHang">
                                        <thead style="background-color: rgba(204, 231, 255, 1);">
                                            <tr style="text-align: center;">
                                                <td style="width: 26%">Tên hàng</td>
                                                <td style="width: 18%;">Lô/Ngày sản xuất</td>
                                                <td style="width: 15%;">Số lượng</td>
                                                <td style="width: 18%;">Phương pháp kiểm tra (Kiểm 100%/cỡ mẫu)</td>
                                                <td style="width: 15%;">Kết quả kiểm tra (Đạt/Không đạt)</td>
                                                <td style="width: 8%;">Tỷ lệ lỗi</td>
                                                <td style="width: 10%">&nbsp;</td>
                                            </tr>
                                        </thead>
                                        <tbody class="AreaAddEvaluate">
                                            <tr id="DanhGiaLoHang_0" data-id="0">
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaTenHang" class="form-control" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaLo" class="form-control" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaSoLuong" class="form-control number" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaPhuongPhapKiemTra" class="form-control" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaKetQuaKiemTra" class="form-control" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="DanhGiaTyLeLoi" class="form-control" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <button name="delete" type="button" class="form-control DeleteItem" value=""><span class="glyphicon glyphicon-trash"></span></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="AreaActionNow" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                                <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                    <div class="col-md-12" style="padding: 0 0 0 15px;">
                                        <label style="font-weight: bold; font-size: 13px; font-style: italic;">Hành động khắc phục - xử lý tức thời:</label>&nbsp;
                                       <button class="addActionNow btn btn-default btn-success btn-xs" type="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Thêm hành động</button>
                                        <span class="lbErroraddActionNow" style="color: red; margin-left: 10px; background-color: rgba(242, 222, 222, 1); font-style: italic; display: none">(*) Nhập hành động</span>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-intel" id="tbXuLyTucThoi">
                                        <thead style="background-color: rgba(204, 231, 255, 1);">
                                            <tr style="text-align: center;">
                                                <td style="width: 33%">Hành động</td>
                                                <td style="width: 22%;">Người thực hiện</td>
                                                <td style="width: 15%;">Trách nhiệm</td>
                                                <td style="width: 14%;">Thời điểm áp dụng</td>
                                                <td style="width: 14%;">Ngày hoàn thành</td>
                                                <td style="width: 10%">&nbsp;</td>
                                            </tr>
                                        </thead>
                                        <tbody class="AreaAddActionNow">
                                            <tr id="XuLyTucThoi_0" data-id="0">
                                                <td>
                                                    <div>
                                                        <textarea name="HanhDong" class="form-control actioncontent"></textarea>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <select name="NguoiPhuTrach" class="form-control NguoiPhuTrach"></select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <select name="TrachNhiem" class="form-control TrachNhiem">
                                                            <option value="" selected="selected">---Chọn---</option>
                                                            <option value="QuanDoc">Quản đốc</option>
                                                            <option value="NhanVienKyThuat">Nhân viên kỹ thuật</option>
                                                            <option value="KCS">KCS</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="ThoiDiemApDung" class="form-control date" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="NgayHoanThanh" class="form-control date" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <button name="delete" type="button" class="form-control DeleteItem" value=""><span class="glyphicon glyphicon-trash"></span></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 0 0px;">
                                <div class="col-md-12" style="padding: 0 0 0 15px;">
                                    <label style="font-size: 13px; font-style: italic; font-weight: bold;">Tổng kết xử lý (nếu có)</label>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-2">
                                    <div class="">
                                        <input id="txtQuyetDinhTongKet" name="QuyetDinhTongKet" class="form-control" value="Sử dụng" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-5">
                                    <label class="col-sm-5">Tổng kết công xử lý (nếu có)</label>
                                    <div class="col-sm-7">
                                        <input id="txtCongXuLyTongKet" name="CongXuLyTongKet" class="form-control number" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-5">
                                    <label class="col-sm-5">Số lượng sản phẩm DT bị ảnh hưởng (nếu có)</label>
                                    <div class="col-sm-7">
                                        <input id="txtSanPhamAnhHuongTongKet" name="SanPhamAnhHuongTongKet" class="form-control number" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-2">
                                </div>
                                <div style="position: relative;" class="col-md-5">
                                    <label class="col-sm-5">Tổng kết phế xử lý (nếu có)</label>
                                    <div class="col-sm-7">
                                        <input id="txtPheXuLyTongKet" name="PheXuLyTongKet" class="form-control number" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-5">
                                    <label class="col-sm-5">Số lượng xử lý</label>
                                    <div class="col-sm-7">
                                        <input id="txtSoLuongXuLyTongKet" name="SoLuongXuLyTongKet" class="form-control number" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div class="col-md-6" style="position: relative; padding: 0 0 0 30px;">
                                    <label>Tổng chi phí khát sinh (nếu có)</label>
                                </div>
                                <div class="col-md-6" style="position: relative;">
                                    <div class="col-sm-5"></div>
                                    <div class="col-sm-7">
                                        <input name="TongChiPhiPhatSinh" class="form-control money" id="txtTongChiPhiPhatSinh">
                                    </div>
                                </div>
                            </div>
                            <div style="border-top: 1px dashed #ccc;">
                                <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                    <div class="col-md-12" style="padding: 0 0 0 15px; font-weight: bold;">
                                        <label style="font-size: 13px; font-style: italic; font-weight: bold;">Proof/ Bằng chứng xử lý</label>&nbsp;
                                <button class="addAccessFileProof btn btn-default btn-success btn-xs" id="addAccessFileProof" type="button"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;Đính kèm file</button>
                                    </div>
                                    <div class="dsAccessFileProof col-md-12"></div>
                                </div>
                                <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                    <div style="position: relative;" class="col-md-6">
                                        <label class="col-sm-5">Người trả lời</label>
                                        <div class="col-sm-7">
                                            <input id="txtNguoiTraLoi" name="NguoiTraLoi" class="form-control" />
                                            <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                        </div>
                                    </div>
                                    <div style="position: relative;" class="col-md-6">
                                        <label class="col-sm-5">Ngày trả lời</label>
                                        <div class="col-sm-7">
                                            <input id="txtNgayTraLoi" name="NgayTraLoi" class="form-control date" />
                                            <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                    <div style="position: relative;" class="col-md-12">
                                        <button type="button" class="btn btn-default" id="btAccessXuLyKhacPhuc">Lưu</button>
                                        <button type="button" class="btn btn-default" id="btAccessXuLyKhacPhucGuiDuyet">Gửi Duyệt</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ApproveCapTrenNguoiLapPhieu">
                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                <div class="col-md-12" style="padding: 0 0 0 15px;">
                                    <label style="font-weight: bold;">Phê duyệt khắc phục và xử lý</label>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="">Ghi chú</label>
                                </div>
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                    <textarea id="txtGhiChuPheDuyet" name="GhiChuPheDuyet" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNguoiPheDuyetHanhDongXuLy" name="NguoiPheDuyetHanhDongXuLy" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Ngày duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgayPheDuyet" name="NgayPheDuyet" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btXuLyKhacPhuc">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btXuLyKhacPhucApprove">Duyệt</button>
                                    <button type="button" class="btn btn-default" id="btXuLyKhacPhucCancel">Từ Chối</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group heading pstep3">
                        <label style="font-weight: 700;">III/ PHÂN TÍCH NGUYÊN NHÂN VÀ ĐƯA RA HÀNH ĐỘNG PHÒNG NGỪA:</label>
                        <div class="float-right">
                            <span class="OwnerWorkStep"></span>
                        </div>
                    </div>
                    <div id="PhanTichNguyenNhanVaHanhDongPhongNgua" class="content">
                        <div class="AccessPhanTichNguyenNhanVaHanhDongPhongNgua" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                            <div class="AreaPTNNHD" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                                <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                    <div class="col-md-12" style="padding: 0 0 0 15px;">
                                        <label style="font-weight: bold; font-size: 13px; font-style: italic;">Phản hồi của bộ phận chịu trách nhiệm</label>
                                    </div>
                                </div>
                                <div style="padding-left: 7px;">
                                    <div class="form-group" style="position: relative; padding: 10px 0 10px 0;">
                                        <div style="position: relative;" class="col-md-12" id="tabPhanTichNguyenNhan">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#FeedBack5">5 Why</a></li>
                                                <li><a data-toggle="tab" href="#FeedBack4M">Khác</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="ChooseSupplierFeedback tab-content">
                                        <div class="FeedBack5W tab-pane fade in active" id="FeedBack5">
                                            <div class="form-group" style="position: relative;">
                                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                                    <label style="font-weight: bold; font-size: 13px; font-style: italic;">Phân tích nguyên nhân theo 5W:</label>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    Tại sao 1?
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txt5Why1" name="FWhy1" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    Tại sao 2?
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txt5Why2" name="FWhy2" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    Tại sao 3?
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txt5Why3" name="FWhy3" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    Tại sao 4?
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txt5Why4" name="FWhy4" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    Tại sao 5?
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txt5Why5" name="FWhy5" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="FeedBack4M tab-pane fade" id="FeedBack4M">
                                            <div class="form-group" style="position: relative;">
                                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                                    <label style="font-weight: bold; font-size: 13px; font-style: italic;">Phân tích nguyên nhân theo 4M:</label>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative;">
                                                <div style="position: relative; padding-left: 20px; text-align: center;" class="col-md-4">
                                                    Nguyên nhân liên quan đến
                                                </div>
                                                <div style="position: relative; text-align: center;" class="col-md-8">
                                                    Root cause/possible cause (Giải thích nguyên nhân gốc/nguyên nhân có thể)
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    MAN (kĩ năng, ý thức của con người)
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txtNguyenNhanMan" name="NguyenNhanMan" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    MACHINE (Vận hành, Máy móc,..)
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txtNguyenNhanMachine" name="NguyenNhanMachine" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    METHOD (phương pháp kiểm soát)
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txtNguyenNhanMethod" name="NguyenNhanMethod" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                                <div style="position: relative; padding-left: 30px;" class="col-md-4">
                                                    MATERIAL (vật liệu sử dụng)
                                                </div>
                                                <div style="position: relative;" class="col-md-8">
                                                    <textarea id="txtNguyenNhanMeterial" name="NguyenNhanMeterial" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="position: relative; padding: 15px 0 0 0;">
                                    <div class="col-md-4" style="position: relative; padding-left: 30px;">
                                        Tóm tắt nguyên nhân
                                    </div>
                                    <div class="col-md-8" style="position: relative;">
                                        <textarea id="txtTomTatNguyenNhan" name="TomTatNguyenNhan" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                    <div class="col-md-12" style="padding: 0 0 0 30px;">
                                        <label style="font-weight: bold; font-size: 13px; font-style: italic;">Hành động phòng ngừa:</label>&nbsp;
                                        <button class="addAction btn btn-default btn-success btn-xs" type="button"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Thêm hành động</button>
                                        <span class="lbErroraddAction" style="color: red; margin-left: 10px; background-color: rgba(242, 222, 222, 1); font-style: italic; display: none">(*) Nhập hành động</span>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-intel" id="tbKhacPhucHanhDongPhongNgua">
                                        <thead style="background-color: rgba(204, 231, 255, 1);">
                                            <tr style="text-align: center;">
                                                <td style="width: 33%">Hành động</td>
                                                <td style="width: 23%;">Người phụ trách</td>
                                                <td style="width: 15%;">Trách nhiệm</td>
                                                <td style="width: 14%;">Thời điểm áp dụng</td>
                                                <td style="width: 14%;">Ngày hoàn thành</td>
                                                <td style="width: 10%">&nbsp;</td>
                                            </tr>
                                        </thead>
                                        <tbody class="AreaAddAction">
                                            <tr id="KhacPhucHanhDongPhongNgua_0" data-id="0">
                                                <td>
                                                    <div>
                                                        <textarea name="HanhDong" class="form-control actioncontent"></textarea>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <select name="NguoiPhuTrach" class="form-control NguoiPhuTrach"></select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <select name="TrachNhiem" class="form-control TrachNhiem">
                                                            <option value="" selected="selected">---Chọn---</option>
                                                            <option value="QuanDoc">Quản đốc</option>
                                                            <option value="NhanVienKyThuat">Nhân viên kỹ thuật</option>
                                                            <option value="KCS">KCS</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="ThoiDiemApDung" class="form-control date" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <input name="NgayHoanThanh" class="form-control date" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <button name="delete" type="button" class="form-control DeleteItem" value=""><span class="glyphicon glyphicon-trash"></span></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                <div class="col-md-12" style="padding: 0 0 0 15px; font-weight: bold;">
                                    <label style="font-weight: bold;">Proof/ Bằng chứng thực hiện</label>&nbsp;
                                <button class="addFileProof btn btn-default btn-success btn-xs" id="addFileProof" type="button"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;Đính kèm file</button>
                                </div>
                                <div class="dsFileProof col-md-12"></div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người trả lời</label>
                                    <div class="col-sm-7">
                                        <input id="txtNguoiPhanTichNguyenNhan" name="NguoiPhanTichNguyenNhan" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Ngày trả lời</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgayPhanTichNguyenNhan" name="NgayPhanTichNguyenNhan" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btAccessPhanTichNguyenNhanVaHanhDongPhongNguaLuu">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btAccessPhanTichNguyenNhanVaHanhDongPhongNguaGuiDuyet">Gửi Phê Duyệt</button>
                                    <button type="button" class="btn btn-default" id="btAccessPhanTichNguyenNhanVaHanhDongPhongNguaGuiYeuCauHuy">Gửi yêu cầu hủy</button>
                                </div>
                            </div>
                        </div>
                        <div class="ApprovePhanTichNguyenNhanVaHanhDongPhongNgua">
                            <div class="form-group" style="position: relative; padding: 10px 0 0 0;">
                                <div class="col-md-12" style="padding: 0 0 0 15px;">
                                    <label style="font-weight: bold;">Phê duyệt phân tích nguyên nhân và hành động</label>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="">Ghi chú</label>
                                </div>
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                    <textarea id="txtGhiChuPheDuyetPhanTichNguyenNhan" name="GhiChuPheDuyetPhanTichNguyenNhan" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNguoiPheDuyetPhanTichNguyenNhan" name="NguoiPheDuyetPhanTichNguyenNhan" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Ngày duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgayPheDuyetPhanTichNguyenNhan" name="NgayPheDuyetPhanTichNguyenNhan" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btApprovePhanTichNguyenNhanVaHanhDongPhongNguaLuu">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btApprovePhanTichNguyenNhanVaHanhDongPhongNguaDuyet">Duyệt</button>
                                    <button type="button" class="btn btn-default" id="btApprovePhanTichNguyenNhanVaHanhDongPhongNguaTuChoi">Từ Chối</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group heading pstep4">
                        <label style="font-weight: 700;">IV/ KIỂM TRA HIỆU LỰC VÀ HIỆU QUẢ:</label>
                        <div class="float-right">
                            <span class="OwnerWorkStep"></span>
                        </div>
                    </div>
                    <div id="KiemTraTinhHieuQua" class="content">
                        <div class="AccessKiemTraTinhHieuQua" style="border-bottom: 1px dashed #ccc; padding-bottom: 10px;">
                            <div class="form-group" style="position: relative;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="">Người đánh giá hiệu lực và hiệu quả (QC khởi tạo sự không phù hợp)</label>
                                </div>
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                    <textarea id="txtKhoiTaoKhongPhuHop" name="KhoiTaoKhongPhuHop" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div class="group_optradioTK">
                                    <div style="position: relative;" class="col-md-6">
                                        <label class="col-sm-10">Lỗi không lập lại ở lần sản xuất tiếp theo</label>
                                        <div class="col-sm-2">
                                            <input id="rdLoiKhongLapLaiTK" type="radio" name="optradioTK" value="LoiKhongLapLaiOGiaoHangTiepTheo" class="required rad">
                                            <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                        </div>
                                    </div>
                                    <div style="position: relative;" class="col-md-6">
                                        <label class="col-sm-10">Lỗi lập lại ở lần giao hàng tiếp theo</label>
                                        <div class="col-sm-2">
                                            <input id="rdLoiLapLaiTK" type="radio" name="optradioTK" value="LoiLapLaiOGiaoHangTiepTheo" class="required rad">
                                            <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                        </div>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-10">Cần yêu cầu xay phế?</label>
                                    <div class="col-sm-2">
                                        <input id="rdYeuCauHuyTK" type="checkbox" name="optradioTKHuy">
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div class="col-md-6" style="padding: 0 0 0 30px;">
                                    <label style="">Bằng chứng xay phế</label>
                                </div>
                                <div style="position: relative; padding: 10px 0 0 30px;" class="col-md-12">
                                    <button class="addFileHuy btn btn-default btn-success btn-sm" type="button"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;Đính kèm file</button>
                                </div>
                                <div class="dsFileProofCanel col-md-12"></div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người kiểm tra</label>
                                    <div class="col-sm-7">
                                        <input id="txtNguoiKiemTraTinhHieuQua" name="NguoiKiemTraTinhHieuQua" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Date/ Ngày kiểm tra</label>
                                    <div class="col-sm-7">
                                        <input id="txtNgayKiemTraTinhHieuQua" name="NgayKiemTraTinhHieuQua" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btAccessKiemTraTinhHieuQuaLuu">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btAccessKiemTraTinhHieuQuaGuiDuyet">Gửi Phê Duyệt</button>
                                </div>
                            </div>
                        </div>
                        <div class="ApproveKiemTraTinhHieuQua">
                            <div class="form-group" style="position: relative; padding: 10px 0 0px 0px;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="font-weight: bold;">Phê duyệt đánh giá hiệu lực và hiệu quả</label>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative;">
                                <div class="col-md-12" style="padding: 0 0 0 30px;">
                                    <label style="">Ghi chú</label>
                                </div>
                                <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                    <textarea id="txtGhiChuDanhGiaHieuQua" name="GhiChuDanhGiaHieuQua" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px;">
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Người duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtKTTHQNguoiDuyet" name="KTTHQNguoiDuyet" class="form-control" />
                                        <span class="error giokhoihanherror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                                <div style="position: relative;" class="col-md-6">
                                    <label class="col-sm-5">Ngày duyệt</label>
                                    <div class="col-sm-7">
                                        <input id="txtKTTHQNgayDuyet" name="KTTHQNgayDuyet" class="form-control date" />
                                        <span class="error giohoantaterror" style="color: red; display: none; position: absolute; top: 30px; right: 5px;">*</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="position: relative; padding: 10px 0 5px 0px; text-align: right;">
                                <div style="position: relative;" class="col-md-12">
                                    <button type="button" class="btn btn-default" id="btApproveKiemTraTinhHieuQuaLuu">Lưu</button>
                                    <button type="button" class="btn btn-default" id="btApproveKiemTraTinhHieuQuaDuyet">Duyệt</button>
                                    <button type="button" class="btn btn-default" id="btApproveKiemTraTinhHieuQuaTuChoi">Từ Chối</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>

    </div>
</div>
