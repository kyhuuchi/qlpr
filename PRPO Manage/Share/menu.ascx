<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="Demo.Share.menu" %>

<div class="menu_top" id="cssmenu" style="margin:10px 0;">
    <ul id="menu_content"> 
        <li class="active"><a href="/Default.aspx"><span class="glyphicon glyphicon-home" style="padding-right: 5px;"></span>Trang chủ</a></li>        
        <li class=""><a href="/Pages/PR/TaoPR.aspx"><span class="glyphicon glyphicon-shopping-cart" style="padding-right: 5px;"></span>Tạo PR</a></li>        
        <li class='has-sub'><a href='#'><span class="glyphicon glyphicon-file" style="padding-right: 5px;"></span>Báo cáo</a>
            <ul>
                <li class=''><a href='#'>Số lượng PR theo tháng, theo đơn vị</a></li>
                <li class=''><a href='#'>Số lượng PO theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='#'>Doanh số PO theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='#'>Doanh số nhập kho theo tháng, theo đơn vị</a></li>                 
                <li class=''><a href='#'>Tiến độ</a></li>                 
            </ul>
        </li>       
        <li><a href='/Page/HoTro/'><span class="glyphicon glyphicon-question-sign" style="padding-right: 5px;"></span>Trợ giúp</a></li>        
    </ul>
</div>

