CREATE PROCEDURE EditLocations
	@ID INT,
    @street_address varchar(40),
	@postal_code varchar(12),
	@city varchar(30),
	@state_province varchar(25),
	@country char(3)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);

	-- Validasi ID: Location id harus ada di tabel tbl_locations
    IF NOT EXISTS (SELECT 1 FROM tbl_locations WHERE id = @ID)
    BEGIN
        SET @ErrorMessage = 'Location id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi New Postal code: hanya memuat angka
    IF @postal_code LIKE '%[^0-9]%'
    BEGIN
        SET @ErrorMessage = 'Postal Code Cannot Contain Text!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi New City: tidak boleh memuat angka dan karakter
    IF @city = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'City Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi New State Province: tidak boleh memuat angka dan karakter
    IF @state_province = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'State Province Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi New Country: country id harus ada di tabel tbl_countries
    IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @country)
    BEGIN
        SET @ErrorMessage = 'Country id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Jika semua data valid, ubah data di tabel tbl_locations
	UPDATE tbl_locations
    SET street_address = @street_address, postal_code = @postal_code, city = @city, state_province = @state_province, country = @country
    WHERE id = @ID;

    RETURN 1;
END;