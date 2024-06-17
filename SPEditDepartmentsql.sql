CREATE PROCEDURE EditDepartment
   @ID INT,
   @name_department varchar(30),
   @location INT
AS
BEGIN
	DECLARE @ErrorMessage NVARCHAR(255);

    -- Validasi New Region: region id harus ada di tabel tbl_regions
    IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @ID)
    BEGIN
        SET @ErrorMessage = 'Department id not Found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi DepartmentName: tidak boleh memuat angka atau karakter
	IF [dbo].[ValidateDepartment](@name_department) = 0
    BEGIN
        SET @ErrorMessage = 'Department Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi ID: Location id harus ada di tabel tbl_locations
    IF NOT EXISTS (SELECT 1 FROM tbl_locations WHERE id = @location)
    BEGIN
        SET @ErrorMessage = 'Location id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Jika DepartmentName valid, masukkan data ke tabel departments
	UPDATE tbl_departments
    SET name_department = @name_department, location = @location
    WHERE id = @ID;
END;
