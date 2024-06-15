CREATE PROCEDURE AddCountries
    @ID CHAR(3),
    @country_name VARCHAR(50),
    @Region INT
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(255);

    -- Validasi ID: harus 3 karakter dan hanya huruf kapital
    IF LEN(@ID) <> 3 OR @ID LIKE '%[^A-Z]%'
    BEGIN
        SET @ErrorMessage = 'Country id Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi CountryName: tidak boleh memuat angka atau karakter
    IF @country_name = '%[^A-Za-z ]%'
    BEGIN
        SET @ErrorMessage = 'Country Name Should in the Correct Format!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Validasi untuk Region: region id harus ada di tabel tbl_regions
    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @Region)
    BEGIN
        SET @ErrorMessage = 'Region id not found!';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN 0;
    END

    -- Jika semua data valid, masukkan data ke tabel tbl_countries
    INSERT INTO tbl_countries (ID, country_name, region)
    VALUES (@ID, @country_name, @Region);

    RETURN 1;
END;