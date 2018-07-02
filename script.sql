USE [PRPO]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  Table [dbo].[ModuleQuyen]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  Table [dbo].[PhongBan]    Script Date: 7/2/2018 5:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongBan] [ntext] NOT NULL,
	[TenVietTat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  Table [dbo].[PO_ChiTiet]    Script Date: 7/2/2018 5:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PO] [int] NOT NULL,
	[MaHang] [int] NOT NULL,
	[TenHang] [ntext] NOT NULL,
	[DVT] [ntext] NOT NULL,
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
/****** Object:  Table [dbo].[PR]    Script Date: 7/2/2018 5:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PhongBan] [int] NOT NULL,
	[SoPR] [int] NOT NULL,
	[Nam] [int] NOT NULL,
	[CongDung] [text] NOT NULL,
	[NgayTao] [date] NOT NULL,
	[ThangTao] [int] NOT NULL,
	[TongSoLuongYeuCau] [int] NOT NULL,
	[TongTien] [money] NOT NULL,
	[GhiChu] [text] NULL,
	[NgayDuyet] [date] NULL,
	[ID_NguoiDeXuat] [int] NOT NULL,
	[TinhTrang] [smallint] NOT NULL,
	[PRScanFile] [text] NULL,
	[SendMail] [bit] NULL,
 CONSTRAINT [PK_PR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PR_ChiTiet]    Script Date: 7/2/2018 5:04:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PR_ChiTiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PR] [int] NOT NULL,
	[MaHang] [numeric](18, 0) NOT NULL,
	[TenHang] [ntext] NOT NULL,
	[DVT] [ntext] NULL,
	[TonKho] [int] NULL,
	[SoLuongYeuCau] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[TiGia] [int] NULL,
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
/****** Object:  Table [dbo].[Quyen]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  Table [dbo].[VatTu]    Script Date: 7/2/2018 5:04:27 PM ******/
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
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_QuanLy]  DEFAULT ((0)) FOR [QuanLy]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_DangNhapDomain]  DEFAULT ((1)) FOR [DangNhapDomain]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_DangSuDung]  DEFAULT ((1)) FOR [DangSuDung]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_Admin]  DEFAULT ((0)) FOR [Admin]
GO
/****** Object:  StoredProcedure [dbo].[proc_Action_ModuleQuyen]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Action_NguoiDung]    Script Date: 7/2/2018 5:04:27 PM ******/
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
	if @action=1
		BEGIN
			Select *,PhongBan.TenPhongBan as PhongBan from NguoiDung left join PhongBan on NguoiDung.ID_PhongBan=PhongBan.ID
		END
	else if @action=0
		BEGIN
			delete from NguoiDung where ID=@id_nguoidung
		END
	else
		BEGIN
			if @id_nguoidung=0
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
/****** Object:  StoredProcedure [dbo].[proc_Action_PhongBan]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_Action_Quyen]    Script Date: 7/2/2018 5:04:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[proc_CheckAccount]    Script Date: 7/2/2018 5:04:27 PM ******/
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
	SELECT * from NguoiDung where TenDangNhap=@tendangnhap
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
