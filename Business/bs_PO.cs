using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

using System.Threading.Tasks;
using DB;

namespace Business
{
    public class PO
    {
        private int _id_po;
        private int _so_po;
        private string _so_po_full;
        private int _nam;
        private DateTime _ngay_po;
        private int _thang_po;
        private int _id_nguoimuahang;
        private int _id_nguoiduyet_po;
        private int _so_ngay_tre;
        private int _id_phong_ban;
        private string _ten_nha_cung_cap;
        private string _ma_nha_cung_cap;
        private string _kho_nhan;
        private int _tinh_trang;

        public int ID_PO
        {
            get { return _id_po; }
            set { _id_po = value; }
        }
        public int So_PO
        {
            get { return _so_po; }
            set { _so_po = value; }
        }
        public string So_PO_Full
        {
            get { return _so_po_full; }
            set { _so_po_full = value; }
        }
        public int Nam
        {
            get { return _nam; }
            set { _nam = value; }
        }
        public DateTime Ngay_PO
        {
            get { return _ngay_po; }
            set { _ngay_po = value; }
        }
        public int Thang_PO
        {
            get { return _thang_po; }
            set { _thang_po = value; }
        }
        public int ID_NguoiMuaHang
        {
            get { return _id_nguoimuahang; }
            set { _id_nguoimuahang = value; }
        }
        public int ID_Nguoi_Duyet_PO
        {
            get { return _id_nguoiduyet_po; }
            set { _id_nguoiduyet_po = value; }
        }
        public int So_Ngay_tre
        {
            get { return _so_ngay_tre; }
            set { _so_ngay_tre = value; }
        }
        public int ID_Phong_Ban
        {
            get { return _id_phong_ban; }
            set { _id_phong_ban = value; }
        }
        public string Ten_Nha_Cung_Cap
        {
            get { return _ten_nha_cung_cap; }
            set { _ten_nha_cung_cap = value; }
        }
        public string Ma_Nha_Cung_Cap
        {
            get { return _ma_nha_cung_cap; }
            set { _ma_nha_cung_cap = value; }
        }
        public string Kho_Nhan
        {
            get { return _kho_nhan; }
            set { _kho_nhan = value; }
        }
        public int Tinh_Trang
        {
            get { return _tinh_trang; }
            set { _tinh_trang = value; }
        }

    }
}
