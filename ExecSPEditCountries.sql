DECLARE @Result INT;

EXEC @Result = EditCountries @ID = IDN, @country_name = 'Indonesia', @Region = '2';

IF @Result = 1
    PRINT 'Data successfully changed';
ELSE
    PRINT 'Data failed to be changed';
