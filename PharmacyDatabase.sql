USE [master]
GO
/****** Object:  Database [PHARMADATA]    Script Date: 9.02.2021 22:12:47 ******/
CREATE DATABASE [PHARMADATA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PHARMADATA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PHARMADATA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PHARMADATA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PHARMADATA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PHARMADATA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PHARMADATA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PHARMADATA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PHARMADATA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PHARMADATA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PHARMADATA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PHARMADATA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PHARMADATA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PHARMADATA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PHARMADATA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PHARMADATA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PHARMADATA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PHARMADATA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PHARMADATA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PHARMADATA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PHARMADATA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PHARMADATA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PHARMADATA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PHARMADATA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PHARMADATA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PHARMADATA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PHARMADATA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PHARMADATA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PHARMADATA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PHARMADATA] SET RECOVERY FULL 
GO
ALTER DATABASE [PHARMADATA] SET  MULTI_USER 
GO
ALTER DATABASE [PHARMADATA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PHARMADATA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PHARMADATA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PHARMADATA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PHARMADATA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PHARMADATA', N'ON'
GO
ALTER DATABASE [PHARMADATA] SET QUERY_STORE = OFF
GO
USE [PHARMADATA]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Name] [nvarchar](50) NOT NULL,
	[StockSituationPharmacy] [int] NULL,
	[SellingPrice] [float] NULL,
	[Category] [varchar](50) NULL,
	[BuyingPrice] [float] NULL,
	[ShelfPlace] [varchar](10) NULL,
	[IsPrescription] [varchar](5) NULL,
	[FirmName] [nvarchar](50) NULL,
	[PharmacyCertificateID] [smallint] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionAndName]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionAndName](
	[MedicineName] [nvarchar](50) NOT NULL,
	[PrescriptionNumber] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_PrescriptionAndName] PRIMARY KEY CLUSTERED 
(
	[MedicineName] ASC,
	[PrescriptionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Ssn] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[InsuranceStuation] [varchar](50) NULL,
	[PrescriptionNumber] [nvarchar](25) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[PatientZipCode] [int] NULL,
	[Birthdate] [smalldatetime] NULL,
	[Age] [int] NULL,
	[HasDebt] [int] NULL,
 CONSTRAINT [PK_Patient_1] PRIMARY KEY CLUSTERED 
(
	[PrescriptionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Patient__05621DD43301DA33] UNIQUE NONCLUSTERED 
(
	[PrescriptionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Patient__CA33E0E43CEF413A] UNIQUE NONCLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InsuranceAndPriceTables]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- People who do not have health insurance and pay drugs more than 200 TL.
CREATE VIEW [dbo].[InsuranceAndPriceTables] as
Select distinct p.FirstName + ' ' + p.LastName Name, pm.MedicineName, m.SellingPrice
From Patient p, Medicine m, PrescriptionAndName pm
Where p.PrescriptionNumber=pm.PrescriptionNumber and m.Name=pm.MedicineName and p.InsuranceStuation='No'
Group by p.FirstName, p.LastName, pm.MedicineName, m.SellingPrice
Having m.SellingPrice > 200
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[CertificateID] [smallint] NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[PharmacyZipCode] [int] NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacist]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacist](
	[Ssn] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Age] [tinyint] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Salary] [int] NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Pharmacist] PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffPharmacy]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffPharmacy](
	[StaffSsn] [int] NOT NULL,
	[CertificateID] [smallint] NULL,
 CONSTRAINT [PK_StaffPharmacy] PRIMARY KEY CLUSTERED 
(
	[StaffSsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StaffInformation]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StaffInformation] as
Select ps.FirstName + ' ' + ps.LastName Name, ps.Age Age
From Pharmacy p inner join StaffPharmacy sp on p.CertificateID=sp.CertificateID
inner join Pharmacist ps on sp.StaffSsn=ps.Ssn
Where ps.FirstName like '%ra%'
GO
/****** Object:  Table [dbo].[ProductiveFirm]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductiveFirm](
	[FirmName] [nvarchar](50) NOT NULL,
	[FirmZipCode] [int] NULL,
 CONSTRAINT [PK_ProductiveFirm_1] PRIMARY KEY CLUSTERED 
(
	[FirmName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MedicineFirmAddress]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MedicineFirmAddress] as
Select TOP(3) Count(m.Name) as NoOfPsycholeptics, m.FirmName as FirmName, pf.FirmZipCode as FirmZipCode
From Medicine m inner join ProductiveFirm pf on pf.FirmName=m.FirmName
Where m.Category='Psycholeptic'
Group by m.FirmName, pf.FirmZipCode
Order by Count(m.Name) desc
GO
/****** Object:  Table [dbo].[WarehouseFirm]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseFirm](
	[WarehouseName] [nvarchar](50) NOT NULL,
	[FirmName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WarehouseFirm] PRIMARY KEY CLUSTERED 
(
	[WarehouseName] ASC,
	[FirmName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyWarehouse]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyWarehouse](
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[LocationZipCode] [int] NULL,
	[PharmacyCertificateID] [smallint] NULL,
	[WarehouseNumber] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PharmacyWarehouse] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StockSituation]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockSituation] as
Select  m.StockSituationPharmacy as StockSituation, m.SellingPrice as MedicinePrice,
m.Name as MedicineName, pw.Name as PharmacyWarehouseName
From Medicine m inner join PharmacyWarehouse pw on pw.PharmacyCertificateID= m.PharmacyCertificateID
inner join WarehouseFirm wf on pw.Name=wf.WarehouseName inner join ProductiveFirm pf on pf.FirmName=wf.FirmName
Where m.SellingPrice<1000 and m.SellingPrice>35
Group By  m.StockSituationPharmacy,m.SellingPrice, m.Name, pw.Name
Having m.StockSituationPharmacy<10
GO
/****** Object:  View [dbo].[DebtNameAndShelfPlace]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Borcu olan hastaların aldığı ilaçlar ve shelfplaceleri
Create VIEW [dbo].[DebtNameAndShelfPlace] as
Select m.Name as MedicineName, m.ShelfPlace as ShelfPlace, p.FirstName + ' ' + p.LastName as PatientName, p.HasDebt as Debt
From Patient p inner join PrescriptionAndName pan on p.PrescriptionNumber=pan.PrescriptionNumber
inner join Medicine m on m.Name=pan.MedicineName
Where p.HasDebt>0
Group by m.Name, m.ShelfPlace, p.FirstName, p.LastName, p.HasDebt
GO
/****** Object:  Table [dbo].[FirmAddress]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmAddress](
	[City] [nvarchar](25) NULL,
	[District] [nvarchar](25) NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_FirmAddress] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherProducts]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherProducts](
	[Name] [nvarchar](50) NOT NULL,
	[StockSituaitonPharmacy] [int] NULL,
	[SellingPrice] [float] NULL,
	[Category] [varchar](50) NULL,
	[BuyingPrice] [float] NULL,
	[ShelfPlace] [varchar](50) NULL,
	[PharmacyCertificateID] [smallint] NOT NULL,
 CONSTRAINT [PK_OtherProducts] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientAddress]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAddress](
	[District] [nvarchar](25) NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_PatientAddress] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyAddress]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyAddress](
	[City] [nvarchar](25) NULL,
	[District] [nvarchar](25) NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_PharmacyAddress] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseLocation]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseLocation](
	[City] [nvarchar](25) NULL,
	[District] [nvarchar](25) NULL,
	[ZipCode] [int] NOT NULL,
 CONSTRAINT [PK_WarehouseLocation] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Name]    Script Date: 9.02.2021 22:12:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name] ON [dbo].[Medicine]
(
	[Name] ASC,
	[Category] ASC,
	[ShelfPlace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [Age]  DEFAULT ((0)) FOR [Age]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [HasDebt]  DEFAULT ((0)) FOR [HasDebt]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_FirmName] FOREIGN KEY([FirmName])
REFERENCES [dbo].[ProductiveFirm] ([FirmName])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_FirmName]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Pharmacy] FOREIGN KEY([PharmacyCertificateID])
REFERENCES [dbo].[Pharmacy] ([CertificateID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Pharmacy]
GO
ALTER TABLE [dbo].[OtherProducts]  WITH CHECK ADD  CONSTRAINT [FK_OtherProducts_Pharmacy] FOREIGN KEY([PharmacyCertificateID])
REFERENCES [dbo].[Pharmacy] ([CertificateID])
GO
ALTER TABLE [dbo].[OtherProducts] CHECK CONSTRAINT [FK_OtherProducts_Pharmacy]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_PatientAddress] FOREIGN KEY([PatientZipCode])
REFERENCES [dbo].[PatientAddress] ([ZipCode])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_PatientAddress]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Product_to_Patient_buys] FOREIGN KEY([ProductName])
REFERENCES [dbo].[OtherProducts] ([Name])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Product_to_Patient_buys]
GO
ALTER TABLE [dbo].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_PharmacyAddress] FOREIGN KEY([PharmacyZipCode])
REFERENCES [dbo].[PharmacyAddress] ([ZipCode])
GO
ALTER TABLE [dbo].[Pharmacy] CHECK CONSTRAINT [FK_Pharmacy_PharmacyAddress]
GO
ALTER TABLE [dbo].[PharmacyWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyWarehouse_Pharmacy] FOREIGN KEY([PharmacyCertificateID])
REFERENCES [dbo].[Pharmacy] ([CertificateID])
GO
ALTER TABLE [dbo].[PharmacyWarehouse] CHECK CONSTRAINT [FK_PharmacyWarehouse_Pharmacy]
GO
ALTER TABLE [dbo].[PharmacyWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_PharmacyWarehouse_WarehouseLocation] FOREIGN KEY([LocationZipCode])
REFERENCES [dbo].[WarehouseLocation] ([ZipCode])
GO
ALTER TABLE [dbo].[PharmacyWarehouse] CHECK CONSTRAINT [FK_PharmacyWarehouse_WarehouseLocation]
GO
ALTER TABLE [dbo].[PrescriptionAndName]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionAndName_Medicine] FOREIGN KEY([MedicineName])
REFERENCES [dbo].[Medicine] ([Name])
GO
ALTER TABLE [dbo].[PrescriptionAndName] CHECK CONSTRAINT [FK_PrescriptionAndName_Medicine]
GO
ALTER TABLE [dbo].[PrescriptionAndName]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionAndName_Patient] FOREIGN KEY([PrescriptionNumber])
REFERENCES [dbo].[Patient] ([PrescriptionNumber])
GO
ALTER TABLE [dbo].[PrescriptionAndName] CHECK CONSTRAINT [FK_PrescriptionAndName_Patient]
GO
ALTER TABLE [dbo].[ProductiveFirm]  WITH CHECK ADD  CONSTRAINT [FK_3rdNormal_ProductiveFirm_FirmAddress] FOREIGN KEY([FirmZipCode])
REFERENCES [dbo].[FirmAddress] ([ZipCode])
GO
ALTER TABLE [dbo].[ProductiveFirm] CHECK CONSTRAINT [FK_3rdNormal_ProductiveFirm_FirmAddress]
GO
ALTER TABLE [dbo].[StaffPharmacy]  WITH CHECK ADD  CONSTRAINT [FK_StaffPharmacy_Pharmacist] FOREIGN KEY([StaffSsn])
REFERENCES [dbo].[Pharmacist] ([Ssn])
GO
ALTER TABLE [dbo].[StaffPharmacy] CHECK CONSTRAINT [FK_StaffPharmacy_Pharmacist]
GO
ALTER TABLE [dbo].[StaffPharmacy]  WITH CHECK ADD  CONSTRAINT [FK_StaffPharmacy_Pharmacy] FOREIGN KEY([CertificateID])
REFERENCES [dbo].[Pharmacy] ([CertificateID])
GO
ALTER TABLE [dbo].[StaffPharmacy] CHECK CONSTRAINT [FK_StaffPharmacy_Pharmacy]
GO
ALTER TABLE [dbo].[WarehouseFirm]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseFirm_PharmacyWarehouse] FOREIGN KEY([WarehouseName])
REFERENCES [dbo].[PharmacyWarehouse] ([Name])
GO
ALTER TABLE [dbo].[WarehouseFirm] CHECK CONSTRAINT [FK_WarehouseFirm_PharmacyWarehouse]
GO
ALTER TABLE [dbo].[WarehouseFirm]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseFirm_ProductiveFirm] FOREIGN KEY([FirmName])
REFERENCES [dbo].[ProductiveFirm] ([FirmName])
GO
ALTER TABLE [dbo].[WarehouseFirm] CHECK CONSTRAINT [FK_WarehouseFirm_ProductiveFirm]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD CHECK  (([HasDebt]<(400)))
GO
/****** Object:  StoredProcedure [dbo].[sp_FirmMedicine]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_FirmMedicine]
	@firmName nvarchar(50)
AS
BEGIN
	Select *
	From Medicine
	Where FirmName = @firmName
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsuranceStuation]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_InsuranceStuation]
	@InsuranceStuation varchar(50)
AS
BEGIN
	Select p.FirstName + ' ' + p.LastName as PatientName, p.InsuranceStuation
	From Patient p
	Where InsuranceStuation = @InsuranceStuation
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MedicineWarehouse]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_MedicineWarehouse]
	@Name nvarchar(50)
AS
BEGIN
	Select m.Name, m.StockSituationPharmacy, pw.Name, pw.PhoneNumber
	From Medicine m, Pharmacy p, PharmacyWarehouse pw
	Where m.Name = @Name and m.PharmacyCertificateID=p.CertificateID and pw.PharmacyCertificateID=p.CertificateID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_OtherProductInfo]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_OtherProductInfo]
	@Category varchar(50)
AS
BEGIN
	Select op.Name, op.Category, op.ShelfPlace, op.SellingPrice
	From OtherProducts op
	Where Category = @Category
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PatientInfo]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_PatientInfo]
	@Ssn int
AS
BEGIN
	Select p.FirstName + ' ' + p.LastName as PatientName, p.PhoneNumber, p.PatientZipCode
	From Patient p
	Where Ssn = @Ssn
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PatientMedicine]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_PatientMedicine]
	@PrescriptionNumber nvarchar(25)
AS
BEGIN
	Select p.FirstName + ' ' + p.LastName as PatientName, m.Name, m.SellingPrice
	From Patient p inner join PrescriptionAndName pan on p.PrescriptionNumber = pan.PrescriptionNumber 
	inner join Medicine m on pan.MedicineName=m.Name
	Where p.PrescriptionNumber = @PrescriptionNumber
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Profits]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_Profits]
	@Name nvarchar(50)
AS
BEGIN
	Select m.Name, m.SellingPrice, m.BuyingPrice, m.SellingPrice-m.BuyingPrice as Profit
	From Medicine m
	Where m.Name = @Name
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ShelfPlace]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_ShelfPlace]
	@Category nvarchar(50)
AS
BEGIN
	Select Name, Category, ShelfPlace
	From Medicine
	Where Category = @Category
end
GO
/****** Object:  StoredProcedure [dbo].[sp_StockSituation]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_StockSituation]
	@StockSituation int
AS
BEGIN
	Select m.Name, m.StockSituationPharmacy, m.SellingPrice, m.FirmName,fa.City,fa.District, fa.ZipCode 
	From Medicine m, ProductiveFirm pf, FirmAddress fa
	Where m.StockSituationPharmacy = @StockSituation and pf.FirmName = m.FirmName and pf.FirmZipCode=fa.ZipCode
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalPrice]    Script Date: 9.02.2021 22:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_TotalPrice]
	@PrescriptionNumber nvarchar(25)
AS
BEGIN
	Select distinct p.FirstName, p.PrescriptionNumber, SUM(m.SellingPrice) as Cost
	From Medicine m, Patient p,PrescriptionAndName pan
	Where p.PrescriptionNumber = @PrescriptionNumber and pan.PrescriptionNumber=p.PrescriptionNumber and pan.MedicineName=m.Name
	Group by p.FirstName, p.PrescriptionNumber
end
GO
USE [master]
GO
ALTER DATABASE [PHARMADATA] SET  READ_WRITE 
GO
