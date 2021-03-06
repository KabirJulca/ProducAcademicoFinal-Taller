USE [master]
GO
/****** Object:  Database [ventas]    Script Date: 1/07/2022 17:01:30 ******/
CREATE DATABASE [ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ventas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [ventas] SET  MULTI_USER 
GO
ALTER DATABASE [ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ventas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ventas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ventas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ventas', N'ON'
GO
ALTER DATABASE [ventas] SET QUERY_STORE = OFF
GO
USE [ventas]
GO
/****** Object:  Schema [Seguridad]    Script Date: 1/07/2022 17:01:31 ******/
CREATE SCHEMA [Seguridad]
GO
/****** Object:  UserDefinedFunction [dbo].[Suma]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Suma](@numero1 as int,@numero2 as int)
RETURNS int
AS 
BEGIN
DECLARE @resultado as int
SET @resultado=@numero1+@numero2
RETURN @resultado
END
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idCategoria] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__categori__8A3D240C1538A73E] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apPaterno] [varchar](30) NOT NULL,
	[apMaterno] [varchar](30) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[dni] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleVenta]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleVenta](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[numFactura] [numeric](18, 0) NOT NULL,
	[idVenta] [numeric](18, 0) NOT NULL,
	[subTotal] [real] NOT NULL,
	[idProducto] [nvarchar](5) NOT NULL,
	[descuento] [money] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detalleVenta] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC,
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[numFactura] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[IVA] [real] NOT NULL,
	[total] [real] NOT NULL,
	[numPago] [int] NOT NULL,
	[descuento] [money] NULL,
 CONSTRAINT [PK__factura__C989668BFDF3359B] PRIMARY KEY CLUSTERED 
(
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modoPago]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modoPago](
	[numPago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](25) NOT NULL,
	[otroDetalles] [nvarchar](50) NULL,
 CONSTRAINT [PK__modoPago__56E7C501338E87C8] PRIMARY KEY CLUSTERED 
(
	[numPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[idCategoria] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK__producto__07F4A132F0C57D04] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idVenta] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[total] [real] NOT NULL,
	[idCliente] [numeric](18, 0) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[IVA] [money] NOT NULL,
 CONSTRAINT [PK__pedido__A9F619B72DC663B9] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[CustomPermission]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[CustomPermission](
	[CustomPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Menu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[ParentMenuID] [nchar](10) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[MenuURL] [varchar](200) NOT NULL,
	[MenuIcon] [varchar](100) NULL,
 CONSTRAINT [PK__Menu__C26AF4835D6D7718] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Modulo]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Modulo](
	[idModulo] [int] NOT NULL,
	[nameModulo] [varchar](20) NOT NULL,
	[descModulo] [varchar](250) NOT NULL,
	[dateModulo] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[ModuloPerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[ModuloPerfil](
	[idPerfil] [int] NOT NULL,
	[idModulo] [int] NOT NULL,
 CONSTRAINT [PK_ModuloPerfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC,
	[idModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Perfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Perfil](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[namePerfil] [varchar](100) NOT NULL,
	[descPerfil] [varchar](250) NOT NULL,
	[datePerfil] [date] NOT NULL,
 CONSTRAINT [PK__Perfil__40F13B600FB20B5C] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[PerfilUsuario]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[PerfilUsuario](
	[idUsuario] [int] NOT NULL,
	[idPerfil] [int] NOT NULL,
 CONSTRAINT [PK_PerfilUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Permission]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[idModulo] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Rol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nameRol] [varchar](250) NOT NULL,
	[descRol] [varchar](250) NOT NULL,
	[dateRol] [date] NOT NULL,
	[idModulo] [int] NOT NULL,
 CONSTRAINT [PK__Rol__3C872F76226AA9CF] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[RolUsuario]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[RolUsuario](
	[idUsuario] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_RolUsuario_1] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Usuario]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[loginUsuario] [varchar](15) NOT NULL,
	[passUsuario] [varchar](10) NOT NULL,
	[emailUsuario] [varchar](50) NOT NULL,
	[pathImgUsuario] [varchar](180) NULL,
	[nombreUsuario] [varchar](100) NOT NULL,
	[DNI] [nvarchar](8) NOT NULL,
	[telefono] [nvarchar](15) NOT NULL,
	[appaterno] [varchar](100) NOT NULL,
	[apmaterno] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Usuario__645723A66F488ED4] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'med01', N'MEDIAS', N'MEDIAS')
INSERT [dbo].[categoria] ([idCategoria], [nombre], [descripcion]) VALUES (N'Sht1', N'Short', N'Short')
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [dni]) VALUES (CAST(2 AS Numeric(18, 0)), N'Segundo', N'Asenjo', N'Saavedra', N'JLO', N'979190294', CAST(75468977 AS Numeric(8, 0)))
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[detalleVenta] ON 

INSERT [dbo].[detalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [descuento], [cantidad]) VALUES (1, CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), 46, N'medku', 0.0000, 2)
SET IDENTITY_INSERT [dbo].[detalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[factura] ON 

INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(N'2019-07-02' AS Date), 18, 9.63, 1, NULL)
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(N'2019-07-13' AS Date), 18, 73.83, 1, NULL)
INSERT [dbo].[factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(N'2022-06-24' AS Date), 18, 46, 1, NULL)
SET IDENTITY_INSERT [dbo].[factura] OFF
GO
SET IDENTITY_INSERT [dbo].[modoPago] ON 

INSERT [dbo].[modoPago] ([numPago], [nombre], [otroDetalles]) VALUES (1, N'EFECTIVO', N'PAGO EN EFECTIVO')
SET IDENTITY_INSERT [dbo].[modoPago] OFF
GO
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'medku', N'medias kukui', 23.0000, N'med01')
INSERT [dbo].[producto] ([idProducto], [nombre], [precioUnitario], [idCategoria]) VALUES (N'meku2', N'MEDIAS rosas', 25.0000, N'med01')
GO
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([idVenta], [total], [idCliente], [idUsuario], [fecha], [IVA]) VALUES (CAST(1 AS Numeric(18, 0)), 46, CAST(2 AS Numeric(18, 0)), 1, CAST(N'2022-06-24' AS Date), 18.0000)
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
SET IDENTITY_INSERT [Seguridad].[CustomPermission] ON 

INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (19, 2, 9)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (20, 2, 10)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (21, 2, 11)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (22, 2, 12)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (23, 2, 13)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (24, 2, 14)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (25, 2, 15)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (26, 2, 16)
INSERT [Seguridad].[CustomPermission] ([CustomPermissionID], [idUsuario], [MenuID]) VALUES (27, 2, 23)
SET IDENTITY_INSERT [Seguridad].[CustomPermission] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Menu] ON 

INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (1, N'Principal', N'0         ', 1, N'#', N'fa fa-briefcase')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (2, N'Articulos', N'0         ', 2, N'#', N'fa fa-credit-card')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (3, N'Ventas', N'0         ', 3, N'#', N'fa fa-gears')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (4, N'Clientes', N'0         ', 4, N'#', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (5, N'Inventario', N'0         ', 5, N'#', N'fa fa-truck')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (6, N'Cobros y pagos', N'0         ', 6, N'#', N'fa fa-bar-chart-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (8, N'Sistema', N'0         ', 8, N'#', N'fa fa-gear')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (9, N'Categorias', N'2         ', 1, N'/Categoria/Index', N'fa fa-user')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (10, N'Buscar Producto', N'2         ', 2, N'/Producto/BuscarProductos', N'fa fa-credit-card')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (11, N'Articulos', N'2         ', 3, N'/Producto/Index', N'fa fa-gears')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (12, N'Inventario', N'2         ', 4, N'#', N'fa fa-gears')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (13, N'Generar Factura', N'3         ', 1, N'/Venta/VentaFactura', N'fa fa-gears')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (14, N'Nueva Venta', N'3         ', 2, N'/Venta/NuevaVenta', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (15, N'Detalle Venta', N'3         ', 3, N'/DetalleVenta/Index', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (16, N'Reportes', N'3         ', 4, N'/Venta/ReporteVentas', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (17, N'Modos Pago', N'6         ', 1, N'/ModoPago/Index', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (18, N'Pagos', N'6         ', 2, N'#', N'fa fa-building-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (19, N'Cobros', N'6         ', 3, N'#', N'fa fa-bar-chart-o')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (20, N'Users', N'8         ', 1, N'/AdminUsers/Index', N'fa fa-gear')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (21, N'Roles', N'8         ', 2, N'/AdminRoles/Index', N'fa fa-gear')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (22, N'Permission', N'8         ', 3, N'/Permissions/Index', N'fa fa-gear')
INSERT [Seguridad].[Menu] ([MenuID], [DisplayName], [ParentMenuID], [OrderNumber], [MenuURL], [MenuIcon]) VALUES (23, N'Cliente', N'4         ', 1, N'/Cliente/Index', N'')
SET IDENTITY_INSERT [Seguridad].[Menu] OFF
GO
INSERT [Seguridad].[Modulo] ([idModulo], [nameModulo], [descModulo], [dateModulo]) VALUES (1, N'Administrador', N'Modulo que controla los perfiles del sistema!', CAST(N'2014-01-03' AS Date))
INSERT [Seguridad].[Modulo] ([idModulo], [nameModulo], [descModulo], [dateModulo]) VALUES (2, N'Gerencia', N'Modulo para administrar los usuarios del sistema!', CAST(N'2014-01-03' AS Date))
INSERT [Seguridad].[Modulo] ([idModulo], [nameModulo], [descModulo], [dateModulo]) VALUES (3, N'Trabajador', N'Módulo para administrar los modulos que van a usarse en el sistema!', CAST(N'2014-01-08' AS Date))
INSERT [Seguridad].[Modulo] ([idModulo], [nameModulo], [descModulo], [dateModulo]) VALUES (4, N'RRHH', N'Modulo de asignación de Roles!', CAST(N'2014-01-09' AS Date))
GO
INSERT [Seguridad].[ModuloPerfil] ([idPerfil], [idModulo]) VALUES (1, 1)
INSERT [Seguridad].[ModuloPerfil] ([idPerfil], [idModulo]) VALUES (1, 2)
INSERT [Seguridad].[ModuloPerfil] ([idPerfil], [idModulo]) VALUES (1, 3)
INSERT [Seguridad].[ModuloPerfil] ([idPerfil], [idModulo]) VALUES (1, 4)
GO
SET IDENTITY_INSERT [Seguridad].[Perfil] ON 

INSERT [Seguridad].[Perfil] ([idPerfil], [namePerfil], [descPerfil], [datePerfil]) VALUES (1, N'ADMINISTRADOR', N'Usuarios Básicos', CAST(N'2014-01-03' AS Date))
INSERT [Seguridad].[Perfil] ([idPerfil], [namePerfil], [descPerfil], [datePerfil]) VALUES (2, N'GERENTE', N'Usuarios Administradores', CAST(N'2014-01-03' AS Date))
INSERT [Seguridad].[Perfil] ([idPerfil], [namePerfil], [descPerfil], [datePerfil]) VALUES (3, N'ESTUDIANTE', N'Este es un perfil creado para solo estudiantes!', CAST(N'2014-01-08' AS Date))
INSERT [Seguridad].[Perfil] ([idPerfil], [namePerfil], [descPerfil], [datePerfil]) VALUES (4, N'DOCENTE', N'Este perfil es para que los docentes puedan entrar!', CAST(N'2014-01-09' AS Date))
SET IDENTITY_INSERT [Seguridad].[Perfil] OFF
GO
INSERT [Seguridad].[PerfilUsuario] ([idUsuario], [idPerfil]) VALUES (1, 1)
INSERT [Seguridad].[PerfilUsuario] ([idUsuario], [idPerfil]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [Seguridad].[Permission] ON 

INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (3, 1, 1)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (4, 1, 2)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (5, 1, 3)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (6, 1, 4)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (7, 1, 5)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (8, 1, 6)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (10, 1, 8)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (11, 1, 9)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (12, 1, 10)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (13, 1, 11)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (14, 1, 12)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (15, 1, 13)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (16, 1, 14)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (17, 1, 15)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (18, 1, 16)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (19, 1, 17)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (20, 1, 18)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (21, 1, 19)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (22, 1, 20)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (23, 1, 21)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (24, 1, 22)
INSERT [Seguridad].[Permission] ([PermissionID], [idModulo], [MenuID]) VALUES (25, 1, 23)
SET IDENTITY_INSERT [Seguridad].[Permission] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Rol] ON 

INSERT [Seguridad].[Rol] ([idRol], [nameRol], [descRol], [dateRol], [idModulo]) VALUES (1, N'ADMINISTRACION', N'MODULO DE ADMINISTRACION', CAST(N'2019-12-12' AS Date), 1)
INSERT [Seguridad].[Rol] ([idRol], [nameRol], [descRol], [dateRol], [idModulo]) VALUES (2, N'GERENCIA', N'MODULO DE GERENCIA', CAST(N'2019-12-12' AS Date), 2)
INSERT [Seguridad].[Rol] ([idRol], [nameRol], [descRol], [dateRol], [idModulo]) VALUES (4, N'RECURSOS HUMANOS', N'MODULO DE RECURSOS HUMANOS', CAST(N'2019-12-12' AS Date), 3)
INSERT [Seguridad].[Rol] ([idRol], [nameRol], [descRol], [dateRol], [idModulo]) VALUES (5, N'SUPERVISOR', N'MODULO DE SUPERVISORES', CAST(N'2019-12-12' AS Date), 4)
SET IDENTITY_INSERT [Seguridad].[Rol] OFF
GO
INSERT [Seguridad].[RolUsuario] ([idUsuario], [idRol]) VALUES (1, 1)
INSERT [Seguridad].[RolUsuario] ([idUsuario], [idRol]) VALUES (1, 4)
INSERT [Seguridad].[RolUsuario] ([idUsuario], [idRol]) VALUES (1, 5)
INSERT [Seguridad].[RolUsuario] ([idUsuario], [idRol]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] ON 

INSERT [Seguridad].[Usuario] ([idUsuario], [loginUsuario], [passUsuario], [emailUsuario], [pathImgUsuario], [nombreUsuario], [DNI], [telefono], [appaterno], [apmaterno]) VALUES (1, N'kabir', N'admin', N'admin@mail.com', N'none', N'KABIR', N'12345678', N'979190294', N'julca ', N'bruno')
INSERT [Seguridad].[Usuario] ([idUsuario], [loginUsuario], [passUsuario], [emailUsuario], [pathImgUsuario], [nombreUsuario], [DNI], [telefono], [appaterno], [apmaterno]) VALUES (2, N'gerente', N'gerente', N'gerente@mail.com', N'none', N'LUIS', N'12345678', N'989898987', N'vilchez', N'baila')
SET IDENTITY_INSERT [Seguridad].[Usuario] OFF
GO
/****** Object:  Index [UQ__cliente__D87608A7AA045327]    Script Date: 1/07/2022 17:01:31 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_CustomPermission]    Script Date: 1/07/2022 17:01:31 ******/
ALTER TABLE [Seguridad].[CustomPermission] ADD  CONSTRAINT [UK_CustomPermission] UNIQUE NONCLUSTERED 
(
	[idUsuario] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Permission]    Script Date: 1/07/2022 17:01:31 ******/
ALTER TABLE [Seguridad].[Permission] ADD  CONSTRAINT [UK_Permission] UNIQUE NONCLUSTERED 
(
	[idModulo] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [loginUsuario]    Script Date: 1/07/2022 17:01:31 ******/
ALTER TABLE [Seguridad].[Usuario] ADD  CONSTRAINT [loginUsuario] UNIQUE NONCLUSTERED 
(
	[loginUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK__detalleFa__idPed__239E4DCF] FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([idVenta])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK__detalleFa__idPed__239E4DCF]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_factura] FOREIGN KEY([numFactura])
REFERENCES [dbo].[factura] ([numFactura])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK_detalleFactura_factura]
GO
ALTER TABLE [dbo].[detalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalleVenta] CHECK CONSTRAINT [FK_detalleFactura_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_modoPago] FOREIGN KEY([numPago])
REFERENCES [dbo].[modoPago] ([numPago])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_modoPago]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK__producto__idCate__164452B1] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK__producto__idCate__164452B1]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idUsuario__151B244E] FOREIGN KEY([idUsuario])
REFERENCES [Seguridad].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idUsuario__151B244E]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [Seguridad].[CustomPermission]  WITH CHECK ADD  CONSTRAINT [FK_CustomPermission_Menu] FOREIGN KEY([MenuID])
REFERENCES [Seguridad].[Menu] ([MenuID])
GO
ALTER TABLE [Seguridad].[CustomPermission] CHECK CONSTRAINT [FK_CustomPermission_Menu]
GO
ALTER TABLE [Seguridad].[CustomPermission]  WITH CHECK ADD  CONSTRAINT [FK_CustomPermission_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [Seguridad].[Usuario] ([idUsuario])
GO
ALTER TABLE [Seguridad].[CustomPermission] CHECK CONSTRAINT [FK_CustomPermission_Usuario]
GO
ALTER TABLE [Seguridad].[ModuloPerfil]  WITH CHECK ADD  CONSTRAINT [FK_ModuloPerfil_Modulo] FOREIGN KEY([idModulo])
REFERENCES [Seguridad].[Modulo] ([idModulo])
GO
ALTER TABLE [Seguridad].[ModuloPerfil] CHECK CONSTRAINT [FK_ModuloPerfil_Modulo]
GO
ALTER TABLE [Seguridad].[ModuloPerfil]  WITH CHECK ADD  CONSTRAINT [FK_ModuloPerfil_Perfil] FOREIGN KEY([idPerfil])
REFERENCES [Seguridad].[Perfil] ([idPerfil])
GO
ALTER TABLE [Seguridad].[ModuloPerfil] CHECK CONSTRAINT [FK_ModuloPerfil_Perfil]
GO
ALTER TABLE [Seguridad].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_Perfil] FOREIGN KEY([idPerfil])
REFERENCES [Seguridad].[Perfil] ([idPerfil])
GO
ALTER TABLE [Seguridad].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_Perfil]
GO
ALTER TABLE [Seguridad].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [Seguridad].[Usuario] ([idUsuario])
GO
ALTER TABLE [Seguridad].[PerfilUsuario] CHECK CONSTRAINT [FK_PerfilUsuario_Usuario]
GO
ALTER TABLE [Seguridad].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Menu] FOREIGN KEY([MenuID])
REFERENCES [Seguridad].[Menu] ([MenuID])
GO
ALTER TABLE [Seguridad].[Permission] CHECK CONSTRAINT [FK_Permission_Menu]
GO
ALTER TABLE [Seguridad].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Modulo] FOREIGN KEY([idModulo])
REFERENCES [Seguridad].[Modulo] ([idModulo])
GO
ALTER TABLE [Seguridad].[Permission] CHECK CONSTRAINT [FK_Permission_Modulo]
GO
ALTER TABLE [Seguridad].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Modulo] FOREIGN KEY([idModulo])
REFERENCES [Seguridad].[Modulo] ([idModulo])
GO
ALTER TABLE [Seguridad].[Rol] CHECK CONSTRAINT [FK_Rol_Modulo]
GO
ALTER TABLE [Seguridad].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Rol] FOREIGN KEY([idRol])
REFERENCES [Seguridad].[Rol] ([idRol])
GO
ALTER TABLE [Seguridad].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Rol]
GO
ALTER TABLE [Seguridad].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [Seguridad].[Usuario] ([idUsuario])
GO
ALTER TABLE [Seguridad].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[reporte_factura]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[reporte_factura] 
@idPedido nvarchar(5)
AS
	SELECT

	pd.idPedido,pr.nombre AS Descripcion, pr.precioUnitario AS 'Precio Venta',
	pd.cantidad AS Cantidad,pd.descuento AS Descuento,
	(cl.nombre+' '+cl.apPaterno) AS Cliente,(ve.nombre+' '+ve.apPaterno)AS Vendedor,ca.nombre AS Categoria,
	mp.nombre AS 'Modo Pago' FROM pedido pd INNER JOIN detalleFactura df ON pd.idPedido=df.idPedido
	INNER JOIN cliente cl ON cl.idCliente=pd.idCliente INNER JOIN producto pr
	ON pr.idProducto=pd.idProducto INNER JOIN categoria ca ON ca.idCategoria=pr.idCategoria INNER JOIN vendedor ve
	ON ve.idVendedor=pd.idVendedor INNER JOIN factura fa ON fa.numFactura=df.numFactura INNER JOIN modoPago mp
	ON mp.numPago=fa.numPago WHERE pd.idPedido=@idPedido

GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarMenu]
	@idMenu int
	AS 
	SELECT*FROM Seguridad.Menu WHERE MenuID=@idMenu 
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarPerfil]
@idPerfil int
AS 
	SELECT*FROM Seguridad.Perfil WHERE idPerfil=@idPerfil
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarRol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR PROCEDIMIENTO SP_BuscarRol
CREATE PROCEDURE [dbo].[SP_BuscarRol]
@idRol int
AS
	SELECT*FROM  Seguridad.Rol
	WHERE idRol=@idRol
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateCustomPermission]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateCustomPermission]
@idUsuario int,
@idMenu int
AS
	INSERT INTO Seguridad.CustomPermission(idUsuario,MenuID) VALUES(@idUsuario,@idMenu)
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateMenu]
@nombre varchar(50),
@parent nchar(10),
@numOrden int,
@URL varchar(200),
@menuIcon varchar(100)
AS
	INSERT INTO Seguridad.Menu(DisplayName,ParentMenuID,OrderNumber,MenuURL,MenuIcon)
	VALUES(@nombre,@parent,@numOrden,@URL,@menuIcon)
GO
/****** Object:  StoredProcedure [dbo].[SP_CreatePerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR PROCEDIMIENTO SP_CreatePerfil
CREATE PROCEDURE [dbo].[SP_CreatePerfil]
@namePerfil varchar(100),
@descPerfil varchar(250),
@datePerfil date
AS 
	INSERT INTO Seguridad.Perfil(namePerfil,descPerfil,datePerfil)
	VALUES(@namePerfil,@descPerfil,@datePerfil)
GO
/****** Object:  StoredProcedure [dbo].[SP_CreatePermission]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CreatePermission]
@idModulo int,
@idMenu int
AS
	INSERT INTO Seguridad.Permission(idModulo,MenuID) VALUES(@idModulo,@idMenu)
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateRol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR PROCEDIMIENTO SP_CreateRol
CREATE PROCEDURE [dbo].[SP_CreateRol]
@nameRol varchar(100),
@descRol varchar(100),
@dateRol date,
@idModulo int
AS
	INSERT INTO Seguridad.Rol(nameRol,descRol,dateRol,idModulo)
	VALUES(@nameRol,@descRol,@dateRol,@idModulo)
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateUser]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateUser]
@loginUsuario varchar(100),
@passUsuario varchar(100),
@emailUsuario varchar(100),
@pathImgUsuario varchar(100),
@nombreUsuario varchar(100)
AS
	INSERT INTO Seguridad.Usuario(loginUsuario,passUsuario,emailUsuario,pathImgUsuario,nombreUsuario)
	VALUES(@loginUsuario,@passUsuario,@emailUsuario,@pathImgUsuario,@nombreUsuario)
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarMenu]
@idMenu int
AS
	DELETE Seguridad.Menu WHERE MenuID=@idMenu
 
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarPerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarPerfil]
@idPerfil int
AS 
	DELETE Seguridad.Perfil WHERE idPerfil=@idPerfil
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarRol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarRol]
@idRol int
AS
	DELETE  Seguridad.Rol
	WHERE idRol=@idRol
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetMenu]
@idUsuario int,
@idModulo int
AS
if(@idModulo!=0)
BEGIN
	WITH QPermission AS (
	SELECT a.MenuID, a.DisplayName, a.ParentMenuID,b.PermissionID FROM Seguridad.Menu a
	LEFT JOIN Seguridad.Permission b 
	ON b.MenuID = a.MenuID and b.idModulo=@idModulo)
	SELECT q.MenuID, q.DisplayName,q.ParentMenuID,PermissionType=0, Permission= CASE WHEN(ISNULL(q.PermissionID,0))=0 THEN CONVERT(BIT,0) ELSE CONVERT(BIT,1) END FROM QPermission q
END
else if(@idUsuario!=0)
begin
	WITH QPermission AS (
	SELECT a.MenuID, a.DisplayName, a.ParentMenuID,b.CustomPermissionID FROM Seguridad.Menu a
	LEFT JOIN Seguridad.CustomPermission b 	ON b.MenuID = a.MenuID AND b.idUsuario=@idUsuario)
	SELECT q.MenuID, q.DisplayName,q.ParentMenuID,PermissionType=1, Permission= CASE WHEN(ISNULL(q.CustomPermissionID,0))=0 THEN CONVERT(BIT,0) ELSE CONVERT(BIT,1) END FROM QPermission q

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenuBack]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetMenuBack]
@idUser int
AS
SELECT 
	Seguridad.Usuario.idUsuario,
	Seguridad.RolUsuario.idRol,
	Seguridad.Rol.nameRol,
	Seguridad.Modulo.nameModulo,
	Seguridad.Menu.MenuID,
	Seguridad.Menu.DisplayName,
	Seguridad.Menu.ParentMenuID, 
	Seguridad.Menu.OrderNumber, 
	Seguridad.Menu.MenuURL, 
	Seguridad.Menu.MenuIcon
	FROM Seguridad.RolUsuario
	INNER JOIN Seguridad.Rol ON  Seguridad.RolUsuario.idRol=Seguridad.Rol.idRol
	INNER JOIN Seguridad.Modulo ON Seguridad.Modulo.idModulo=Seguridad.Rol.idModulo 
	INNER JOIN Seguridad.Permission ON Seguridad.Permission.idModulo=Seguridad.Modulo.idModulo
	INNER JOIN Seguridad.Menu ON Seguridad.Permission.MenuID=Seguridad.Menu.MenuID
	INNER JOIN Seguridad.Usuario ON Seguridad.RolUsuario.idUsuario=Seguridad.Usuario.idUsuario
	WHERE Seguridad.Usuario.idUsuario=@idUser
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenuByModulo]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetMenuByModulo]
@idModulo int
AS
SELECT 
	Seguridad.Modulo.nameModulo,
	Seguridad.Menu.MenuID,
	Seguridad.Menu.DisplayName,
	Seguridad.Menu.ParentMenuID, 
	Seguridad.Menu.OrderNumber, 
	Seguridad.Menu.MenuURL, 
	Seguridad.Menu.MenuIcon
	FROM Seguridad.Modulo
	INNER JOIN Seguridad.Permission ON Seguridad.Modulo.idModulo=Seguridad.Permission.idModulo
	INNER JOIN Seguridad.Menu ON Seguridad.Permission.MenuID=Seguridad.Menu.MenuID
	WHERE Seguridad.Modulo.idModulo=@idModulo
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_clientes]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_lista_clientes]
@pageIndex int=1,
@pageSize int=10,
@pageCount int=0 out
AS
	SET @pageCount=(SELECT count(1) FROM cliente)/@pageSize
	SELECT*FROM (SELECT row_number()over (order by idCliente)RowId,* FROM cliente)cliente WHERE idCliente BETWEEN(@pageSize*(@pageIndex-1)+1)and(@pageIndex*@pageSize)

GO
/****** Object:  StoredProcedure [dbo].[SP_ListaMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaMenu]
AS
	SELECT*FROM Seguridad.Menu
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaPerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaPerfil]
AS 
	SELECT*FROM Seguridad.Perfil
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaRol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR PROCEDIMIENTO SP_ListaRol
CREATE PROCEDURE [dbo].[SP_ListaRol]
@idRol int
AS
	SELECT*FROM  Seguridad.Rol
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LoadMenu]
@idUser int
AS
	SELECT Seguridad.Menu.MenuID,
		Seguridad.Menu.DisplayName,
		Seguridad.Menu.ParentMenuID, 
		Seguridad.Menu.OrderNumber, 
		Seguridad.Menu.MenuURL, 
		Seguridad.Menu.MenuIcon
	FROM Seguridad.RolUsuario
	INNER JOIN Seguridad.Rol ON  Seguridad.RolUsuario.idRol=Seguridad.Rol.idRol
	INNER JOIN Seguridad.Modulo ON Seguridad.Modulo.idModulo=Seguridad.Rol.idModulo
	INNER JOIN Seguridad.Permission ON Seguridad.Permission.idModulo=Seguridad.Modulo.idModulo
	INNER JOIN Seguridad.Menu ON Seguridad.Permission.MenuID=Seguridad.Menu.MenuID
	INNER JOIN Seguridad.Usuario ON Seguridad.RolUsuario.idUsuario=Seguridad.Usuario.idUsuario
	WHERE Seguridad.Usuario.idUsuario=@idUser
	UNION ALL
		SELECT Seguridad.Menu.MenuID,
		Seguridad.Menu.DisplayName,
		Seguridad.Menu.ParentMenuID, 
		Seguridad.Menu.OrderNumber, 
		Seguridad.Menu.MenuURL, 
		Seguridad.Menu.MenuIcon
		FROM Seguridad.Menu	
		INNER JOIN Seguridad.CustomPermission ON Seguridad.CustomPermission.MenuID = Seguridad.Menu.MenuID
		INNER JOIN Seguridad.Usuario ON Seguridad.Usuario.idUsuario =Seguridad.CustomPermission.idUsuario	
		WHERE Seguridad.Usuario.idUsuario=@idUser

GO
/****** Object:  StoredProcedure [dbo].[sp_producto_categoria]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_producto_categoria]
@idCategoria varchar(5)
AS
	SELECT*FROM producto p INNER JOIN categoria c
	ON p.idCategoria=c.idCategoria
	WHERE c.idCategoria=@idCategoria
GO
/****** Object:  StoredProcedure [dbo].[sp_reporte_venta]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_reporte_venta]
@idVenta numeric(18,0)
AS 
	SELECT v.idVenta,(usu.nombreUsuario+' '+usu.apPaterno+' '+usu.apMaterno)AS Trabajador, 
	(cl.nombre+' '+cl.apPaterno+' '+cl.apMaterno)AS Cliente, cl.direccion,cl.dni,cl.telefono,
	v.fecha,v.total,v.IVA,dv.descuento,pr.nombre,pr.precioUnitario,dv.cantidad,dv.numFactura,dv.subTotal,
	(dv.cantidad*pr.precioUnitario-dv.descuento)AS total_parcial

	FROM detalleVenta dv INNER JOIN producto pr ON dv.idProducto=pr.idProducto
	INNER JOIN venta v ON dv.idVenta=v.idVenta
	INNER JOIN Seguridad.Usuario usu ON usu.idUsuario=v.idUsuario
	INNER JOIN cliente cl ON cl.idCliente=v.idCliente
	WHERE v.idVenta=@idVenta
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateMenu]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREAR PROCEDIMIENTO DE ALMACENADO SP_UpdateMenu
CREATE PROCEDURE [dbo].[SP_UpdateMenu]
@idMenu int,
@nombre varchar(50),
@parent nchar(10),
@numOrden int,
@URL varchar(200),
@menuIcon varchar(100)
AS
	UPDATE Seguridad.Menu 
	SET DisplayName=@nombre,ParentMenuID=@parent,OrderNumber=@numOrden,MenuURL=@URL,MenuIcon=@menuIcon
	WHERE MenuID=@idMenu
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePerfil]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdatePerfil]
@idPerfil int,
@namePerfil varchar(100),
@descPerfil varchar(250),
@datePerfil date
AS 
	UPDATE  Seguridad.Perfil
	SET namePerfil=@namePerfil,descPerfil=@descPerfil,datePerfil=@datePerfil
	WHERE idPerfil=@idPerfil
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRol]    Script Date: 1/07/2022 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateRol]
@idRol int,
@nameRol varchar(100),
@descRol varchar(100),
@dateRol date,
@idModulo int
AS
	UPDATE Seguridad.Rol
	SET nameRol=@nameRol,descRol=@descRol,dateRol=@dateRol,idModulo=@idModulo
WHERE idRol=@idRol
GO
USE [master]
GO
ALTER DATABASE [ventas] SET  READ_WRITE 
GO
