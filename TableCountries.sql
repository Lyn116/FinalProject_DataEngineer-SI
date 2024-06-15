CREATE TABLE tbl_countries(
    id char(3) PRIMARY KEY,
    country_name VARCHAR(50),
	region INT,
	FOREIGN KEY (region) REFERENCES tbl_regions(id)
);