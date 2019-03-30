-- Original six
CREATE TABLE hotel_chains (
	ChainID int,
	ChainName varchar(255),
	OfficeAddress varchar(255),
	NoOfHotels int,
	primary key(ChainID)
);

CREATE TABLE hotels (
	HotelID int,
	HotelAddress varchar(255),
	City varchar(255),
	ContactEmail varchar(255),
	NoOfRooms int,
	Category int,
	ChainID int,
	primary key(HotelID),
	foreign key(ChainID) references hotel_chains
);

CREATE TABLE employees (
	EmployeeID int,
	EFirstName varchar(255),
	ELastName varchar(255),
	EmployeeAddress varchar(255),
	SSNSIN int,
	HotelID int,
	UserID int,
	primary key(EmployeeID),
	foreign key(HotelID) references hotels
);
	
CREATE TABLE rooms (
	RoomID int,
	Price numeric(6,2),
	Capacity int,
	Extendable boolean,
	Status varchar(255),
	View varchar(255),
	HotelID int,
	primary key(RoomID),
	foreign key(HotelID) references hotels
);

CREATE TABLE customers (
	CustomerID int,
	CFirstName varchar(255),
	CLastName varchar(255),
	CustomerAddress varchar(255),
	SSNSIN int,
	DateOfRegistration date,
	UserID int,
	primary key(CustomerID)
);

CREATE TABLE archive (
	ArchiveID int,
	RoomID int,
	CustomerID int,
	Price numeric(6,2),
	Capacity int,
	BookedRented varchar(255),
	ArchiveCheckin date,
	ArchiveCheckout date,
	primary key(ArchiveID)
);

-- Relationships
CREATE TABLE customer_archives (
	ArchiveID int,
	CustomerID int,
	foreign key(ArchiveID) references archive
foreign key(CustomerID) references customers
);

CREATE TABLE customer_rooms (
	RoomID int,
	CustomerID int,
	Checkin date,
	Checkout date,
	foreign key(RoomID) references rooms
	foreign key(CustomerID) references customers	
);

-- Attribute Tables
CREATE TABLE amenities (
	RoomID int,
	Amenity varchar(255),
	foreign key(RoomID) references rooms
);

CREATE TABLE roles (
	EmployeeID int,
	Role varchar(255),
	foreign key(EmployeeID) references employees
);

CREATE TABLE email_addresses (
	ChainID int,
	EmailAddress varchar(255),
	foreign key(ChainID) references hotel_chains
);

CREATE TABLE phone_numbers (
	ChainID int,
	PhoneNo numeric(10,0),
	foreign key(ChainID) references hotel_chains
);

-- Hotel Chain and Hotel Data

INSERT INTO hotel_chains
VALUES 
	( 1, "Hotel Chain 1", "Address 123 City", 14),
	( 2, "Hotel Chain 2", "Address 234 City", 45),
	( 3, "Hotel Chain 3", "Address 345 City", 25),
	( 4, "Hotel Chain 4", "Address 456 City", 10),
	( 5, "Hotel Chain 5", "Address 567 City", 46);

INSERT INTO hotels
VALUES 
	-- Hotel 1
	( 11, "123 Address St", "City1", "email1@email.ca", 15, 5, 1),
	( 12, "123 Address St", "City2", "email1@email.ca", 23, 5, 1),
	( 13, "123 Address St", "City3", "email1@email.ca", 32, 4, 1),
	( 14, "123 Address St", "City4", "email1@email.ca", 47, 3, 1),
	( 15, "123 Address St", "City5", "email1@email.ca", 99, 3, 1),
	( 16, "123 Address St", "City6", "email1@email.ca", 12, 2, 1),
	( 17, "123 Address St", "City7", "email1@email.ca", 76, 4, 1),
	( 18, "123 Address St", "City8", "email1@email.ca", 58, 4, 1),
	-- Hotel 2
	( 21, "223 Address St", "City1", "email2@email.ca", 15, 2, 2),
	( 22, "223 Address St", "City2", "email2@email.ca", 23, 1, 2),
	( 23, "223 Address St", "City3", "email2@email.ca", 32, 1, 2),
	( 24, "223 Address St", "City4", "email2@email.ca", 47, 2, 2),
	( 25, "223 Address St", "City5", "email2@email.ca", 99, 1, 2),
	( 26, "223 Address St", "City6", "email2@email.ca", 12, 2, 2),
	( 27, "223 Address St", "City7", "email2@email.ca", 76, 3, 2),
	( 28, "223 Address St", "City8", "email2@email.ca", 58, 1, 2),
	-- Hotel 3
	( 31, "323 Address St", "City1", "email3@email.ca", 15, 5, 3),
	( 32, "323 Address St", "City2", "email3@email.ca", 23, 4, 3),
	( 33, "323 Address St", "City3", "email3@email.ca", 32, 3, 3),
	( 34, "323 Address St", "City4", "email3@email.ca", 47, 4, 3),
	( 35, "323 Address St", "City5", "email3@email.ca", 99, 3, 3),
	( 36, "323 Address St", "City6", "email3@email.ca", 12, 4, 3),
	( 37, "323 Address St", "City7", "email3@email.ca", 76, 5, 3),
	( 38, "323 Address St", "City8", "email3@email.ca", 58, 3, 3),
	-- Hotel 4
	( 41, "423 Address St", "City1", "email4@email.ca", 15, 2, 4),
	( 42, "423 Address St", "City2", "email4@email.ca", 23, 2, 4),
	( 43, "423 Address St", "City3", "email4@email.ca", 32, 3, 4),
	( 44, "423 Address St", "City4", "email4@email.ca", 47, 2, 4),
	( 45, "423 Address St", "City5", "email4@email.ca", 99, 4, 4),
	( 46, "423 Address St", "City6", "email4@email.ca", 12, 2, 4),
	( 47, "423 Address St", "City7", "email4@email.ca", 76, 3, 4),
	( 48, "423 Address St", "City8", "email4@email.ca", 58, 2, 4),
	-- Hotel 5	
	( 51, "523 Address St", "City1", "email5@email.ca", 10, 5, 5),
	( 52, "523 Address St", "City2", "email5@email.ca", 14, 5, 5),
	( 53, "523 Address St", "City3", "email5@email.ca", 23, 5, 5),
	( 54, "523 Address St", "City4", "email5@email.ca", 13, 5, 5),
	( 55, "523 Address St", "City5", "email5@email.ca", 16, 5, 5),
	( 56, "523 Address St", "City6", "email5@email.ca", 10, 4, 5),
	( 57, "523 Address St", "City7", "email5@email.ca", 19, 4, 5),
	( 58, "523 Address St", "City8", "email5@email.ca", 20, 5, 5)
	;

INSERT INTO rooms
VALUES
	-- Room 1
	( 1, 140.00, 2, 1, "Booked", "Sea", 55),
	( 2, 140.00, 5, 1, "Rented", "Mountain", 35)
	;

