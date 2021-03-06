USE [QuanLyBanHang]
GO
/****** Object:  Table [dbo].[center_manager]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[center_manager](
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_center_manager] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_import_invoice]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_import_invoice](
	[import_invoice_id] [nvarchar](50) NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_detail_import_invoice] PRIMARY KEY CLUSTERED 
(
	[import_invoice_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_invoice]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_invoice](
	[product_id] [nvarchar](50) NOT NULL,
	[invoice_id] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_detail_invoice] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_stock]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_stock](
	[store_id] [nvarchar](50) NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[sell_quantity] [int] NOT NULL,
 CONSTRAINT [PK_detail_stock] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history_staff]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[description] [nvarchar](552) NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_history_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_invoice]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_invoice](
	[id] [nvarchar](50) NOT NULL,
	[store_id] [nvarchar](50) NOT NULL,
	[store_manager_id] [int] NOT NULL,
	[import_invoice_date] [date] NOT NULL,
	[total_price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_import_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[user_id] [int] NOT NULL,
	[sale_date] [datetime] NOT NULL,
	[discount] [decimal](3, 0) NOT NULL,
	[total_price] [decimal](18, 3) NOT NULL,
	[discount_price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
	[import_price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reason_invoice]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reason_invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_id] [nvarchar](50) NOT NULL,
	[description] [nvarchar](552) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_reason_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary_staff]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary_staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[start_time] [date] NOT NULL,
	[end_time] [date] NOT NULL,
	[salary] [decimal](20, 3) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[work_date] [int] NOT NULL,
 CONSTRAINT [PK_salary_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[user_id] [int] NOT NULL,
	[staff_no] [nvarchar](255) NOT NULL,
	[rank] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_staff_no] UNIQUE NONCLUSTERED 
(
	[staff_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_work_time]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_work_time](
	[staff_id] [int] NOT NULL,
	[work_time_id] [int] NOT NULL,
 CONSTRAINT [PK_staff_work_time] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC,
	[work_time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_store] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store_manager]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_manager](
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_store_manager] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[role_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[birthday] [date] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[work_time]    Script Date: 1/3/2022 10:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[work_time](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [int] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_work_time] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[center_manager]  WITH CHECK ADD  CONSTRAINT [FK_Center_Manager] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[center_manager] CHECK CONSTRAINT [FK_Center_Manager]
GO
ALTER TABLE [dbo].[detail_import_invoice]  WITH CHECK ADD  CONSTRAINT [FK_detail_import_invoice1] FOREIGN KEY([import_invoice_id])
REFERENCES [dbo].[import_invoice] ([id])
GO
ALTER TABLE [dbo].[detail_import_invoice] CHECK CONSTRAINT [FK_detail_import_invoice1]
GO
ALTER TABLE [dbo].[detail_import_invoice]  WITH CHECK ADD  CONSTRAINT [FK_detail_import_invoice2] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[detail_import_invoice] CHECK CONSTRAINT [FK_detail_import_invoice2]
GO
ALTER TABLE [dbo].[detail_invoice]  WITH CHECK ADD  CONSTRAINT [FK_detail_invoice_1] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[invoice] ([id])
GO
ALTER TABLE [dbo].[detail_invoice] CHECK CONSTRAINT [FK_detail_invoice_1]
GO
ALTER TABLE [dbo].[detail_invoice]  WITH CHECK ADD  CONSTRAINT [FK_detail_invoice_2] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[detail_invoice] CHECK CONSTRAINT [FK_detail_invoice_2]
GO
ALTER TABLE [dbo].[detail_stock]  WITH NOCHECK ADD  CONSTRAINT [FK_detail_stock_2] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[detail_stock] CHECK CONSTRAINT [FK_detail_stock_2]
GO
ALTER TABLE [dbo].[detail_stock]  WITH CHECK ADD  CONSTRAINT [FK_detail_stock1] FOREIGN KEY([store_id], [product_id])
REFERENCES [dbo].[detail_stock] ([store_id], [product_id])
GO
ALTER TABLE [dbo].[detail_stock] CHECK CONSTRAINT [FK_detail_stock1]
GO
ALTER TABLE [dbo].[history_staff]  WITH CHECK ADD  CONSTRAINT [FK_history_staff_1] FOREIGN KEY([staff_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[history_staff] CHECK CONSTRAINT [FK_history_staff_1]
GO
ALTER TABLE [dbo].[import_invoice]  WITH NOCHECK ADD  CONSTRAINT [FK_import_invoice_2] FOREIGN KEY([store_id])
REFERENCES [dbo].[store] ([id])
GO
ALTER TABLE [dbo].[import_invoice] CHECK CONSTRAINT [FK_import_invoice_2]
GO
ALTER TABLE [dbo].[import_invoice]  WITH CHECK ADD  CONSTRAINT [FK_import_invoice_3] FOREIGN KEY([store_manager_id])
REFERENCES [dbo].[store_manager] ([user_id])
GO
ALTER TABLE [dbo].[import_invoice] CHECK CONSTRAINT [FK_import_invoice_3]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_invoice1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_invoice1]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_invoice2] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_invoice2]
GO
ALTER TABLE [dbo].[salary_staff]  WITH CHECK ADD  CONSTRAINT [FK_salary_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[salary_staff] CHECK CONSTRAINT [FK_salary_staff]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_user]
GO
ALTER TABLE [dbo].[staff_work_time]  WITH CHECK ADD  CONSTRAINT [FK_staff_work_time_1] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([user_id])
GO
ALTER TABLE [dbo].[staff_work_time] CHECK CONSTRAINT [FK_staff_work_time_1]
GO
ALTER TABLE [dbo].[staff_work_time]  WITH CHECK ADD  CONSTRAINT [FK_staff_work_time_2] FOREIGN KEY([work_time_id])
REFERENCES [dbo].[work_time] ([id])
GO
ALTER TABLE [dbo].[staff_work_time] CHECK CONSTRAINT [FK_staff_work_time_2]
GO
ALTER TABLE [dbo].[store_manager]  WITH CHECK ADD  CONSTRAINT [FK_store_manager_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[store_manager] CHECK CONSTRAINT [FK_store_manager_1]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_1]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_2] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_2]
GO
ALTER TABLE [dbo].[users]  WITH NOCHECK ADD  CONSTRAINT [FK_store_id] FOREIGN KEY([store_id])
REFERENCES [dbo].[store] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_store_id]
GO
