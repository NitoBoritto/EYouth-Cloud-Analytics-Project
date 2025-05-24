-- Testing
SELECT *
FROM dbo.Accounts
----------------------------------------------------------------------------------------------------------------------------------------
-- Creating Logins
SELECT name AS SchemaName
FROM sys.schemas
WHERE principal_id = USER_ID('YousifSabal');

CREATE LOGIN Mohamdd_Radi
	WITH PASSWORD = 'M1@2@3@4@5@6@7@8'
GO

CREATE LOGIN Mohammed_Ebrahim 
	WITH PASSWORD = 'GhJk0987@#'
GO

CREATE LOGIN YousifSabal 
	WITH PASSWORD = 'Yousif@Team12'
GO

CREATE LOGIN Muhammed_Imam 
	WITH PASSWORD = 'Muh@12345##!Secur3'
GO

CREATE LOGIN Mennatallah 
	WITH PASSWORD = 'Mnmneid@27'
GO

CREATE LOGIN Omar_Fawzy 
	WITH PASSWORD = 'Ofteam12@bank'
GO
----------------------------------------------------------------------------------------------------------------------------------------
-- Creating Usernames on [master]
CREATE USER Mohammed_Ebrahim
	FROM LOGIN Mohammed_Ebrahim
	GO

CREATE USER Mohamdd_Radi
	FROM LOGIN Mohamdd_Radi
	GO

CREATE USER YousifSabal
	FROM LOGIN YousifSabal
	GO

CREATE USER Muhammed_Imam
	FROM LOGIN Muhammed_Imam
	GO

CREATE USER Mennatallah
	FROM LOGIN Mennatallah
	GO

CREATE USER Omar_Fawzy
	FROM LOGIN Omar_Fawzy
	GO
----------------------------------------------------------------------------------------------------------------------------------------
-- Assigning DB Schemas on [Team12_DB_Bank_Cleaned]
CREATE USER Mohammed_Ebrahim WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER Mohamdd_Radi WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER YousifSabal WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER Muhammed_Imam WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER Mennatallah WITH DEFAULT_SCHEMA=[dbo]
GO

CREATE USER Omar_Fawzy WITH DEFAULT_SCHEMA=[dbo]
GO
----------------------------------------------------------------------------------------------------------------------------------------
-- Giving Roles
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Mohammed_Ebrahim'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'Mohammed_Ebrahim'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'Mohammed_Ebrahim'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Mohammed_Ebrahim'
GO
----------------------------------------------------------------------------------------------------------------------------------------

sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Mohamdd_Radi'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'Mohamdd_Radi'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'Mohamdd_Radi'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Mohamdd_Radi'
GO
----------------------------------------------------------------------------------------------------------------------------------------

sys.sp_addrolemember @rolename = N'db_owner', @membername = N'YousifSabal'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'YousifSabal'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'YousifSabal'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'YousifSabal'
GO
----------------------------------------------------------------------------------------------------------------------------------------

sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Muhammed_Imam'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'Muhammed_Imam'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'Muhammed_Imam'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Muhammed_Imam'
GO
----------------------------------------------------------------------------------------------------------------------------------------

sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Mennatallah'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'Mennatallah'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'Mennatallah'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Mennatallah'
GO
----------------------------------------------------------------------------------------------------------------------------------------

sys.sp_addrolemember @rolename = N'db_owner', @membername = N'Omar_Fawzy'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'Omar_Fawzy'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'Omar_Fawzy'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'Omar_Fawzy'
GO
----------------------------------------------------------------------------------------------------------------------------------------
-- Giving Firewall Rule
EXEC sp_set_firewall_rule @name = N'Omar_Fawzy3',
   @start_ip_address = '41.33.41.162', @end_ip_address = '41.33.41.162'
GO
 ----------------------------------------------------------------------------------------------------------------------------------------
 -- Creating Tables
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[AccountType] [nvarchar](50) NOT NULL,
	[Balance] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CardType] [nvarchar](50) NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[IssuedDate] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[JoinDate] [date] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[LoanID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LoanType] [nvarchar](50) NOT NULL,
	[LoanAmount] [float] NOT NULL,
	[InterestRate] [float] NOT NULL,
	[LoanStartDate] [date] NOT NULL,
	[LoanEndDate] [date] NOT NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Support_Calls]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Support_Calls](
	[CallID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CallDate] [date] NOT NULL,
	[IssueType] [nvarchar](max) NOT NULL,
	[Resolved] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Support_Calls] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/19/2025 12:01:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[TransactionDate] [date] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE[dbo].[Customers]
ALTER COLUMN JoinYear [char](4) NOT NULL

ALTER TABLE [dbo].[Transactions]
ADD Month [nvarchar](50)

ALTER TABLE [dbo].[Transactions]
ADD DayOfWeek [nvarchar](50)

ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Cust_ID_Accounts] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Cust_ID_Accounts]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cust_ID_Cards] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cust_ID_Cards]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Cust_ID_Loans] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Cust_ID_Loans]
GO
ALTER TABLE [dbo].[Support_Calls]  WITH CHECK ADD  CONSTRAINT [FK_Cust_ID_SupCalls] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Support_Calls] CHECK CONSTRAINT [FK_Cust_ID_SupCalls]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_AccID_Trans] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_AccID_Trans]
GO
ALTER TABLE [dbo].[Support_Calls]  WITH CHECK ADD  CONSTRAINT [CHECK_Resolved] CHECK  (([Resolved]='No' OR [Resolved]='Yes'))
GO
ALTER TABLE [dbo].[Support_Calls] CHECK CONSTRAINT [CHECK_Resolved]
GO
ALTER DATABASE [Team12_DB_Bank_Cleaned] SET  READ_WRITE 
GO
