/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [Football]
GO
/****** Object:  Index [NonClusteredIndex_Team_Name]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_Team_Name] ON [dbo].[Team]
GO
/****** Object:  Index [NonClusteredIndex_SkillsGameLog_staging_PlayerSchedule]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_SkillsGameLog_staging_PlayerSchedule] ON [dbo].[SkillsGameLog_staging]
GO
/****** Object:  Index [NonClusteredIndex_SkillsGameLog_PlayerScheduleTeam]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_SkillsGameLog_PlayerScheduleTeam] ON [dbo].[SkillsGameLog]
GO
/****** Object:  Index [NonClusteredIndex_Schedule_YearWeekTeams]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_Schedule_YearWeekTeams] ON [dbo].[Schedule]
GO
/****** Object:  Index [NonClusteredIndex_QBGameLog_Staging_PlayerSchedule]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_QBGameLog_Staging_PlayerSchedule] ON [dbo].[QBGameLog_staging]
GO
/****** Object:  Index [NonClusteredIndex_QBGameLog_PlayerScheduleTeam]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_QBGameLog_PlayerScheduleTeam] ON [dbo].[QBGameLog]
GO
/****** Object:  Index [NonClusteredIndex_Player_TeamID]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_Player_TeamID] ON [dbo].[Player]
GO
/****** Object:  Index [NonClusteredIndex_Player_Name]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP INDEX IF EXISTS [NonClusteredIndex_Player_Name] ON [dbo].[Player]
GO
/****** Object:  Table [dbo].[SkillsGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[SkillsGameLog_staging]
GO
/****** Object:  Table [dbo].[Schedule_Staging]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Schedule_Staging]
GO
/****** Object:  Table [dbo].[QBGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[QBGameLog_staging]
GO
/****** Object:  Table [dbo].[MissingData]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MissingData]
GO
/****** Object:  Table [dbo].[KickerGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[KickerGameLog_staging]
GO
/****** Object:  Table [dbo].[DSTGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[DSTGameLog_staging]
GO
/****** Object:  View [dbo].[vw_Skills_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_Skills_OpponentData]
GO
/****** Object:  Table [dbo].[SkillsGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[SkillsGameLog]
GO
/****** Object:  View [dbo].[vw_QB_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_QB_OpponentData]
GO
/****** Object:  Table [dbo].[QBGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[QBGameLog]
GO
/****** Object:  View [dbo].[vw_Kicker_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_Kicker_OpponentData]
GO
/****** Object:  Table [dbo].[KickerGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[KickerGameLog]
GO
/****** Object:  View [dbo].[vw_DST_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_DST_OpponentData]
GO
/****** Object:  Table [dbo].[DSTGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[DSTGameLog]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Player]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Team]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/3/2017 11:38:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Schedule]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[Date] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HomeTeamID] [int] NOT NULL,
	[HomeScore] [int] NULL,
	[AwayTeamID] [int] NOT NULL,
	[AwayScore] [int] NULL,
 CONSTRAINT [Index_Schedule_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Team]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [Index_Team_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Player]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Player]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Player](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PositionType] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TeamID] [int] NULL,
	[OnlineID] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxYear] [int] NULL,
 CONSTRAINT [Index_Player_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DSTGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DSTGameLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DSTGameLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NULL,
	[TeamID] [int] NOT NULL,
	[PlayerID] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[Fumbles] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[Touchdowns] [int] NOT NULL,
 CONSTRAINT [Index_DSTGameLog_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_DST_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_DST_OpponentData]'))
EXEC dbo.sp_executesql @statement = N'






CREATE view [dbo].[vw_DST_OpponentData] as
select
	l.ScheduleID
	, s.[Year]
	, s.[Week]
	, s.[Date]
	, t2.ID as OpponentTeamID
	, t2.Name as Opponent
	, p.ID
	, p.Name as PlayerName
	, p.PositionType
	, l.TeamID
	, t.Name as TeamName
	, l.Sacks
	, l.Fumbles
	, l.Interceptions
	, l.Touchdowns
	, rank() over (partition by p.ID order by s.Year asc, s.Week asc) AS AscGameNumber  --rank by player, earliest first
	, rank() over (partition by p.ID order by s.Year desc, s.Week desc) AS AllGameNumber  --rank by player, most recent first
	, rank() over (partition by p.ID,t2.ID order by s.Year desc, s.Week desc) AS OpponentGameNumber  --rank by player against an opponent, most recent first
from dbo.Player p
join dbo.DSTGameLog l
on p.ID = l.PlayerID
join dbo.Team t
on l.TeamID = t.ID
join dbo.Schedule s
on l.ScheduleID = s.ID
join dbo.Team t2
on t2.ID = (case when l.TeamID = s.HomeTeamID then s.AwayTeamID else s.HomeTeamID end)
where
s.HomeScore is not null
--order by s.Year desc, s.Week desc
' 
GO
/****** Object:  Table [dbo].[KickerGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KickerGameLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KickerGameLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[FG019] [int] NOT NULL,
	[FG2029] [int] NOT NULL,
	[FG3039] [int] NOT NULL,
	[FG4049] [int] NOT NULL,
	[FG50] [int] NOT NULL,
	[FGM] [int] NOT NULL,
	[XPM] [int] NOT NULL,
 CONSTRAINT [Index_KickerGameLog_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_Kicker_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Kicker_OpponentData]'))
EXEC dbo.sp_executesql @statement = N'





CREATE view [dbo].[vw_Kicker_OpponentData] as
select
	l.ScheduleID
	, s.[Year]
	, s.[Week]
	, s.[Date]
	, t2.ID as OpponentTeamID
	, t2.Name as Opponent
	, p.ID
	, p.Name as PlayerName
	, p.PositionType
	, l.TeamID
	, t.Name as TeamName
	, l.FG019
	, l.FG2029
	, l.FG3039
	, l.FG4049
	, l.FG50
	, l.FGM
	, l.XPM
	, rank() over (partition by p.ID order by s.Year asc, s.Week asc) AS AscGameNumber  --rank by player, earliest first
	, rank() over (partition by p.ID order by s.Year desc, s.Week desc) AS AllGameNumber  --rank by player, most recent first
	, rank() over (partition by p.ID,t2.ID order by s.Year desc, s.Week desc) AS OpponentGameNumber  --rank by player against an opponent, most recent first
from dbo.Player p
join dbo.KickerGameLog l
on p.ID = l.PlayerID
join dbo.Team t
on l.TeamID = t.ID
join dbo.Schedule s
on l.ScheduleID = s.ID
join dbo.Team t2
on t2.ID = (case when l.TeamID = s.HomeTeamID then s.AwayTeamID else s.HomeTeamID end)
where
s.HomeScore is not null
--order by s.Year desc, s.Week desc
' 
GO
/****** Object:  Table [dbo].[QBGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QBGameLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QBGameLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[Comp] [int] NOT NULL,
	[Attempt] [int] NOT NULL,
	[Pct] [decimal](18, 2) NOT NULL,
	[PassingYards] [int] NOT NULL,
	[PassingTouchdowns] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[RushingAttempt] [int] NOT NULL,
	[RushingYards] [int] NOT NULL,
	[RushingTouchdowns] [int] NOT NULL,
	[Fumbles] [int] NULL,
	[FumblesLost] [int] NULL,
 CONSTRAINT [Index_QBGameLog_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_QB_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_QB_OpponentData]'))
EXEC dbo.sp_executesql @statement = N'







CREATE view [dbo].[vw_QB_OpponentData] as
select
	l.[ScheduleID]
	, s.[Year]
	, s.[Week]
	, s.[Date]
	, t2.[ID] as [OpponentTeamID]
	, t2.[Name] as [Opponent]
	, p.[ID]
	, p.[Name] as [PlayerName]
	, p.[PositionType]
	, l.[TeamID]
	, t.[Name] as [TeamName]
	, l.[Comp]
	, l.[Attempt]
	, l.[Pct]
	, l.[PassingYards]
	, l.[PassingTouchdowns]
	, l.[Interceptions]
	, l.[Sacks]
	, l.[Rating]
	, l.[RushingAttempt]
	, l.[RushingYards]
	, l.[RushingTouchdowns]
	, l.[Fumbles]
	, l.[FumblesLost]
	, rank() over (partition by p.ID order by s.Year asc, s.Week asc) AS AscGameNumber  --rank by player, earliest first
	, rank() over (partition by p.ID order by s.Year desc, s.Week desc) AS AllGameNumber  --rank by player, most recent first
	, rank() over (partition by p.ID,t2.ID order by s.Year desc, s.Week desc) AS OpponentGameNumber  --rank by player against an opponent, most recent first
from dbo.Player p
join dbo.QBGameLog l
on p.ID = l.PlayerID
join dbo.Team t
on l.TeamID = t.ID
join dbo.Schedule s
on l.ScheduleID = s.ID
join dbo.Team t2
on t2.ID = (case when l.TeamID = s.HomeTeamID then s.AwayTeamID else s.HomeTeamID end)
where
s.HomeScore is not null
--order by s.Year desc, s.Week desc
' 
GO
/****** Object:  Table [dbo].[SkillsGameLog]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SkillsGameLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SkillsGameLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[RushingAttempt] [int] NOT NULL,
	[RushingYards] [int] NOT NULL,
	[RushingTouchdowns] [int] NOT NULL,
	[Receptions] [int] NOT NULL,
	[ReceivingYards] [int] NOT NULL,
	[ReceivingTouchdowns] [int] NOT NULL,
	[Fumbles] [int] NOT NULL,
	[FumblesLost] [int] NOT NULL,
 CONSTRAINT [Index_SkillsGameLog_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vw_Skills_OpponentData]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Skills_OpponentData]'))
EXEC dbo.sp_executesql @statement = N'









CREATE view [dbo].[vw_Skills_OpponentData] as
select
	l.ScheduleID
	, s.[Year]
	, s.[Week]
	, s.[Date]
	, t2.ID as OpponentTeamID
	, t2.Name as Opponent
	, p.ID
	, p.Name as PlayerName
	, p.PositionType
	, l.TeamID
	, t.Name as TeamName
	, l.RushingAttempt
	, l.RushingYards
	, l.RushingTouchdowns
	, l.Receptions
	, l.ReceivingYards
	, l.ReceivingTouchdowns
	, l.Fumbles
	, l.FumblesLost
	, rank() over (partition by p.ID order by s.Year asc, s.Week asc) AS AscGameNumber  --rank by player, earliest first
	, rank() over (partition by p.ID order by s.Year desc, s.Week desc) AS AllGameNumber  --rank by player, most recent first
	, rank() over (partition by p.ID,t2.ID order by s.Year desc, s.Week desc) AS OpponentGameNumber  --rank by player against an opponent, most recent first
from dbo.Player p
join dbo.SkillsGameLog l
on p.ID = l.PlayerID
join dbo.Team t
on l.TeamID = t.ID
join dbo.Schedule s
on l.ScheduleID = s.ID
join dbo.Team t2
on t2.ID = (case when l.TeamID = s.HomeTeamID then s.AwayTeamID else s.HomeTeamID end)
where
s.HomeScore is not null
--order by s.Year desc, s.Week desc
' 
GO
/****** Object:  Table [dbo].[DSTGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DSTGameLog_staging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DSTGameLog_staging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[Fumbles] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[Touchdowns] [int] NOT NULL,
 CONSTRAINT [Index_DSTGameLog_staging_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KickerGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KickerGameLog_staging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KickerGameLog_staging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[FG019] [int] NOT NULL,
	[FG2029] [int] NOT NULL,
	[FG3039] [int] NOT NULL,
	[FG4049] [int] NOT NULL,
	[FG50] [int] NOT NULL,
	[FGM] [int] NOT NULL,
	[XPM] [int] NOT NULL,
 CONSTRAINT [Index_KickerGameLog_staging_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MissingData]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MissingData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MissingData](
	[PlayerID] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[QBGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QBGameLog_staging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QBGameLog_staging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[Comp] [int] NOT NULL,
	[Attempt] [int] NOT NULL,
	[Pct] [decimal](18, 2) NOT NULL,
	[PassingYards] [int] NOT NULL,
	[PassingTouchdowns] [int] NOT NULL,
	[Interceptions] [int] NOT NULL,
	[Sacks] [int] NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[RushingAttempt] [int] NOT NULL,
	[RushingYards] [int] NOT NULL,
	[RushingTouchdowns] [int] NOT NULL,
	[Fumbles] [int] NULL,
	[FumblesLost] [int] NULL,
 CONSTRAINT [Index_QBGameLog_staging_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Schedule_Staging]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_Staging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Schedule_Staging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[Date] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HomeTeamID] [int] NOT NULL,
	[HomeScore] [int] NULL,
	[AwayTeamID] [int] NOT NULL,
	[AwayScore] [int] NULL,
 CONSTRAINT [Index_Schedule_staging_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SkillsGameLog_staging]    Script Date: 11/3/2017 11:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SkillsGameLog_staging]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SkillsGameLog_staging](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TeamID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[RushingAttempt] [int] NOT NULL,
	[RushingYards] [int] NOT NULL,
	[RushingTouchdowns] [int] NOT NULL,
	[Receptions] [int] NOT NULL,
	[ReceivingYards] [int] NOT NULL,
	[ReceivingTouchdowns] [int] NOT NULL,
	[Fumbles] [int] NOT NULL,
	[FumblesLost] [int] NOT NULL,
 CONSTRAINT [Index_SkillsGameLog_staging_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex_Player_Name]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Player]') AND name = N'NonClusteredIndex_Player_Name')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_Player_Name] ON [dbo].[Player]
(
	[Name] ASC,
	[PositionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex_Player_TeamID]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Player]') AND name = N'NonClusteredIndex_Player_TeamID')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_Player_TeamID] ON [dbo].[Player]
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex_QBGameLog_PlayerScheduleTeam]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QBGameLog]') AND name = N'NonClusteredIndex_QBGameLog_PlayerScheduleTeam')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_QBGameLog_PlayerScheduleTeam] ON [dbo].[QBGameLog]
(
	[PlayerID] ASC,
	[ScheduleID] ASC,
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex_QBGameLog_Staging_PlayerSchedule]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QBGameLog_staging]') AND name = N'NonClusteredIndex_QBGameLog_Staging_PlayerSchedule')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_QBGameLog_Staging_PlayerSchedule] ON [dbo].[QBGameLog_staging]
(
	[PlayerID] ASC,
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex_Schedule_YearWeekTeams]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Schedule]') AND name = N'NonClusteredIndex_Schedule_YearWeekTeams')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_Schedule_YearWeekTeams] ON [dbo].[Schedule]
(
	[Year] ASC,
	[Week] ASC,
	[HomeTeamID] ASC,
	[AwayTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex_SkillsGameLog_PlayerScheduleTeam]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SkillsGameLog]') AND name = N'NonClusteredIndex_SkillsGameLog_PlayerScheduleTeam')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_SkillsGameLog_PlayerScheduleTeam] ON [dbo].[SkillsGameLog]
(
	[PlayerID] ASC,
	[ScheduleID] ASC,
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex_SkillsGameLog_staging_PlayerSchedule]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SkillsGameLog_staging]') AND name = N'NonClusteredIndex_SkillsGameLog_staging_PlayerSchedule')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_SkillsGameLog_staging_PlayerSchedule] ON [dbo].[SkillsGameLog_staging]
(
	[PlayerID] ASC,
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex_Team_Name]    Script Date: 11/3/2017 11:38:06 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Team]') AND name = N'NonClusteredIndex_Team_Name')
CREATE NONCLUSTERED INDEX [NonClusteredIndex_Team_Name] ON [dbo].[Team]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
