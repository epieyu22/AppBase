GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('dateInstall'))
begin
	alter table EMPRESAS add dateInstall DateTime NULL
	EXEC('update EMPRESAS  
		set dateInstall =  CONVERT(datetime, trim(Fec_Instalacion))
		where dateInstall IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('dateAccess'))
begin
	alter table EMPRESAS add dateAccess DateTime NULL
	EXEC('update EMPRESAS  
		set dateAccess =  CONVERT(datetime, trim(Fec_Ult_Acceso))
		where dateAccess IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('empresas') and lower(COLUMN_NAME) = lower('dateExpiredLic'))
begin
	alter table EMPRESAS add dateExpiredLic DateTime NULL
	EXEC('update EMPRESAS  
		set dateExpiredLic =  CONVERT(datetime, trim(Fec_Vence_Licencia))
		where dateExpiredLic IS NULL')
end




