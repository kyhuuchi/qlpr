<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DanhSachKho.aspx.cs" Inherits="PRPO_Manage.Pages.Kho.DanhSachKho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="overlay"><div id="text"><img id="img-responsive" src="/Images/loader.gif" alt=""/></div></div> 
    <div class="form-group col-md-12">
        <a href="/Pages/PO/TaoPO.aspx"><button type="button" class="btn btn-primary btn-sm">Tạo mới phiếu nhập kho</button></a>
        <%--<a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>Tạo PR</a>--%>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#chuanhapkho">Danh sách PO chưa nhập kho <span class="badge" id="soluongpo_chuanhapkho"></span></a></li>
        <li><a data-toggle="tab" href="#danhapkho">Danh sách PO đã nhập kho <span class="badge" id="soluongpo_danhapkho"></span></a></li>
    </ul>

    <div class="tab-content" style="margin-top: 5px;">
        <div id="chuanhapkho" class="tab-pane fade in active">
            <div class="panel-group" id="accordion_chuanhapkho">
            </div>
        </div>
        <div id="danhapkho" class="tab-pane fade">
            <div class="panel-group" id="accordion_danhapkho">
              
            </div>
        </div>
       
    </div>
</asp:Content>
