GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('ccostos') and lower(COLUMN_NAME) = lower('hasBranchOffice'))
begin
	alter table CCOSTOS add hasBranchOffice BIT NULL
	EXEC('update CCOSTOS  
		set hasBranchOffice = IIF(Sucursal = ''S'', 1, 0)
		where hasBranchOffice IS NULL')
end