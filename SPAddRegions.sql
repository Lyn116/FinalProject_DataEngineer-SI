INSERT INTO [dbo].[tbl_regions] VALUES ('Europe');
INSERT INTO [dbo].[tbl_regions] VALUES ('Americas');
INSERT INTO [dbo].[tbl_regions] VALUES ('Asia');

--------CREATING SP ADD REGIONS

CREATE PROCEDURE AddRegions(
    @name_region varchar(25)
	)
AS
BEGIN
    DECLARE @isValidname_region INT = 1;

	-- Check if region name contains characters or numbers
	IF PATINDEX('%[^a-zA-Z ]%', @name_region) > 0
	SET @isValidname_region = 0; 

	-- Insert only if region name is valid
	IF @isValidname_region = 1 
	BEGIN
    INSERT INTO [dbo].[tbl_regions] (name_region)
    VALUES (@name_region);
	END
	ELSE
	BEGIN

    -- Print error message
    PRINT 'Invalid input: Region Name Should in the Correct Format!.';
    END
END
