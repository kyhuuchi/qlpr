USE [master]
GO
/****** Object:  Database [PRPO]    Script Date: 7/23/2018 4:56:28 PM ******/
CREATE DATABASE [PRPO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRPO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PRPO.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRPO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PRPO_log.ldf' , SIZE = 32448KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRPO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRPO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRPO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRPO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRPO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRPO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRPO] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRPO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRPO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRPO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRPO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRPO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRPO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRPO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRPO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRPO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRPO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRPO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRPO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRPO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRPO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRPO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRPO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRPO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRPO] SET RECOVERY FULL 
GO
ALTER DATABASE [PRPO] SET  MULTI_USER 
GO
ALTER DATABASE [PRPO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRPO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRPO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRPO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PRPO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PRPO]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kho](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoNhapKho] [varchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhapKho] [date] NOT NULL,
	[TinhTrang] [smallint] NULL,
	[SoNgayTre] [int] NULL,
	[ID_PO] [int] NOT NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModuleQuyen]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleQuyen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_NguoiDung] [int] NOT NULL,
	[Module] [nvarchar](50) NOT NULL,
	[ID_Quyen] [int] NOT NULL,
 CONSTRAINT [PK_ModuleQuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](max) NOT NULL,
	[TenHienThi] [ntext] NOT NULL,
	[ID_PhongBan] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[NgayTao] [date] NULL,
	[QuanLy] [bit] NULL,
	[DangNhapDomain] [bit] NOT NULL,
	[DangSuDung] [bit] NOT NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongBan] [nvarchar](max) NOT NULL,
	[TenVietTat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SoPO] [int] NOT NULL,
	[Nam] [int] NOT NULL,
	[NgayPO] [date] NOT NULL,
	[ThangPO] [int] NULL,
	[ID_NguoiPhuTrachMuaHang] [int] NOT NULL,
	[ID_NguoiDuyetPO] [int] NOT NULL,
	[SoNgayTre] [int] NULL,
	[ID_PhongBan] [int] NULL,
 CONSTRAINT [PK_PO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO_ChiTiet]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PO] [int] NOT NULL,
	[MaHang] [varchar](50) NOT NULL,
	[TenHang] [ntext] NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[SoLuongPO] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[TiGia] [int] NULL,
	[ThanhTien] [money] NOT NULL,
	[NhaCungCap] [ntext] NOT NULL,
	[TinhTrangVatTu] [int] NOT NULL,
	[ID_PR] [int] NOT NULL,
 CONSTRAINT [PK_PO_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PR]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PhongBan] [int] NOT NULL,
	[SoPR] [int] NOT NULL,
	[SoPR_Full] [nvarchar](max) NULL,
	[Nam] [int] NOT NULL,
	[CongDung] [text] NULL,
	[NgayTao] [date] NOT NULL,
	[ThangTao] [int] NOT NULL,
	[TongSoLuongYeuCau] [int] NOT NULL,
	[TongTien] [money] NOT NULL,
	[GhiChu] [text] NULL,
	[NgayDuyet] [date] NULL,
	[ID_NguoiDuyet] [int] NULL,
	[NgayNhan] [date] NULL,
	[ID_NguoiDeXuat] [int] NOT NULL,
	[TinhTrang] [smallint] NOT NULL,
	[PRScanFile] [text] NULL,
	[SendMail] [bit] NULL,
	[TieuDe1] [nvarchar](max) NULL,
	[TieuDe2] [nvarchar](max) NULL,
	[TieuDe3] [nvarchar](max) NULL,
	[TieuDe4] [nvarchar](max) NULL,
	[TieuDe5] [nvarchar](max) NULL,
	[TieuDe6] [nvarchar](max) NULL,
	[NganSachDuocDuyet1] [money] NULL,
	[NganSachDuocDuyet2] [money] NULL,
	[NganSachDuocDuyet3] [money] NULL,
	[NganSachDuocDuyet4] [money] NULL,
	[NganSachDuocDuyet5] [money] NULL,
	[NganSachDuocDuyet6] [money] NULL,
	[DeXuatLanNay1] [money] NULL,
	[DeXuatLanNay2] [money] NULL,
	[DeXuatLanNay3] [money] NULL,
	[DeXuatLanNay4] [money] NULL,
	[DeXuatLanNay5] [money] NULL,
	[DeXuatLanNay6] [money] NULL,
	[LuyKe1] [money] NULL,
	[LuyKe2] [money] NULL,
	[LuyKe3] [money] NULL,
	[LuyKe4] [money] NULL,
	[LuyKe5] [money] NULL,
	[LuyKe6] [money] NULL,
	[ThuaThieu1] [money] NULL,
	[ThuaThieu2] [money] NULL,
	[ThuaThieu3] [money] NULL,
	[ThuaThieu4] [money] NULL,
	[ThuaThieu5] [money] NULL,
	[ThuaThieu6] [money] NULL,
 CONSTRAINT [PK_PR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PR_ChiTiet]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PR_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PR] [int] NOT NULL,
	[MaHang] [varchar](50) NOT NULL,
	[TenHang] [ntext] NOT NULL,
	[DVT] [nvarchar](50) NULL,
	[TonKho] [int] NULL,
	[SoLuongYeuCau] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[TiGia] [int] NOT NULL,
	[ThanhTienTamUng] [money] NOT NULL,
	[NhaCungCap] [ntext] NULL,
	[TinhTrangVatTu] [int] NOT NULL,
	[NgayCanHang] [date] NOT NULL,
	[ThoiGianSuDung] [ntext] NOT NULL,
	[CongDung] [ntext] NULL,
 CONSTRAINT [PK_PR_ChiTiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PR_ChiTiet_Xoa]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PR_ChiTiet_Xoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PR] [nvarchar](50) NOT NULL,
	[MaHang] [varchar](50) NOT NULL,
	[TenHang] [ntext] NOT NULL,
	[DVT] [nvarchar](50) NULL,
	[TonKho] [int] NULL,
	[SoLuongYeuCau] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[TiGia] [int] NOT NULL,
	[ThanhTienTamUng] [money] NOT NULL,
	[NhaCungCap] [ntext] NULL,
	[TinhTrangVatTu] [int] NOT NULL,
	[NgayCanHang] [date] NOT NULL,
	[ThoiGianSuDung] [ntext] NOT NULL,
	[CongDung] [ntext] NULL,
 CONSTRAINT [PK_PR_ChiTiet_Xoa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PR_Xoa]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR_Xoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PhongBan] [int] NOT NULL,
	[SoPR] [int] NOT NULL,
	[SoPR_Full] [nvarchar](max) NULL,
	[Nam] [int] NOT NULL,
	[CongDung] [text] NULL,
	[NgayTao] [date] NOT NULL,
	[ThangTao] [int] NOT NULL,
	[TongSoLuongYeuCau] [int] NOT NULL,
	[TongTien] [money] NOT NULL,
	[GhiChu] [text] NULL,
	[NgayDuyet] [date] NULL,
	[ID_NguoiDuyet] [int] NULL,
	[ID_NguoiDeXuat] [int] NOT NULL,
	[TinhTrang] [smallint] NOT NULL,
	[PRScanFile] [text] NULL,
	[SendMail] [bit] NULL,
	[TieuDe1] [nvarchar](max) NULL,
	[TieuDe2] [nvarchar](max) NULL,
	[TieuDe3] [nvarchar](max) NULL,
	[TieuDe4] [nvarchar](max) NULL,
	[TieuDe5] [nvarchar](max) NULL,
	[TieuDe6] [nvarchar](max) NULL,
	[NganSachDuocDuyet1] [money] NULL,
	[NganSachDuocDuyet2] [money] NULL,
	[NganSachDuocDuyet3] [money] NULL,
	[NganSachDuocDuyet4] [money] NULL,
	[NganSachDuocDuyet5] [money] NULL,
	[NganSachDuocDuyet6] [money] NULL,
	[DeXuatLanNay1] [money] NULL,
	[DeXuatLanNay2] [money] NULL,
	[DeXuatLanNay3] [money] NULL,
	[DeXuatLanNay4] [money] NULL,
	[DeXuatLanNay5] [money] NULL,
	[DeXuatLanNay6] [money] NULL,
	[LuyKe1] [money] NULL,
	[LuyKe2] [money] NULL,
	[LuyKe3] [money] NULL,
	[LuyKe4] [money] NULL,
	[LuyKe5] [money] NULL,
	[LuyKe6] [money] NULL,
	[ThuaThieu1] [money] NULL,
	[ThuaThieu2] [money] NULL,
	[ThuaThieu3] [money] NULL,
	[ThuaThieu4] [money] NULL,
	[ThuaThieu5] [money] NULL,
	[ThuaThieu6] [money] NULL,
 CONSTRAINT [PK_PR_Xoa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](max) NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sales]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[id] [int] NULL,
	[created] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[So_PR]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[So_PR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PhongBan] [int] NOT NULL,
	[SoPR] [int] NOT NULL,
	[Nam] [int] NOT NULL,
 CONSTRAINT [PK_Temp_PR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VatTu]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VatTu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaVT] [varchar](50) NOT NULL,
	[TenVT] [nvarchar](max) NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[LeadTime] [int] NULL,
	[DonGia] [money] NULL,
	[TaxCode] [decimal](18, 1) NULL,
	[DonViTienTe] [varchar](50) NULL,
	[DonGia_Thue] [money] NULL,
	[NhomVatTu] [int] NULL,
	[DG] [money] NULL,
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_soluongpr_chuaduyet]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_soluongpr_chuaduyet]
AS
SELECT        COUNT(a.ID) AS SoLuong, b.TenPhongBan, b.ID
FROM            dbo.PR AS a LEFT OUTER JOIN
                         dbo.PhongBan AS b ON b.ID = a.ID_PhongBan
WHERE        (a.TinhTrang = 2)
GROUP BY b.TenPhongBan, b.ID

GO
/****** Object:  View [dbo].[view_soluongpr_daduyet]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_soluongpr_daduyet]
AS
SELECT        COUNT(a.ID) AS SoLuong, b.TenPhongBan, b.ID
FROM            dbo.PR AS a LEFT OUTER JOIN
                         dbo.PhongBan AS b ON b.ID = a.ID_PhongBan
WHERE        (a.TinhTrang = 3)
GROUP BY b.TenPhongBan, b.ID

GO
/****** Object:  View [dbo].[view_soluongpr_luutam]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_soluongpr_luutam]
AS
SELECT        COUNT(a.ID) AS SoLuong, b.TenPhongBan, b.ID
FROM            dbo.PR AS a LEFT OUTER JOIN
                         dbo.PhongBan AS b ON b.ID = a.ID_PhongBan
WHERE        (a.TinhTrang = 1)
GROUP BY b.TenPhongBan, b.ID

GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_QuanLy]  DEFAULT ((0)) FOR [QuanLy]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_DangNhapDomain]  DEFAULT ((1)) FOR [DangNhapDomain]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_DangSuDung]  DEFAULT ((1)) FOR [DangSuDung]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_Admin]  DEFAULT ((0)) FOR [Admin]
GO
/****** Object:  StoredProcedure [dbo].[proc_Action_ModuleQuyen]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_ModuleQuyen]
	@action int,
	@id int,
	@id_nguoidung int,
	@module nvarchar(50),
	@id_quyen int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @action=1
		BEGIN
			Select ModuleQuyen.ID,nd.TenHienThi,ModuleQuyen.Module,q.TenQuyen
			from ModuleQuyen
			left join NguoiDung nd on nd.ID=ModuleQuyen.ID_NguoiDung
			left join Quyen q on q.ID=ModuleQuyen.ID_Quyen
		END
	else if @action=0
		BEGIN
			delete from ModuleQuyen where ID=@id
		END
	else
		BEGIN
			if @id=0
				BEGIN
					insert into ModuleQuyen(ID_NguoiDung,Module,ID_Quyen) 
					values (@id_nguoidung,@module,@id_quyen)
				END
			else
				BEGIN
					update ModuleQuyen set 
					ID_NguoiDung=@id_nguoidung,
					Module=@module,
					ID_Quyen=@id_quyen
					where ID=@id
				END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Action_NguoiDung]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_NguoiDung]
	@action int,
	@id_nguoidung int,
	@tendangnhap varchar(MAX),
	@tenhienthi ntext,
	@id_phongban int,
	@email nvarchar(MAX),
	@dangsudung bit,
	@quanly bit,
	@admin bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@action=1)
		BEGIN
			if(@dangsudung=1)
				Begin
					Select *,PhongBan.TenPhongBan as PhongBan from NguoiDung left join PhongBan on NguoiDung.ID_PhongBan=PhongBan.ID where DangSuDung=@dangsudung
				End
			if(@quanly=1)
				Begin
					Select *,PhongBan.TenPhongBan as PhongBan from NguoiDung left join PhongBan on NguoiDung.ID_PhongBan=PhongBan.ID where QuanLy=@quanly
				End
			if(@dangsudung=0 and @quanly=0 and @admin=0)
				Begin
					Select *,PhongBan.TenPhongBan as PhongBan from NguoiDung left join PhongBan on NguoiDung.ID_PhongBan=PhongBan.ID
				End
			
		END
	else if(@action=0)
		BEGIN
			delete from NguoiDung where ID=@id_nguoidung
		END
	else
		BEGIN
			if(@id_nguoidung=0)
				BEGIN
					Declare @ngayhethong AS date
					set @ngayhethong= GETDATE()
					insert into NguoiDung(TenDangNhap,TenHienThi,ID_PhongBan,Email,NgayTao,QuanLy,Admin) 
					values (@tendangnhap,@tenhienthi,@id_phongban,@email,@ngayhethong,@quanly,@admin)
				END
			else
				BEGIN
					update NguoiDung set 
					TenDangNhap=@tendangnhap,
					TenHienThi=@tenhienthi,
					ID_PhongBan=@id_phongban,
					Email=@email,
					DangSuDung=@dangsudung,
					QuanLy=@quanly,
					Admin=@admin
					where ID=@id_nguoidung
				END
		END
   
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Action_PhongBan]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_PhongBan]
	@action int,
	@id int,
	@tenphongban ntext,
	@tenviettat nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @action=1
		BEGIN
			Select * from PhongBan
		END
	else if @action=0
		BEGIN
			delete from PhongBan where ID=@id
		END
	else
		BEGIN
			if @id=0
				BEGIN
					insert into PhongBan(TenPhongBan,TenVietTat) 
					values (@tenphongban,@tenviettat)
				END
			else
				BEGIN
					update PhongBan set 
					TenPhongBan=@tenphongban,
					TenVietTat=@tenviettat
					where ID=@id
				END
		END
   
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Action_PR]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_PR]
	@action int,
	@id int,
	@idphongban int,
	@sopr int,
	@sopr_full nvarchar(MAX),
	@nam int,
	@congdung text,
	@ngaytao date,
	@thangtao int,
	@tongsoluongyeucau int,
	@tongtien money,
	@ghichu text,
	@ngayduyet date=NULL,
	@idnguoiduyet int,
	@idnguoidexuat int,
	@tinhtrang smallint,
	@prscanfile text,
	@sendmail bit,
	@tieude1 nvarchar(MAX),
	@tieude2 nvarchar(MAX),
	@tieude3 nvarchar(MAX),
	@tieude4 nvarchar(MAX),
	@tieude5 nvarchar(MAX),
	@tieude6 nvarchar(MAX),
	@ngansachduocduyet1 money,
	@ngansachduocduyet2 money,
	@ngansachduocduyet3 money,
	@ngansachduocduyet4 money,
	@ngansachduocduyet5 money,
	@ngansachduocduyet6 money,
	@dexuatlannay1 money,
	@dexuatlannay2 money,
	@dexuatlannay3 money,
	@dexuatlannay4 money,
	@dexuatlannay5 money,
	@dexuatlannay6 money,
	@luyke1 money,
	@luyke2 money,
	@luyke3 money,
	@luyke4 money,
	@luyke5 money,
	@luyke6 money,
	@thuathieu1 money,
	@thuathieu2 money,
	@thuathieu3 money,
	@thuathieu4 money,
	@thuathieu5 money,
	@thuathieu6 money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if (@action=1)
		BEGIN
			if(@sopr>0)
				BEGIN
					Select * from PR where SoPR=@sopr and Nam=@nam and ID_PhongBan=@idphongban and ThangTao=@thangtao and ID_NguoiDeXuat=@idnguoidexuat
				END
			Else
				if(@tinhtrang>0 and @idphongban>0)
					BEGIN
						Select * from PR where TinhTrang=@tinhtrang and ID_PhongBan=@idphongban
					END
				if(@sopr_full is not null)
					Begin
						Select a.*,b.TenVietTat from PR a
						left join PhongBan b on b.ID=a.ID_PhongBan
						where SoPR_Full=@sopr_full
					End
				Else
					Begin
						Select * from PR
					End
			
		END
	else if(@action=0)
		BEGIN
			/*kiem tra xem so PR do co trung voi so PR nao khac hay ko?*/
			DECLARE @slpr int;
			Select @slpr=Count(ID) from PR where SoPR_Full=@sopr_full and TinhTrang=@tinhtrang
			/*Neu khong trung thi cho phep xoa*/
			if(@slpr=1)
				Begin
					DECLARE @idpr int;
					Select @idpr=ID from PR where SoPR_Full=@sopr_full and TinhTrang=@tinhtrang
					/*them vao bang PR_Xoa truoc khi xoa khoi table*/ 
					insert into PR_Xoa(ID_PhongBan,SoPR,SoPR_Full,Nam,CongDung,NgayTao,ThangTao,TongSoLuongYeuCau,TongTien,GhiChu,ID_NguoiDeXuat,TinhTrang,PRScanFile,SendMail,TieuDe1,TieuDe2,TieuDe3,TieuDe4,TieuDe5,TieuDe6,NganSachDuocDuyet1,NganSachDuocDuyet2,NganSachDuocDuyet3,NganSachDuocDuyet4,NganSachDuocDuyet5,NganSachDuocDuyet6,DeXuatLanNay1,DeXuatLanNay2,DeXuatLanNay3,DeXuatLanNay4,DeXuatLanNay5,DeXuatLanNay6,LuyKe1,LuyKe2,LuyKe3,LuyKe4,LuyKe5,LuyKe6,ThuaThieu1,ThuaThieu2,ThuaThieu3,ThuaThieu4,ThuaThieu5,ThuaThieu6)
						select ID_PhongBan,SoPR,SoPR_Full,Nam,CongDung,NgayTao,ThangTao,TongSoLuongYeuCau,TongTien,GhiChu,ID_NguoiDeXuat,TinhTrang,PRScanFile,SendMail,TieuDe1,TieuDe2,TieuDe3,TieuDe4,TieuDe5,TieuDe6,NganSachDuocDuyet1,NganSachDuocDuyet2,NganSachDuocDuyet3,NganSachDuocDuyet4,NganSachDuocDuyet5,NganSachDuocDuyet6,DeXuatLanNay1,DeXuatLanNay2,DeXuatLanNay3,DeXuatLanNay4,DeXuatLanNay5,DeXuatLanNay6,LuyKe1,LuyKe2,LuyKe3,LuyKe4,LuyKe5,LuyKe6,ThuaThieu1,ThuaThieu2,ThuaThieu3,ThuaThieu4,ThuaThieu5,ThuaThieu6 from PR where SoPR_Full=@sopr_full
					Insert into PR_ChiTiet_Xoa(ID_PR,MaHang,TenHang,DVT,TonKho,SoLuongYeuCau,DonGia,TiGia,ThanhTienTamUng,NhaCungCap,TinhTrangVatTu,NgayCanHang,ThoiGianSuDung,CongDung)
						select @sopr_full,MaHang,TenHang,DVT,TonKho,SoLuongYeuCau,DonGia,TiGia,ThanhTienTamUng,NhaCungCap,TinhTrangVatTu,NgayCanHang,ThoiGianSuDung,CongDung from PR_ChiTiet where ID_PR=@idpr
						
					/***/
					delete from PR where SoPR_Full=@sopr_full and TinhTrang=@tinhtrang
					delete from PR_ChiTiet where ID_PR=@idpr
				End
			
			
		END
	else
		BEGIN
			if(@id=0)
				BEGIN
					insert into PR(ID_PhongBan,SoPR,SoPR_Full,Nam,CongDung,NgayTao,ThangTao,TongSoLuongYeuCau,TongTien,GhiChu,ID_NguoiDeXuat,TinhTrang,PRScanFile,SendMail,TieuDe1,TieuDe2,TieuDe3,TieuDe4,TieuDe5,TieuDe6,NganSachDuocDuyet1,NganSachDuocDuyet2,NganSachDuocDuyet3,NganSachDuocDuyet4,NganSachDuocDuyet5,NganSachDuocDuyet6,DeXuatLanNay1,DeXuatLanNay2,DeXuatLanNay3,DeXuatLanNay4,DeXuatLanNay5,DeXuatLanNay6,LuyKe1,LuyKe2,LuyKe3,LuyKe4,LuyKe5,LuyKe6,ThuaThieu1,ThuaThieu2,ThuaThieu3,ThuaThieu4,ThuaThieu5,ThuaThieu6) 
					values (@idphongban,@sopr,@sopr_full,@nam,@congdung,@ngaytao,@thangtao,@tongsoluongyeucau,@tongtien,@ghichu,@idnguoidexuat,@tinhtrang,@prscanfile,@sendmail,@tieude1,@tieude2,@tieude3,@tieude4,@tieude5,@tieude6,@ngansachduocduyet1,@ngansachduocduyet2,@ngansachduocduyet3,@ngansachduocduyet4,@ngansachduocduyet5,@ngansachduocduyet6,@dexuatlannay1,@dexuatlannay2,@dexuatlannay3,@dexuatlannay4,@dexuatlannay5,@dexuatlannay6,@luyke1,@luyke2,@luyke3,@luyke4,@luyke5,@luyke6,@thuathieu1,@thuathieu2,@thuathieu3,@thuathieu4,@thuathieu5,@thuathieu6)
				END
			else
				BEGIN
						update PR set 
						CongDung=@congdung,
						TongSoLuongYeuCau=@tongsoluongyeucau,
						TongTien=@tongtien,
						GhiChu=@ghichu,
						NgayTao=@ngaytao,
						Nam=@nam,
						TinhTrang=@tinhtrang,
						ThangTao=@thangtao,
						TieuDe1=@tieude1,
						TieuDe2=@tieude2,
						TieuDe3=@tieude3,
						TieuDe4=@tieude4,
						TieuDe5=@tieude5,
						TieuDe6=@tieude6,
						NganSachDuocDuyet1=@ngansachduocduyet1,
						NganSachDuocDuyet2=@ngansachduocduyet2,
						NganSachDuocDuyet3=@ngansachduocduyet3,
						NganSachDuocDuyet4=@ngansachduocduyet4,
						NganSachDuocDuyet5=@ngansachduocduyet5,
						NganSachDuocDuyet6=@ngansachduocduyet6,
						DeXuatLanNay1=@dexuatlannay1,
						DeXuatLanNay2=@dexuatlannay2,
						DeXuatLanNay3=@dexuatlannay3,
						DeXuatLanNay4=@dexuatlannay4,
						DeXuatLanNay5=@dexuatlannay5,
						DeXuatLanNay6=@dexuatlannay6,
						LuyKe1=@luyke1,
						LuyKe2=@luyke2,
						LuyKe3=@luyke3,
						LuyKe4=@luyke4,
						LuyKe5=@luyke5,
						LuyKe6=@luyke6,
						ThuaThieu1=@thuathieu1,
						ThuaThieu2=@thuathieu2,
						ThuaThieu3=@thuathieu3,
						ThuaThieu4=@thuathieu4,
						ThuaThieu5=@thuathieu5,
						ThuaThieu6=@thuathieu6
						where ID=@id
					END
					
				
		END
   
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Action_PR_ChiTiet]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|7|0|C:\Users\kyhuuchi\AppData\Local\Temp\~vs5D48.sql
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_PR_ChiTiet] 
	@action int,
	@id int,
	@idpr int,
	@mahang varchar(50),
	@tenhang ntext,
	@dvt nvarchar(50),
	@tonkho int,
	@soluongyeucau int,
	@dongia money,
	@tigia int,
	@thanhtientamung money,
	@nhacungcap ntext,
	@tinhtrangvattu int,
	@ngaycanhang date,
	@thoigiansudung ntext,
	@congdung ntext
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if (@action=1)
		if(@idpr>0)
		
		BEGIN
			Select * from PR_ChiTiet where ID_PR=@idpr
		END
	if(@action=0)
		BEGIN
			delete from PR_ChiTiet where ID=@id
		END
	if(@action>1)
		BEGIN
			if (@id=0)
				BEGIN
					insert into PR_ChiTiet(ID_PR,MaHang,TenHang,DVT,TonKho,SoLuongYeuCau,DonGia,TiGia,ThanhTienTamUng,NhaCungCap,TinhTrangVatTu,NgayCanHang,ThoiGianSuDung,CongDung) 
					values (@idpr,@mahang,@tenhang,@dvt,@tonkho,@soluongyeucau,@dongia,@tigia,@thanhtientamung,@nhacungcap,@tinhtrangvattu,@ngaycanhang,@thoigiansudung,@congdung)
				END
			if(@id>0)
				BEGIN
					update PR_ChiTiet set 
					MaHang= @mahang,
					TenHang= @tenhang,
					DVT= @dvt,
					TonKho= @tonkho,
					SoLuongYeuCau=@soluongyeucau,
					DonGia=	@dongia,
					TiGia=@tigia,
					ThanhTienTamUng= @thanhtientamung,
					NhaCungCap= @nhacungcap,
					TinhTrangVatTu= @tinhtrangvattu,
					ThoiGianSuDung= @thoigiansudung,
					CongDung=@congdung
					where ID=@id
					
					
				END
		END
   
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Action_Quyen]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_Quyen]
	@action int,
	@id int,
	@tenquyen nvarchar(MAX),
	@maquyen nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @action=1
		BEGIN
			Select * from Quyen
		END
	else if @action=0
		BEGIN
			delete from Quyen where ID=@id
		END
	else
		BEGIN
			if @id=0
				BEGIN
					insert into Quyen(TenQuyen,MaQuyen) 
					values (@tenquyen,@maquyen)
				END
			else
				BEGIN
					update Quyen set 
					TenQuyen=@tenquyen,
					MaQuyen=@maquyen
					where ID=@id
				END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Action_So_PR]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_So_PR]
	@action int,
	@id int,
	@idphongban int,
	@sopr int,
	@nam int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @action=1
		BEGIN
			Select *from So_PR a
			left join PhongBan b on b.ID=a.ID_PhongBan
			where a.ID_PhongBan=@idphongban and a.Nam=@nam
		END
	
	else
		BEGIN
			if @id=0
				BEGIN
					insert into So_PR(ID_PhongBan,SoPR,Nam) 
					values (@idphongban,@sopr,@nam)
				END
			else
				BEGIN
					update So_PR set 
					SoPR=@sopr
					where ID_PhongBan=@idphongban and Nam=@nam
				END
		END
   
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Action_VatTu]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Action_VatTu] 
	@action int,
	@id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @action=1
		BEGIN
			if @id>0
				BEGIn
					Select *
					from sales
					where id=@id
				END
			else
				BEGIN
					Select *
					from sales
				END
			
			
		END
	else if @action=0
		BEGIN
			delete from sales where ID=@id
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_CheckAccount]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_CheckAccount]
	-- Add the parameters for the stored procedure here
	@tendangnhap varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *, PhongBan.TenVietTat as PhongBan 
	from NguoiDung
	left join PhongBan on ID_PhongBan=NguoiDung.ID_PhongBan
	where TenDangNhap=@tendangnhap
END

GO
/****** Object:  StoredProcedure [dbo].[proc_ThongTinPR_TinhTrang]    Script Date: 7/23/2018 4:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_ThongTinPR_TinhTrang] 
	@tinhtrang int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@tinhtrang=1)
		BEGIN
			Select * from view_soluongpr_luutam
		END
	else if(@tinhtrang=2)
		BEGIN
			Select * from view_soluongpr_chuaduyet
		END
	else
		BEGIN
			Select * from view_soluongpr_daduyet
		END
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tự động cộng tổng số lượng mua hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR', @level2type=N'COLUMN',@level2name=N'TongSoLuongYeuCau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tự động cộng tổng tiền mua hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR', @level2type=N'COLUMN',@level2name=N'TongTien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Lưu tạm; 2: Chưa duyệt; 3: Đã duyệt; 4: Không duyệt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR', @level2type=N'COLUMN',@level2name=N'TinhTrang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'đường link file' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR', @level2type=N'COLUMN',@level2name=N'PRScanFile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Đấ gửi; 0: Chưa gửi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR', @level2type=N'COLUMN',@level2name=N'SendMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 119
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_chuaduyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_chuaduyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 119
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_daduyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_daduyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 119
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_luutam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_soluongpr_luutam'
GO
USE [master]
GO
ALTER DATABASE [PRPO] SET  READ_WRITE 
GO
