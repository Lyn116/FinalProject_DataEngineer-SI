CREATE FUNCTION ValidateDepartment(
    @name_department varchar(30)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT;
    SET @isValid = 1; 

    IF @name_department = '%[^A-Za-z ]%'
    BEGIN
        SET @isValid = 0;
    END

    RETURN @isValid;
END;