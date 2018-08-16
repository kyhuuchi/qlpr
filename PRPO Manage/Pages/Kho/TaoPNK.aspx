<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPNK.aspx.cs" Inherits="PRPO_Manage.Pages.Kho.TaoPNK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="overlay">
        <div id="text">
            <img class="img-responsive" src="../../../Images/loader.gif" alt="" />
        </div>
    </div>
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-12">
                <h3>
                    <p class="text-center font-weight-bold">PHIẾU NHẬP KHO</p>
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="sophieunhapkho">Số PN Kho:</label>
                    <input type="text" class="form-control" id="sophieunhapkho" />

                </div>
              

                <div class="form-group col-md-4">
                    <label for="ngaynhapkho">Ngày nhập kho</label>
                    <div class="form-group">
                        <div class='input-group date' id='ngaynhapkho'>
                            <input type='text' class="form-control" />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>

                </div>
                  <div class="form-group col-md-4">
                    <label for="soluongnhapkho">Số lượng nhập kho</label>
                    <input type="number" class="form-control" id="soluongnhapkho" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
