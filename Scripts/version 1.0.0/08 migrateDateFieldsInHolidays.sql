GO
if not exists(select top 1 1 from INFORMATION_SCHEMA.COLUMNS where lower(TABLE_NAME) = lower('feriados') and lower(COLUMN_NAME) = lower('dateHolliday'))
begin
	alter table FERIADOS add dateHolliday DateTime NULL
	EXEC('update FERIADOS  
		set dateHolliday =  CONVERT(datetime, trim(Fecha))
		where dateHolliday IS NULL')
end




