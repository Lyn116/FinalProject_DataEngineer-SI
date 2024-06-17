CREATE PROCEDURE DeleteLocations
    @ID INT
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
	-- Jika ID valid, hapus data di tabel locations
    DELETE FROM tbl_locations
    WHERE id = @ID;
END;