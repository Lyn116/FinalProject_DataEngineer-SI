DECLARE @Result INT;

EXEC @Result = EditRegions @ID = 2, @name_region = 'Africa';

IF @Result = 1
    PRINT 'Data successfully changed';
ELSE
    PRINT 'Data failed to be changed';
