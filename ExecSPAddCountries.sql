DECLARE @Result INT;
EXEC @Result = AddCountries @ID = 'IDN', @country_name = 'Indonesia', @Region = 3;

IF @Result = 1
    PRINT 'Data successfully added';
ELSE
    PRINT 'Invalid data, failed to be added';