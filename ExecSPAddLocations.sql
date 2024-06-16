DECLARE @Result INT;
EXEC @Result = AddLocations @street_address = 'Jl. Tamansari No.73', @postal_code = '40132', @city = 'Bandung', @state_province = 'Jawa Barat', @country = 'IDN';

IF @Result = 1
    PRINT 'Data successfully added';
ELSE
    PRINT 'Invalid data, failed to be added';