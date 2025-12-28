GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('cargos') and lower(COLUMN_NAME) = lower('salaryAuthorization'))
begin
	alter table CARGOS add salaryAuthorization BIT NULL
	EXEC('update CARGOS  
		set salaryAuthorization = IIF(AutorizaSalarios = ''S'', 1, 0)
		where salaryAuthorization IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('cargos') and lower(COLUMN_NAME) = lower('receiveMails'))
begin
	alter table CARGOS add receiveMails BIT NULL
	EXEC('update CARGOS  
		set receiveMails = IIF(RecibeMail = ''S'', 1, 0)
		where receiveMails IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('cargos') and lower(COLUMN_NAME) = lower('hasBoss'))
begin
	alter table CARGOS add hasBoss BIT NULL
	EXEC('update CARGOS  
		set hasBoss = IIF(TieneJefe = ''S'', 1, 0)
		where hasBoss IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('cargos') and lower(COLUMN_NAME) = lower('applyArt209'))
begin
	alter table CARGOS add applyArt209 BIT NULL
	EXEC('update CARGOS  
		set applyArt209 = IIF(Art209 = ''S'', 1, 0)
		where applyArt209 IS NULL')
end



