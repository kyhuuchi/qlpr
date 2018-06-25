<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="Demo.Share.menu" %>

<div class="menu_top" id="cssmenu" style="margin:10px 0;">
    <ul id="menu_content"> 
        <li class="active"><a href='../Default.aspx'>Trang chủ</a></li>        
        <li class=""><a href='../Default.aspx'>Nhập PR</a></li>        
        <li class='has-sub'><a href='#'>Báo cáo</a>
            <ul>
                <li class=''><a href='/Page/Issue/'>Lịch sử</a></li>
                <li class=''><a href='/Page/Report/'>Báo cáo</a></li>                        
            </ul>
        </li>       
        <li><a href='/Page/HoTro/'>Trợ giúp</a></li>        
    </ul>
</div>
