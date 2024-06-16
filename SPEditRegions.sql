CREATE PROCEDURE EditRegions
	@ID INT,
    @name_region varchar(25)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);

	-- Validasi ID: region id harus ada di tabel tbl_regions
    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @ID)
    BEGIN
        SET @ErrorMessage = 'Region id not Found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi New RegionName: tidak boleh memuat angka atau karakter
    IF @name_region = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'Region Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Jika semua data valid, ubah data di tabel tbl_countries
	UPDATE tbl_regions
    SET name_region = @name_region
    WHERE id = @ID;

    RETURN 1;
END;