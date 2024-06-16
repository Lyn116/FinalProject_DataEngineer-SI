CREATE PROCEDURE AddLocations
    @street_address varchar(40),
	@postal_code varchar(12),
	@city varchar(30),
	@state_province varchar(25),
	@country char(3)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);

    -- Validasi Postal code: hanya memuat angka
    IF @postal_code LIKE '%[^0-9]%'
    BEGIN
        SET @ErrorMessage = 'Postal Code Cannot Contain Text!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi City: tidak boleh memuat angka dan karakter
    IF @city = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'City Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

	-- Validasi State Province: tidak boleh memuat angka dan karakter
    IF @state_province = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'State Province Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi Country: country id harus ada di tabel tbl_countries
    IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @country)
    BEGIN
        SET @ErrorMessage = 'Country id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Jika semua data valid, masukkan data ke tabel tbl_locations
    INSERT INTO tbl_locations(street_address, postal_code, city, state_province, country)
    VALUES (@street_address, @postal_code, @city, @state_province, @country);

    RETURN 1;
END;