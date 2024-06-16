DECLARE @Result INT;

EXEC @Result = EditLocations @ID = 1, @street_address = 'Jl. Diponegoro No.22', @postal_code = '40115', @city = 'Bandung', @state_province = 'Jawa Barat', @country = 'IDN';

IF @Result = 1
    PRINT 'Data successfully changed';
ELSE
    PRINT 'Data failed to be changed';
