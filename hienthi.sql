select b.SoPR_Full,b.ID_PhongBan, a.MaHang,a.TenHang,a.SoLuongYeuCau
from PR_ChiTiet a
left join PR b on b.ID=a.ID_PR
where a.TinhTrang=1

select b.SoPR_Full,b.ID_PhongBan, a.MaHang,a.TenHang,a.SoLuongYeuCau
from PR_ChiTiet a
left join PR b on b.ID=a.ID_PR
where a.TinhTrang=0

select a.ID,a.TenHang,a.MaHang,a.SoLuongPO,b.ID_PO_ChiTiet,b.TongSoLuong
from PO_ChiTiet a
inner join 
(select SUM(SoLuong) as TongSoLuong,c.ID_PO,c.ID_PO_ChiTiet
from kho c
group by c.ID_PO,c.ID_PO_ChiTiet) b on b.ID_PO_ChiTiet=a.ID