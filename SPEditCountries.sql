CREATE PROCEDURE EditCountries
	@ID CHAR(3),
    @country_name VARCHAR(50),
    @Region INT
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);

-- Validasi ID: country id harus ada di tbl_countries
    IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @ID)
    BEGIN
        SET @ErrorMessage = 'country id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi New CountryName: tidak boleh memuat angka atau karakter
    IF @country_name = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'Country Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi New Region: region id harus ada di tabel tbl_regions
    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @Region)
    BEGIN
        SET @ErrorMessage = 'Region id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Jika semua data valid, ubah data di tabel tbl_locations
	UPDATE tbl_countries
    SET country_name = @country_name, region = @Region
    WHERE id = @ID;

    RETURN 1;
END;