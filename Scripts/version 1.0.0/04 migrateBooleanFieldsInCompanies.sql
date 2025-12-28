GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('modPayroll'))
begin
	alter table EMPRESAS add modPayroll BIT NULL
	EXEC('update EMPRESAS  
		set modPayroll = IIF(ModNOM = ''S'', 1, 0)
		where modPayroll IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('modRrHh'))
begin
	alter table EMPRESAS add modRrHh BIT NULL
	EXEC('update EMPRESAS  
		set modRrHh = IIF(ModRH = ''S'', 1, 0)
		where modRrHh IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('modFin'))
begin
	alter table EMPRESAS add modFin BIT NULL
	EXEC('update EMPRESAS  
		set modFin = IIF(ModMIS = ''S'', 1, 0)
		where modFin IS NULL')
end




