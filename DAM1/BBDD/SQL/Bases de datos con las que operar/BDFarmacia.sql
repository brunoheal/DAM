USE [master]
GO
/****** Object:  Database [farmacia]    Script Date: 06/02/2018 19:53:47 ******/
CREATE DATABASE [farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\farmacia.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\farmacia_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [farmacia] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [farmacia] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [farmacia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [farmacia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
USE [farmacia]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[cod_cli] [varchar](8) NOT NULL,
	[nom_cli] [varchar](40) NOT NULL,
	[dir_cli] [varchar](40) NULL,
	[cod_dis] [varchar](8) NULL,
	[sexo] [char](1) NOT NULL,
	[dni] [varchar](9) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
 CONSTRAINT [p_cod_cli] PRIMARY KEY CLUSTERED 
(
	[cod_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distrito]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distrito](
	[cod_dis] [varchar](8) NOT NULL,
	[nom_dis] [varchar](40) NOT NULL,
 CONSTRAINT [pk_distrito] PRIMARY KEY CLUSTERED 
(
	[cod_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[cod_emp] [varchar](8) NOT NULL,
	[nom_emp] [varchar](40) NOT NULL,
	[dir_emp] [varchar](40) NULL,
	[cod_dis] [varchar](8) NOT NULL,
	[cargo] [varchar](40) NOT NULL,
	[edad] [int] NULL,
	[tel] [char](9) NOT NULL,
	[ingreso] [datetime] NOT NULL,
	[clave] [varchar](20) NOT NULL,
 CONSTRAINT [pk_empleado] PRIMARY KEY CLUSTERED 
(
	[cod_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[factura]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[factura](
	[num_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cod_empl] [varchar](8) NOT NULL,
	[cod_cli] [varchar](8) NOT NULL,
	[num_ordenpedido] [int] NOT NULL,
	[subtotal] [money] NOT NULL,
	[descuento] [int] NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[num_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ordenpedido]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ordenpedido](
	[num_ordenpedido] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cod_cli] [varchar](8) NULL,
	[cod_emp] [varchar](8) NULL,
	[cod_prod] [varchar](8) NULL,
	[cod_tipopago] [varchar](8) NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [pk_ordenpedido] PRIMARY KEY CLUSTERED 
(
	[num_ordenpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[cod_pro] [varchar](8) NOT NULL,
	[nom_pro] [varchar](40) NOT NULL,
	[prec_venta] [numeric](10, 2) NOT NULL,
	[prec_compra] [numeric](10, 2) NOT NULL,
	[fecha_venc] [date] NOT NULL,
	[stock] [int] NOT NULL,
	[cod_prov] [varchar](8) NOT NULL,
 CONSTRAINT [pk_producto] PRIMARY KEY CLUSTERED 
(
	[cod_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[cod_prov] [varchar](8) NOT NULL,
	[nom_prov] [varchar](40) NULL,
	[dir_prov] [varchar](50) NULL,
	[telefono] [char](9) NULL,
	[id_distrito] [varchar](8) NULL,
 CONSTRAINT [pk_proveedor] PRIMARY KEY CLUSTERED 
(
	[cod_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/02/2018 19:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[cod_usu] [varchar](8) NOT NULL,
	[cod_emp] [varchar](8) NOT NULL,
	[nivel_usu] [varchar](2) NOT NULL,
	[nom_usu] [varchar](30) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[activo] [varchar](2) NOT NULL,
 CONSTRAINT [pk_cod_usu] PRIMARY KEY CLUSTERED 
(
	[cod_usu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_dni]    Script Date: 06/02/2018 19:53:47 ******/
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [uq_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_nombre]    Script Date: 06/02/2018 19:53:47 ******/
ALTER TABLE [dbo].[distrito] ADD  CONSTRAINT [uq_nombre] UNIQUE NONCLUSTERED 
(
	[nom_dis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordenpedido] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk_cod_dis] FOREIGN KEY([cod_dis])
REFERENCES [dbo].[distrito] ([cod_dis])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk_cod_dis]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [fk_emp_dis] FOREIGN KEY([cod_dis])
REFERENCES [dbo].[distrito] ([cod_dis])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [fk_emp_dis]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [fk_pedido] FOREIGN KEY([num_factura])
REFERENCES [dbo].[ordenpedido] ([num_ordenpedido])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [fk_pedido]
GO
ALTER TABLE [dbo].[ordenpedido]  WITH CHECK ADD  CONSTRAINT [fk_cod_cli] FOREIGN KEY([cod_cli])
REFERENCES [dbo].[clientes] ([cod_cli])
GO
ALTER TABLE [dbo].[ordenpedido] CHECK CONSTRAINT [fk_cod_cli]
GO
ALTER TABLE [dbo].[ordenpedido]  WITH CHECK ADD  CONSTRAINT [fk_cod_emp] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[empleado] ([cod_emp])
GO
ALTER TABLE [dbo].[ordenpedido] CHECK CONSTRAINT [fk_cod_emp]
GO
ALTER TABLE [dbo].[ordenpedido]  WITH CHECK ADD  CONSTRAINT [fk_cod_prod] FOREIGN KEY([cod_prod])
REFERENCES [dbo].[producto] ([cod_pro])
GO
ALTER TABLE [dbo].[ordenpedido] CHECK CONSTRAINT [fk_cod_prod]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_prov] FOREIGN KEY([cod_prov])
REFERENCES [dbo].[proveedor] ([cod_prov])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_prov]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_emp] FOREIGN KEY([cod_emp])
REFERENCES [dbo].[empleado] ([cod_emp])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_emp]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [ch_sexo] CHECK  (([sexo]='f' OR [sexo]='m'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [ch_sexo]
GO
USE [master]
GO
ALTER DATABASE [farmacia] SET  READ_WRITE 
GO
