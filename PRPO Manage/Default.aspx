<%@ Page Title="QUẢN LÝ PR-PO" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PRPO_Manage._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Danh sách PR chưa duyệt <span class="badge">5</span></a></li>
        <li><a data-toggle="tab" href="#menu1">Danh sách PR đã duyệt</a></li>
        <li><a data-toggle="tab" href="#menu2">Danh sách PO</a></li>
        <li><a data-toggle="tab" href="#menu3">Danh sách nhập kho</a></li>
    </ul>

    <div class="tab-content" style="margin-top: 5px;">
        <div id="home" class="tab-pane fade in active">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
        <div id="menu1" class="tab-pane fade">
            <h3>Menu 1</h3>
            <p>Some content in menu 1.</p>
        </div>
        <div id="menu2" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Some content in menu 2.</p>
        </div>
          <div id="menu3" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Some content in menu 2.</p>
        </div>
    </div>
<script type="text/javascript">
    $(document).ready(function () {
        //lay thong tin tat ca phong ban 
        //$.ajax({
        //    type: "POST",
        //    async: false,
        //    url: "/Webservice/dsnguoidung.asmx/LayThongTinNguoiDung",
        //    data: { "tendangnhap": $("#LoginName1").text() },
        //    dataType: "json",
        //    success: function (data) {
        //        //document.getElementById("bophandexuat").innerText = data["Phong_Ban"];
        //        //document.getElementById("bophandexuat").value = data["Phong_Ban"];
        //        // $("#bophandexuat").text(data["Phong_Ban"]);
        //        $("#bophandexuat").val(data["Phong_Ban"]);
        //        //$("#ID_bophandexuat").val(data["ID_PhongBan"]);

        //        document.getElementById("ID_bophandexuat").value = data["ID_Phong_Ban"];
        //        document.getElementById("ID_nguoidexuat").value = data["ID_NguoiDung"];

        //    },

        //})
        //.done(LaySoPR())
        //.fail(function (jqXHR, textStatus, errorThrown) {
        //    alert("error" + errorThrown);
        //});

        
       

    });
</script>
</asp:Content>
