-- Original six
CREATE TABLE hotel_chain (
	ChainID int,
	Name varchar(255),
	OfficeAddress varchar(255),
	NoOfHotels int,
	primary key(ChainID)
);

CREATE TABLE hotel (
	HotelID int,
	Address varchar(255),
	ContactEmail varchar(255),
	NoOfRooms int,
	Category int,
	ChainID int,
	primary key(HotelID),
	foreign key(ChainID) references hotel_chain
);

CREATE TABLE employee (
	EmployeeID int,
	FirstName varchar(255),
	LastName varchar(255),
	Address varchar(255),
	SSNSIN int,
	HotelID int,
	primary key(EmployeeID),
	foreign key(HotelID) references hotel
);

CREATE TABLE room (
	RoomID int,
	Price numeric(6,2),
	Capacity int,
	Extendable boolean,
	Status varchar(255),
	View varchar(255),
	HotelID int,
	primary key(RoomID),
	foreign key(HotelID) references hotel
);

CREATE TABLE customer (
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
CREATE TABLE customer_archive (
	ArchiveID int,
	CustomerID int,
	foreign key(ArchiveID) references archive
	foreign key(CustomerID) references customer
);

CREATE TABLE customer_room (
	RoomID int,
	CustomerID int,
	DateOfRegistration date,
	foreign key(RoomID) references room
	foreign key(CustomerID) references customer	
);

-- Attribute Tables
CREATE TABLE amenities (
	RoomID int,
	Amenity varchar(255),
	foreign key(RoomID) references room
);

CREATE TABLE roles (
	EmployeeID int,
	Role varchar(255),
	foreign key(EmployeeID) references employee
);

CREATE TABLE email_addresses (
	ChainID int,
	EmailAddress varchar(255),
	foreign key(ChainID) references hotel_chain
);

CREATE TABLE phone_numbers (
	ChainID int,
	PhoneNo numeric(10,0),
	foreign key(ChainID) references hotel_chain
);

-- Hotel Chain and Hotel Data

INSERT INTO hotel_chain
VALUES 
	( 1, "Hotel Chain 1", "Address 123 City", 14),
	( 2, "Hotel Chain 2", "Address 234 City", 45),
	( 3, "Hotel Chain 3", "Address 345 City", 25),
	( 4, "Hotel Chain 4", "Address 456 City", 10),
	( 5, "Hotel Chain 5", "Address 567 City", 46);