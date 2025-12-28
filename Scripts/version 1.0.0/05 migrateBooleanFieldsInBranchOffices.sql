GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('sucursales') and lower(COLUMN_NAME) = lower('cumMeta'))
begin
	alter table SUCURSALES add cumMeta BIT NULL
	EXEC('update SUCURSALES  
		set cumMeta = IIF(Cumplio_Meta = ''S'', 1, 0)
		where cumMeta IS NULL')
end
GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('sucursales') and lower(COLUMN_NAME) = lower('hasCompany'))
begin
	alter table SUCURSALES add hasCompany BIT NULL
	EXEC('update SUCURSALES  
		set hasCompany = IIF(EsEmpresa = ''S'', 1, 0)
		where hasCompany IS NULL')
end




