<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaoPO.aspx.cs" Inherits="PRPO_Manage.Pages.PO.TaoPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="overlay"><div id="text"><img class="img-responsive" src="../../Images/loader.gif" alt=""/></div></div> 
    <div class="container" id="container">
         <div class="row">
            <div class="col-md-6">Công ty CP Sản Xuất Nhựa Duy Tân</div>
            <div class="col-md-6"><span class="pull-right">Phụ lục 4 - QT-CUVT-01</span></div>
        </div>
         <div class="row">
            <div class="col-md-12"><h3><p class="text-center font-weight-bold">ĐƠN ĐẶT HÀNG</p></h3></div>
        </div>
         <div class="row">
             <div class="form-row">
                 <div class="form-group col-md-4">
                      <label for="nhacungcap">Nhà cung cấp</label>
                       <select class="form-control" id="nhacungcap" style="width: 100%;">
                           <asp:Literal ID="lit_nhacc" runat="server" Mode="PassThrough"></asp:Literal>
                            </select>
                 </div>
                  <div class="form-group col-md-4">
                        <label for="donvidexuat">Đơn vị đề xuất</label>
                       <select class="form-control" id="donvidexuat" style="width: 100%;">
                            </select>
                        <input type="hidden" id="id_donvidexuat"/>
                    </div>
              
                    <div class="form-group col-md-4">
                        <label for="ngaypo">Ngày PO</label>
                        <input type="date" class="form-control" id="ngaypo"/>
                        <input type="hidden" id="namdexuat"/>
                        <input type="hidden" id="sothutupo"/>
                         <input type="hidden" id="id_po"/>
                        <input type="hidden" id="tinhtrangPO"/>
                         <input type="hidden" id="txt_ncc" runat="server"/>
                    </div>
                </div>
        </div>
         <div class="row">
             <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="sopo">Số PO</label>
                        <input type="text" class="form-control" id="sopo" readonly/>
                    </div>
                 <div class="form-group col-md-6">
                        <label for="nguoimuahang">Người mua hàng</label>
                        <input type="text" class="form-control" id="nguoimuahang" readonly/>
                    </div>
                   
                </div>
        </div>
    </div>
    <script type="text/javascript">
        //kiem tra xem user hien tai co quyen truy cap vao trang PO khong, neu khong redirect
        if ($("#muahang").val() == 'false') {
            window.location.replace("/Default.aspx");
        }
        //**********//
        var dsdata;
        var currentRow = null;
        //hien thi nut loading...
        $("#overlay").show();
        document.getElementById("nguoimuahang").value = $("#tenhienthi").val();
        $(document).ready(function () {
            ///Lay thong tin phong ban
            LayThongTinPhongBan();

            ///sau khi load xong het tat ca thi tat Loading...
            $("#overlay").hide();
        });
        $("#donvidexuat").change(function () {

            document.getElementById("id_donvidexuat").value = $(this).val();
            LaySoPO();

        });
        //Lay thong tin tat ca phong ban 
        function LayThongTinPhongBan()
        {
            $.ajax({
                type: "POST",
                async: false,
                url: "/Webservice/dsnguoidung.asmx/LayDSPhongBan",
                dataType: "json",
                success: function (data) {
                    var str = "";
                    for (var i = 0; i < data.length; i++) {
                        if (i == 0) {
                            str = str + '<option value="' + data[i]["ID_PhongBan"] + '" selected="selected">' + data[i]["Ten_Phong_Ban"] + '</option>';
                            document.getElementById("id_donvidexuat").value = data[i]["ID_PhongBan"];
                        }
                        else {
                            str = str + '<option value="' + data[i]["ID_PhongBan"] + '">' + data[i]["Ten_Phong_Ban"] + '</option>';
                        }

                    }
                    var opt_phongban = document.getElementById('donvidexuat');
                    opt_phongban.insertAdjacentHTML('afterbegin', str);
                },

            })
            .done(LaySoPO())
            .fail(function (jqXHR, textStatus, errorThrown) {
                alert("error lay so PR; " + errorThrown);
            });
        }
        //*******************//

        //Xu ly lay so PR tu he thong
        function LaySoPO() {
            var data;
            if ($("#donvidexuat ").val() == "") {
                alert("Chưa chọn bộ phận đề xuất.");
            }
            else {

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "/Webservice/dsnguoidung.asmx/LaySoPO",
                    data: { "phongban":Number($("#id_donvidexuat").val()), "nam": Number((new Date()).getFullYear()) },
                    dataType: "json",

                    success: function (data) {
                        var sopo;

                        sopo = data["So_PO"] + 1;
                        document.getElementById("sothutupo").value = sopo;
                        if (sopo < 10) {
                            sopo = "00" + sopo;
                        }
                        else if (sopo < 100 && sopo > 10) {
                            sopo = "0" + sopo;
                        }
                        else {
                            sopo = sopo;
                        }
                        var year = data["Nam"].toString().slice(-2);
                        $("#namdexuat").val(data["Nam"]);
                        $("#sopo").val(sopo + "/POMH-" + year + "-" + data["Phong_Ban"]);

                    },

                })
               .fail(function (jqXHR, textStatus, errorThrown) {
                   alert("error lay so PO; " + errorThrown);
               });
            }

        }
        //*******************//
    </script>
</asp:Content>
