﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="Demo.Share.menu" %>

<div class="menu_top" id="cssmenu" style="margin:10px 0;">
    <ul id="menu_content"> 
        <li class=""><a href="/Default.aspx"><span class="glyphicon glyphicon-home" style="padding-right: 5px;"></span>Trang chủ</a></li>        
        <%--<li class=""><a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>PR</a></li> --%>       
        <li class="" id="menupo"><a href="/Pages/PO/DanhSachPO.aspx"><span class="glyphicon glyphicon-list-alt" style="padding-right: 5px;"></span>PO</a></li>        
        <li class="" id="menukho"><a href="/Pages/Kho/DanhSachKho.aspx"><span class="glyphicon glyphicon-list-alt" style="padding-right: 5px;"></span>Kho</a></li>        
        <li class='has-sub' id="baocao"><a href='#'><span class="glyphicon glyphicon-file" style="padding-right: 5px;"></span>Báo cáo</a>
            <ul>
                <li class=''><a href="/Pages/BaoCao/BaoCaoSoLuongPR.aspx">Số lượng PR theo tháng, theo đơn vị</a></li>
                <li class=''><a href='/Pages/BaoCao/BaoCaoSoLuongPO.aspx'>Số lượng PO theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='/Pages/BaoCao/DoanhSoPO.aspx'>Doanh số PO theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='/Pages/BaoCao/DoanhSoNhapKho.aspx'>Doanh số nhập kho theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='/Pages/BaoCao/TienDo.aspx'>Trễ PR</a></li>
                <li class=''><a href='/Pages/BaoCao/TrePO.aspx'>Trễ PO</a></li>                            
            </ul>
        </li>       
        <li><a href='/Page/HoTro/'><span class="glyphicon glyphicon-question-sign" style="padding-right: 5px;"></span>Trợ giúp</a></li>        
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
     
        var pageName = window.location.pathname;
        var newPageName = pageName;

        if (pageName.indexOf('/') == 0) {
            newPageName = pageName.substring(1, pageName.length);

            $.each($('#menu_content').find('li'), function () {
                var hrefVal = $(this).find('a').attr('href');

                if (hrefVal.indexOf(newPageName) >= 0) {
                    $(this).addClass('active').siblings().removeClass('active');
                }

            });
        }
        //kiem tra xem user hien tai thuoc phong ban nao de hien thi menu PO va Kho
        if ($("#muahang").val()=='false')
        {
            $("#menupo").hide();
            $("#baocao").hide();
        }
        if ($("#kho").val() == 'false') {
            $("#menukho").hide();
            $("#baocao").hide();
        }
        if ($("#muahang").val() == 'true' && $("#xembaocao").val() == 'true') {
            $("#baocao").show();
        }
        
    });
    
</script>
