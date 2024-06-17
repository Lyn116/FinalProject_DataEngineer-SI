CREATE PROCEDURE AddDepartment
   @name_department varchar(30),
   @location INT
AS
BEGIN
	DECLARE @ErrorMessage NVARCHAR(255);

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
    INSERT INTO tbl_departments
    VALUES (@name_department,@location);
END;
