CREATE TABLE [ROLES] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] VARCHAR(50) NOT NULL UNIQUE
)
GO

CREATE TABLE [USERS] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [email] VARCHAR(255) NOT NULL UNIQUE,
    [password] VARCHAR(255) NOT NULL,
    [role_id] INT NOT NULL,
    [first_name] VARCHAR(50) NOT NULL,
    [last_name] VARCHAR(50) NOT NULL,
    [age] TINYINT,
    [gender] VARCHAR(20),
    [phone_number] VARCHAR(20),
    [address] VARCHAR(255),
    [date_of_birth] DATE,
    [profile_picture] VARCHAR(255),
    [department] VARCHAR(100),
    [enrollment_date] DATE,
    [employment_date] DATE,
    CONSTRAINT [FK_Users_Roles] FOREIGN KEY ([role_id]) REFERENCES [ROLES]([id])
)
GO

CREATE TABLE [CLASSES] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    [description] TEXT,
    [start_time] DATETIME NOT NULL,
    [end_time] DATETIME NOT NULL,
    CONSTRAINT [CHK_ClassTimes] CHECK ([end_time] > [start_time])
)
GO

CREATE TABLE [ATTENDANCE_RECORDS] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] INT NOT NULL,
    [class_id] INT NOT NULL,
    [check_in_time] DATETIME NOT NULL DEFAULT GETDATE(),
    [check_in_method] VARCHAR(50),
    [location] VARCHAR(100),
    CONSTRAINT [FK_Attendance_Users] FOREIGN KEY ([user_id]) REFERENCES [USERS]([id]),
    CONSTRAINT [FK_Attendance_Classes] FOREIGN KEY ([class_id]) REFERENCES [CLASSES]([id])
)
GO

CREATE TABLE [POINTS_AND_BADGES] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] INT NOT NULL,
    [points] INT NOT NULL DEFAULT 0,
    [badge] VARCHAR(50),
    [awarded_at] DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [FK_Points_Users] FOREIGN KEY ([user_id]) REFERENCES [USERS]([id]),
    CONSTRAINT [CHK_Points] CHECK ([points] >= 0)
)
GO

CREATE TABLE [LEADERBOARDS] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] INT NOT NULL,
    [points] INT NOT NULL DEFAULT 0,
    [rank] INT NOT NULL,
    CONSTRAINT [FK_Leaderboard_Users] FOREIGN KEY ([user_id]) REFERENCES [USERS]([id]),
    CONSTRAINT [CHK_Leaderboard_Points] CHECK ([points] >= 0),
    CONSTRAINT [CHK_Rank] CHECK ([rank] > 0)
)
GO

CREATE TABLE [NOTIFICATIONS] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [user_id] INT NOT NULL,
    [message] TEXT NOT NULL,
    [sent_at] DATETIME NOT NULL DEFAULT GETDATE(),
    [is_read] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [FK_Notifications_Users] FOREIGN KEY ([user_id]) REFERENCES [USERS]([id])
)
GO

CREATE TABLE [REWARDS_STORE] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [reward_name] VARCHAR(100) NOT NULL,
    [points_required] INT NOT NULL,
    [available_quantity] INT NOT NULL DEFAULT 0,
    CONSTRAINT [CHK_Points_Required] CHECK ([points_required] > 0),
    CONSTRAINT [CHK_Available_Quantity] CHECK ([available_quantity] >= 0)
)
GO

CREATE TABLE [SYSTEM_SETTINGS] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [setting_name] VARCHAR(100) NOT NULL UNIQUE,
    [setting_value] VARCHAR(MAX),
    [last_updated] DATETIME NOT NULL DEFAULT GETDATE()
)
GO

-- Create indexes for frequently accessed columns
CREATE INDEX [IX_Users_Email] ON [USERS]([email])
CREATE INDEX [IX_Users_Role] ON [USERS]([role_id])
CREATE INDEX [IX_Attendance_User] ON [ATTENDANCE_RECORDS]([user_id], [check_in_time])
CREATE INDEX [IX_Notifications_User] ON [NOTIFICATIONS]([user_id], [sent_at])
GO
