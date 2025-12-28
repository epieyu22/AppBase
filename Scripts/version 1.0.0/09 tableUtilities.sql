GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('utilities'))
	begin
		CREATE TABLE UTILITIES (
			Id int Not Null default 0,
			Initials char(1) Not Null default '',
			UtilityType varchar(max)  Not Null default '',
			UtilityName Varchar(max) Not Null default ''
		)
	end
GO