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
	WindowView varchar(255),
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

CREATE TABLE problems (
	RoomID int,
	Problem varchar(255),
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

CREATE TABLE chain_phone_numbers (
	ChainID int,
	PhoneNo numeric(10,0),
	foreign key(ChainID) references hotel_chains
);

CREATE TABLE hotel_phone_numbers (
	HotelID int,
	PhoneNo numeric(10,0),
	foreign key(HotelID) references hotels
);


CREATE
    TRIGGER deconstruct_hotel BEFORE DELETE
    ON hotels
    FOR EACH ROW BEGIN
        DELETE FROM rooms
            WHERE rooms.HotelID = OLD.HotelID;
    END;

CREATE
  	TRIGGER deconstruct_room_rooms BEFORE DELETE
  	ON rooms
  	FOR EACH ROW BEGIN
      DELETE FROM customer_rooms
          WHERE customer_rooms.RoomID = OLD.roomID;
  	END;

CREATE
    TRIGGER deconstruct_hotel_chain BEFORE DELETE
    ON hotel_chains
    FOR EACH ROW BEGIN
        DELETE FROM hotels
            WHERE hotels.ChainID = OLD.ChainID;
    END;

CREATE
    TRIGGER deconstruct_employees BEFORE DELETE
    ON hotels
    FOR EACH ROW BEGIN
        DELETE FROM employees
            WHERE employees.HotelID = OLD.HotelID;
    END;

-- Attribute Table Triggers    

CREATE
    TRIGGER deconstruct_fk_amenities BEFORE DELETE
    ON rooms
    FOR EACH ROW BEGIN
        DELETE FROM amenities 
        WHERE amenities.RoomID = OLD.RoomID;
    END;


CREATE
    TRIGGER deconstruct_fk_problems BEFORE DELETE
    ON rooms
    FOR EACH ROW BEGIN
        DELETE FROM problems
        WHERE problems.RoomID = OLD.RoomID;
    END;


CREATE
    TRIGGER deconstruct_fk_roles BEFORE DELETE
    ON employees
    FOR EACH ROW BEGIN
        DELETE FROM roles 
        WHERE roles.EmployeeID = OLD.EmployeeID;
    END;


CREATE
    TRIGGER deconstruct_fk_emailaddresses BEFORE DELETE
    ON hotel_chains
    FOR EACH ROW BEGIN
        DELETE FROM email_addresses 
        WHERE email_addresses.ChainID = OLD.ChainID;
    END;

CREATE
    TRIGGER deconstruct_fk_chainphonenumbers BEFORE DELETE
    ON hotel_chains
    FOR EACH ROW BEGIN
        DELETE FROM chain_phone_numbers 
        WHERE chain_phone_numbers.ChainID = OLD.ChainID;
    END;

CREATE
    TRIGGER deconstruct_fk_hotelphonenumbers BEFORE DELETE
    ON hotels
    FOR EACH ROW BEGIN
        DELETE FROM hotel_phone_numbers 
        WHERE hotel_phone_numbers.HotelID = OLD.HotelID;
    END;