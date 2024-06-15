CREATE TABLE tbl_locations(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(25),
	country char(3),
	FOREIGN KEY (country) REFERENCES tbl_countries(id)
);