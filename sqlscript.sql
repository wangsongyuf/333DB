USE [master]
GO
/****** Object:  Database [Graduate_School]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE DATABASE [Graduate_School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Graduate_School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TITAN\MSSQL\DATA\Graduate_School.mdf' , SIZE = 6144KB , MAXSIZE = 30720KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Graduate_School_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TITAN\MSSQL\DATA\Graduate_School_Log.ldf' , SIZE = 2048KB , MAXSIZE = 20480KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Graduate_School] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Graduate_School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Graduate_School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Graduate_School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Graduate_School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Graduate_School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Graduate_School] SET ARITHABORT OFF 
GO
ALTER DATABASE [Graduate_School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Graduate_School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Graduate_School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Graduate_School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Graduate_School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Graduate_School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Graduate_School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Graduate_School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Graduate_School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Graduate_School] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Graduate_School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Graduate_School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Graduate_School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Graduate_School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Graduate_School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Graduate_School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Graduate_School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Graduate_School] SET RECOVERY FULL 
GO
ALTER DATABASE [Graduate_School] SET  MULTI_USER 
GO
ALTER DATABASE [Graduate_School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Graduate_School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Graduate_School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Graduate_School] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Graduate_School]
GO
/****** Object:  User [wangs4]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE USER [wangs4] FOR LOGIN [wangs4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [qiuz]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE USER [qiuz] FOR LOGIN [qiuz] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [wangs4]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [wangs4]
GO
ALTER ROLE [db_datareader] ADD MEMBER [wangs4]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [wangs4]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [qiuz]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [qiuz]
GO
ALTER ROLE [db_datareader] ADD MEMBER [qiuz]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [qiuz]
GO
/****** Object:  FullTextCatalog [FullTextCatalog]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE FULLTEXT CATALOG [FullTextCatalog]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT

GO
/****** Object:  Table [dbo].[active_admin_comments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[active_admin_comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[namespace] [nvarchar](4000) NULL,
	[body] [nvarchar](max) NULL,
	[resource_id] [nvarchar](4000) NOT NULL,
	[resource_type] [nvarchar](4000) NOT NULL,
	[author_id] [int] NULL,
	[author_type] [nvarchar](4000) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_users]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](4000) NOT NULL DEFAULT (N''),
	[encrypted_password] [nvarchar](4000) NOT NULL DEFAULT (N''),
	[reset_password_token] [nvarchar](4000) NULL,
	[reset_password_sent_at] [datetime] NULL,
	[remember_created_at] [datetime] NULL,
	[sign_in_count] [int] NOT NULL DEFAULT ((0)),
	[current_sign_in_at] [datetime] NULL,
	[last_sign_in_at] [datetime] NULL,
	[current_sign_in_ip] [nvarchar](4000) NULL,
	[last_sign_in_ip] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[College]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[College](
	[CID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Ranking] [int] NULL,
	[Tuition] [money] NULL,
	[FundingOption] [varchar](50) NULL,
	[AverageStandardizedTestScore] [int] NULL,
	[InState] [varchar](20) NULL,
	[AtAddress] [varchar](500) NULL,
	[url] [nvarchar](4000) NULL,
	[professor_student_ratio] [decimal](8, 2) NULL,
	[image_url] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CRate]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRate](
	[CID] [int] NULL,
	[UUID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[departments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departments](
	[DID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[CID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Faculty](
	[FID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Area] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FRate]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FRate](
	[FID] [int] NULL,
	[UUID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Program]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Program](
	[PID] [int] IDENTITY(0,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[USNewsRanking] [int] NULL,
	[PrincetonReviewRanking] [int] NULL,
	[CID] [int] NULL,
	[DID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schema_migrations]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schema_migrations](
	[version] [nvarchar](4000) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supervise]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervise](
	[FID] [int] NULL,
	[PID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThisUser]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThisUser](
	[UUID] [int] IDENTITY(0,1) NOT NULL,
	[Username] [nvarchar](4000) NULL,
	[UPassword] [nvarchar](4000) NULL,
	[CurrentStatus] [nvarchar](4000) NULL,
	[AtYear] [int] NULL,
	[firstname] [nvarchar](4000) NULL,
	[lastname] [nvarchar](4000) NULL,
	[email] [nvarchar](4000) NULL,
	[showYourComments] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[first_name] [nvarchar](4000) NULL,
	[last_name] [nvarchar](4000) NULL,
	[email] [nvarchar](4000) NULL,
	[password_digest] [nvarchar](4000) NULL,
	[username] [nvarchar](4000) NULL,
	[CurrentStatus] [nvarchar](4000) NULL,
	[AtYear] [int] NULL,
	[showYourComments] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkIn]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkIn](
	[FID] [int] NULL,
	[DID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[college comments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[college comments] 
AS
SELECT c.Rating, c.Comment, cv.Name, tu.Username
FROM CRate c, collegeview cv, ThisUser tu
WHERE c.CID = cv.CID AND c.UUID = tu.UUID
GO
/****** Object:  View [dbo].[college_rank_list]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[college_rank_list]
as select
top 100
Name as [College Name],Ranking as [College Ranking]
from College
order by [College Ranking]

GO
/****** Object:  View [dbo].[collegeview]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[collegeview]
as 
select * from College
GO
/****** Object:  View [dbo].[departmentview]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[departmentview]
AS
SELECT DID, Name, Phone, Email, CID
FROM     dbo.departments

GO
/****** Object:  View [dbo].[programview]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[programview]
as 
select * from Program

GO
/****** Object:  View [dbo].[public comment]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[public comment]
AS
SELECT Comment, tu.Username, cv.Name
FROM CRate c, ThisUser tu, collegeview cv
WHERE c.UUID = tu.UUID AND tu.showYourComments = 1 AND c.CID = cv.CID

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_active_admin_comments_on_author_type_and_author_id]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [index_active_admin_comments_on_author_type_and_author_id] ON [dbo].[active_admin_comments]
(
	[author_type] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_active_admin_comments_on_namespace]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [index_active_admin_comments_on_namespace] ON [dbo].[active_admin_comments]
(
	[namespace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_active_admin_comments_on_resource_type_and_resource_id]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [index_active_admin_comments_on_resource_type_and_resource_id] ON [dbo].[active_admin_comments]
(
	[resource_type] ASC,
	[resource_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_users_on_email]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_users_on_email] ON [dbo].[admin_users]
(
	[email] ASC
)
WHERE ([email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_users_on_reset_password_token]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_users_on_reset_password_token] ON [dbo].[admin_users]
(
	[reset_password_token] ASC
)
WHERE ([reset_password_token] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [College_name]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [College_name] ON [dbo].[College]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Department_name]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [Department_name] ON [dbo].[departments]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Faculty_name]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [Faculty_name] ON [dbo].[Faculty]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Program_name]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [Program_name] ON [dbo].[Program]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_schema_migrations]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_schema_migrations] ON [dbo].[schema_migrations]
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [User_name]    Script Date: 5/20/2016 1:39:24 PM ******/
CREATE NONCLUSTERED INDEX [User_name] ON [dbo].[users]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CRate]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[College] ([CID])
GO
ALTER TABLE [dbo].[CRate]  WITH CHECK ADD FOREIGN KEY([UUID])
REFERENCES [dbo].[ThisUser] ([UUID])
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[College] ([CID])
GO
ALTER TABLE [dbo].[FRate]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Faculty] ([FID])
GO
ALTER TABLE [dbo].[FRate]  WITH CHECK ADD FOREIGN KEY([UUID])
REFERENCES [dbo].[ThisUser] ([UUID])
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[College] ([CID])
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD FOREIGN KEY([DID])
REFERENCES [dbo].[departments] ([DID])
GO
ALTER TABLE [dbo].[Supervise]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Faculty] ([FID])
GO
ALTER TABLE [dbo].[Supervise]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Program] ([PID])
GO
ALTER TABLE [dbo].[WorkIn]  WITH CHECK ADD FOREIGN KEY([DID])
REFERENCES [dbo].[departments] ([DID])
GO
ALTER TABLE [dbo].[WorkIn]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Faculty] ([FID])
GO
/****** Object:  StoredProcedure [dbo].[AbortUser]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AbortUser]
(@username nvarchar(50))
AS

IF ((SELECT COUNT(*) FROM users WHERE username = @username GROUP BY username) IS NOT NULL) 
BEGIN
DELETE FROM users
WHERE username = @username
END
ELSE
BEGIN
PRINT 'user does not exist!'
END
GO
/****** Object:  StoredProcedure [dbo].[AddCRate]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCRate]
(@college nvarchar(50),
@username nvarchar(50),
@rate int,
@comment nvarchar(50))
AS

INSERT INTO CRate
(CID, UUID, Rating, Comment)
VALUES ((SELECT CID FROM College WHERE Name = @college), (SELECT UUID FROM ThisUser WHERE Username = @username), @rate, @comment)
GO
/****** Object:  StoredProcedure [dbo].[getPublicComments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getPublicComments]
(@college nvarchar(50),
@username nvarchar(50))

AS

SELECT Comment, Username
FROM dbo.[public comment] pc
WHERE pc.Username <> @username AND pc.Name = @college
GO
/****** Object:  StoredProcedure [dbo].[getRatingAndComments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getRatingAndComments]
(@college nvarchar(50),
@username nvarchar(50))
AS
SELECT Comment
FROM dbo.[college comments]
WHERE Name = @college AND Username = @username
GO
/****** Object:  StoredProcedure [dbo].[ProfilePages]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProfilePages]
(@username nvarchar(50))
AS
SELECT first_name, last_name, email, username, CurrentStatus, AtYear, showYourComments
FROM users
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[ranksearchcollege]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[ranksearchcollege]
(@start int, @end int)
AS
 select Name as [College name],Ranking as [USnews Rank], Tuition ,InState as [State], AtAddress as [Address]
FROM collegeview
WHERE Ranking>@start and Ranking<@end
GO
/****** Object:  StoredProcedure [dbo].[searchcollege]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[searchcollege]
(@college nvarchar(50))
as
select Name as [College name],Ranking as [USnews Rank], Tuition ,InState as [State], AtAddress as [Address], url as [Official Website], image_url as [imgURL]
from College
where contains(Name,@college)
GO
/****** Object:  StoredProcedure [dbo].[searchdepartment]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[searchdepartment]
(@department nvarchar(50))
as
select d.Name as [Department name],d.Phone as [Phone Number], d.Email as [Email Address], c.Name as [Belong to]
from College c, departments d
where c.CID=d.CID and Contains(d.Name,@department)

GO
/****** Object:  StoredProcedure [dbo].[searchfaculty]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[searchfaculty]
(@faculty nvarchar(50))
as
select f.Name as [Faculty name],f.Area as [Specialty], d.Email as [Email Address], d.Name as [Belong to Departemnt], c.Name as [Belong to College]
from WorkIn w, Faculty f, departments d, College c
where c.CID=d.CID and Contains(f.Name,@faculty) and w.DID=d.DID 

GO
/****** Object:  StoredProcedure [dbo].[searchprogram]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[searchprogram]
(@program nvarchar(50))
as
select p.Name as [Program name],p.USNewsRanking as [US News Ranking], p.PrincetonReviewRanking as [Princeton Review Ranking], d.Name as [Belong to Departemnt], c.Name as [Belong to College]
from departments d, College c, Program p
where c.CID=d.CID and Contains(p.Name,@program) and p.DID=d.DID 

GO
/****** Object:  StoredProcedure [dbo].[UpdateShowComments]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateShowComments]
(@username nvarchar(50),
@show INT)
AS

UPDATE users
SET showYourComments = @show
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserCurrentStatus]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserCurrentStatus]
(@username nvarchar(50),
@currentStatus nvarchar(200))
AS

UPDATE users
SET CurrentStatus = @currentStatus
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserEmail]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUserEmail]
(@username nvarchar(50),
@Email nvarchar(200))
AS

UPDATE users
SET email = @Email
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserFirstName]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[UpdateUserFirstName]
(@username nvarchar(50),
@FirstName nvarchar(200))
AS

UPDATE users
SET first_name = @FirstName
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserLastName]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUserLastName]
(@username nvarchar(50),
@LastName nvarchar(200))
AS

UPDATE users
SET last_name = @LastName
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserusername]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUserusername]
(@username nvarchar(50),
@Username2 nvarchar(200))
AS

UPDATE users
SET username = @Username2
WHERE username = @username
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserYear]    Script Date: 5/20/2016 1:39:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUserYear]
(@username nvarchar(50),
@Year nvarchar(200))
AS

UPDATE users
SET AtYear = @Year
WHERE username = @username
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
         Begin Table = "departments"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 168
               Right = 242
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'departmentview'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'departmentview'
GO
USE [master]
GO
ALTER DATABASE [Graduate_School] SET  READ_WRITE 
GO
