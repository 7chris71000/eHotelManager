-- Original six
CREATE TABLE hotel_chains (
	ChainID int,
	Name varchar(255),
	OfficeAddress varchar(255),
	NoOfHotels int,
	primary key(ChainID)
);

CREATE TABLE hotels (
	HotelID int,
	Address varchar(255),
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
	FirstName varchar(255),
	LastName varchar(255),
	Address varchar(255),
	SSNSIN int,
	HotelID int,
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
	FirstName varchar(255),
	LastName varchar(255),
	SSNSIN int,
	Address varchar(255),
	DateOfRegistration date,
	primary key(CustomerID)
);

CREATE TABLE archive (
	ArchiveID int,
	RoomID int,
	CustomerID int,
	Price numeric(6,2),
	Capacity int,
	BookedRented varchar(255),
	DateOfRegistration date,
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
	DateOfRegistration date,
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
	( 11, "Address 123 City1", "email1@email.ca", 15, 5, 1),
	( 12, "Address 123 City2", "email1@email.ca", 23, 5, 1),
	( 13, "Address 123 City3", "email1@email.ca", 32, 4, 1),
	( 14, "Address 123 City4", "email1@email.ca", 47, 3, 1),
	( 15, "Address 123 City5", "email1@email.ca", 99, 3, 1),
	( 16, "Address 123 City6", "email1@email.ca", 12, 2, 1),
	( 17, "Address 123 City7", "email1@email.ca", 76, 4, 1),
	( 18, "Address 123 City8", "email1@email.ca", 58, 4, 1),
	-- Hotel 2
	( 21, "Address 223 City1", "email2@email.ca", 15, 2, 2),
	( 22, "Address 223 City2", "email2@email.ca", 23, 1, 2),
	( 23, "Address 223 City3", "email2@email.ca", 32, 1, 2),
	( 24, "Address 223 City4", "email2@email.ca", 47, 2, 2),
	( 25, "Address 223 City5", "email2@email.ca", 99, 1, 2),
	( 26, "Address 223 City6", "email2@email.ca", 12, 2, 2),
	( 27, "Address 223 City7", "email2@email.ca", 76, 3, 2),
	( 28, "Address 223 City8", "email2@email.ca", 58, 1, 2),
	-- Hotel 3
	( 31, "Address 323 City1", "email3@email.ca", 15, 5, 3),
	( 32, "Address 323 City2", "email3@email.ca", 23, 4, 3),
	( 33, "Address 323 City3", "email3@email.ca", 32, 3, 3),
	( 34, "Address 323 City4", "email3@email.ca", 47, 4, 3),
	( 35, "Address 323 City5", "email3@email.ca", 99, 3, 3),
	( 36, "Address 323 City6", "email3@email.ca", 12, 4, 3),
	( 37, "Address 323 City7", "email3@email.ca", 76, 5, 3),
	( 38, "Address 323 City8", "email3@email.ca", 58, 3, 3),
	-- Hotel 4
	( 41, "Address 423 City1", "email4@email.ca", 15, 2, 4),
	( 42, "Address 423 City2", "email4@email.ca", 23, 2, 4),
	( 43, "Address 423 City3", "email4@email.ca", 32, 3, 4),
	( 44, "Address 423 City4", "email4@email.ca", 47, 2, 4),
	( 45, "Address 423 City5", "email4@email.ca", 99, 4, 4),
	( 46, "Address 423 City6", "email4@email.ca", 12, 2, 4),
	( 47, "Address 423 City7", "email4@email.ca", 76, 3, 4),
	( 48, "Address 423 City8", "email4@email.ca", 58, 2, 4),
	-- Hotel 5	
	( 51, "Address 523 City1", "email5@email.ca", 10, 5, 5),
	( 52, "Address 523 City2", "email5@email.ca", 14, 5, 5),
	( 53, "Address 523 City3", "email5@email.ca", 23, 5, 5),
	( 54, "Address 523 City4", "email5@email.ca", 13, 5, 5),
	( 55, "Address 523 City5", "email5@email.ca", 16, 5, 5),
	( 56, "Address 523 City6", "email5@email.ca", 10, 4, 5),
	( 57, "Address 523 City7", "email5@email.ca", 19, 4, 5),
	( 58, "Address 523 City8", "email5@email.ca", 20, 5, 5)
	;

