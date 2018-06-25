<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NoteAdminCancelYeuCau.ascx.cs" Inherits="QLCL.Share.NoteAdminCancelYeuCau" %>

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

<div id="myModalLyDoHuyPhieu" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <input type="hidden" id="hdIdItemOrigial" />
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Hủy/ Phục hồi Phiếu</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" style="padding: 0 10px;">
                    <div id="KiemTraTinhHieuQua" class="content">
                        <div class="form-group" style="position: relative;">
                            <div class="col-md-12" style="padding: 0 0 0 30px;">
                                <label style="">Lý do</label>
                            </div>
                            <div style="position: relative; padding: 0 0 0 30px;" class="col-md-12">
                                <textarea id="txtLyDoHuyPhieu" name="GhiChuDanhGiaHieuQua" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" id="btDongYHuyPhieu" type="button">Hủy</button>
                <button class="btn btn-default" id="btPhucHoiPhieu" type="button">Phục hồi</button>
                <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
