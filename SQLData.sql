-- Hotel Chain and Hotel Data

INSERT INTO hotel_chains
VALUES 
	( 1, "Mariot", "Address 123 City", 14),
	( 2, "Hyatt", "Address 234 City", 45),
	( 3, "Motel 6", "Address 345 City", 25),
	( 4, "Hilton", "Address 456 City", 10),
	( 5, "Sheridan", "Address 567 City", 46);

INSERT INTO hotels
VALUES 
	-- Hotel 1
	( 11, "5 Dundas St", "Toronto", "email1@email.ca", 15, 5, 1),
	( 12, "12 York St", "Toronto", "email1@email.ca", 23, 5, 1),
	( 13, "2 Charles St", "Lindsay", "email1@email.ca", 32, 4, 1),
	( 14, "2 Walker St", "Lindsay", "email1@email.ca", 47, 3, 1),
	( 15, "9 Walker St", "Lindsay", "email1@email.ca", 99, 3, 1),
	( 16, "87 Walker St", "Lindsay", "email1@email.ca", 12, 2, 1),
	( 17, "23 Dundas St", "Toronto", "email1@email.ca", 76, 4, 1),
	( 18, "4 Sunnydale St", "Halifax", "email1@email.ca", 58, 4, 1),
	-- Hotel 2
	( 21, "12 Yellow St", "City1", "email2@email.ca", 15, 2, 2),
	( 22, "90 Charles St", "Lindsay", "email2@email.ca", 23, 1, 2),
	( 23, "223 Charles St", "Lindsay", "email2@email.ca", 32, 1, 2),
	( 24, "90 York St", "Toronto", "email2@email.ca", 47, 2, 2),
	( 25, "223 York St", "Toronto", "email2@email.ca", 99, 1, 2),
	( 26, "344 Charles St", "Lindsay", "email2@email.ca", 12, 2, 2),
	( 27, "98 York St", "Toronto", "email2@email.ca", 76, 3, 2),
	( 28, "23 Walker St", "Lindsay", "email2@email.ca", 58, 1, 2),
	-- Hotel 3
	( 31, "323 Sunnydale St", "Halifax", "email3@email.ca", 15, 5, 3),
	( 32, "90 York St", "Toronto", "email3@email.ca", 23, 4, 3),
	( 33, "12 Charles St", "Lindsay", "email3@email.ca", 32, 3, 3),
	( 34, "323 Yellow St", "City4", "email3@email.ca", 47, 4, 3),
	( 35, "344 York St", "Toronto", "email3@email.ca", 99, 3, 3),
	( 36, "344 Walker St", "Lindsay", "email3@email.ca", 12, 4, 3),
	( 37, "323 Walker St", "Lindsay", "email3@email.ca", 76, 5, 3),
	( 38, "323 Yellow St", "City8", "email3@email.ca", 58, 3, 3),
	-- Hotel 4
	( 41, "423 Sunnydale St", "Halifax", "email4@email.ca", 15, 2, 4),
	( 42, "90 York St", "Toronto", "email4@email.ca", 23, 2, 4),
	( 43, "65 York St", "Toronto", "email4@email.ca", 32, 3, 4),
	( 44, "423 York St", "Toronto", "email4@email.ca", 47, 2, 4),
	( 45, "34 Walker St", "Lindsay", "email4@email.ca", 99, 4, 4),
	( 46, "423 Charles St", "Lindsay", "email4@email.ca", 12, 2, 4),
	( 47, "2 Yellow St", "City7", "email4@email.ca", 76, 3, 4),
	( 48, "12 Sunnydale St", "Halifax", "email4@email.ca", 58, 2, 4),
	-- Hotel 5	
	( 51, "344 Dundas St", "Toronto", "email5@email.ca", 10, 5, 5),
	( 52, "54 Dundas St", "Toronto", "email5@email.ca", 14, 5, 5),
	( 53, "3 Sunnydale St", "Halifax", "email5@email.ca", 23, 5, 5),
	( 54, "436 Charles St", "Lindsay", "email5@email.ca", 13, 5, 5),
	( 55, "523 York St", "Toronto", "email5@email.ca", 16, 5, 5),
	( 56, "12 Dundas St", "Toronto", "email5@email.ca", 10, 4, 5),
	( 57, "523 Dundas St", "Toronto", "email5@email.ca", 19, 4, 5),
	( 58, "2 York St", "Toronto", "email5@email.ca", 20, 5, 5)
	;

INSERT INTO rooms
VALUES
	-- Rooms in Hotel 1
	( 1, 900.00, 1, 1, "Available", "Sea", 11),
	( 2, 140.00, 9, 1, "Available", "Sea", 11),
	( 3, 900.00, 4, 1, "Available", "Sea", 11),
	( 4, 140.00, 5, 1, "Available", "Sea", 11),
	( 5, 900.00, 6, 1, "Available", "Sea", 11),
	( 6, 900.00, 1, 1, "Available", "Sea", 12),
	( 7, 140.00, 9, 1, "Available", "Sea", 12),
	( 8, 900.00, 4, 1, "Available", "Sea", 12),
	( 9, 140.00, 5, 1, "Available", "Sea", 12),
	( 10, 900.00, 6, 1, "Available", "Sea", 12),
	( 11, 900.00, 1, 1, "Available", "Sea", 13),
	( 12, 140.00, 9, 1, "Available", "Sea", 13),
	( 13, 900.00, 4, 1, "Available", "Sea", 13),
	( 14, 140.00, 5, 1, "Available", "Sea", 13),
	( 15, 900.00, 6, 1, "Available", "Sea", 13),
	( 16, 900.00, 1, 1, "Available", "Sea", 14),
	( 17, 140.00, 9, 1, "Available", "Sea", 14),
	( 18, 900.00, 4, 1, "Available", "Sea", 14),
	( 19, 140.00, 5, 1, "Available", "Sea", 14),
	( 20, 900.00, 6, 1, "Available", "Sea", 14),
	( 21, 900.00, 1, 1, "Available", "Sea", 15),
	( 22, 140.00, 9, 1, "Available", "Sea", 15),
	( 23, 900.00, 4, 1, "Available", "Sea", 15),
	( 24, 140.00, 5, 1, "Available", "Sea", 15),
	( 25, 900.00, 6, 1, "Available", "Sea", 15),
	( 26, 900.00, 1, 1, "Available", "Sea", 16),
	( 27, 140.00, 9, 1, "Available", "Sea", 16),
	( 28, 900.00, 4, 1, "Available", "Sea", 16),
	( 29, 140.00, 5, 1, "Available", "Sea", 16),
	( 30, 900.00, 6, 1, "Available", "Sea", 16),
	( 31, 900.00, 1, 1, "Available", "Sea", 17),
	( 32, 140.00, 9, 1, "Available", "Sea", 17),
	( 33, 900.00, 4, 1, "Available", "Sea", 17),
	( 34, 140.00, 5, 1, "Available", "Sea", 17),
	( 35, 900.00, 6, 1, "Available", "Sea", 17),
	( 36, 900.00, 1, 1, "Available", "Sea", 18),
	( 37, 140.00, 9, 1, "Available", "Sea", 18),
	( 38, 900.00, 4, 1, "Available", "Sea", 18),
	( 39, 140.00, 5, 1, "Available", "Sea", 18),
	( 40, 900.00, 6, 1, "Available", "Sea", 18),
	( 41, 900.00, 1, 1, "Available", "Sea", 21),
	( 42, 140.00, 9, 1, "Available", "Sea", 21),
	( 43, 900.00, 4, 1, "Available", "Sea", 21),
	( 44, 140.00, 5, 1, "Available", "Sea", 21),
	( 45, 900.00, 6, 1, "Available", "Sea", 21),
	( 46, 900.00, 1, 1, "Available", "Sea", 22),
	( 47, 140.00, 9, 1, "Available", "Sea", 22),
	( 48, 900.00, 4, 1, "Available", "Sea", 22),
	( 49, 140.00, 5, 1, "Available", "Sea", 22),
	( 50, 900.00, 6, 1, "Available", "Sea", 22),
	( 51, 900.00, 1, 1, "Available", "Sea", 23),
	( 52, 140.00, 9, 1, "Available", "Sea", 23),
	( 53, 900.00, 4, 1, "Available", "Sea", 23),
	( 54, 140.00, 5, 1, "Available", "Sea", 23),
	( 55, 900.00, 6, 1, "Available", "Sea", 23),
	( 56, 900.00, 1, 1, "Available", "Sea", 24),
	( 57, 140.00, 9, 1, "Available", "Sea", 24),
	( 58, 900.00, 4, 1, "Available", "Sea", 24),
	( 59, 140.00, 5, 1, "Available", "Sea", 24),
	( 60, 900.00, 6, 1, "Available", "Sea", 24),
	( 61, 900.00, 1, 1, "Available", "Sea", 25),
	( 62, 140.00, 9, 1, "Available", "Sea", 25),
	( 63, 900.00, 4, 1, "Available", "Sea", 25),
	( 64, 140.00, 5, 1, "Available", "Sea", 25),
	( 65, 900.00, 6, 1, "Available", "Sea", 25),
	( 66, 900.00, 1, 1, "Available", "Sea", 26),
	( 67, 140.00, 9, 1, "Available", "Sea", 26),
	( 68, 900.00, 4, 1, "Available", "Sea", 26),
	( 69, 140.00, 5, 1, "Available", "Sea", 26),
	( 70, 900.00, 6, 1, "Available", "Sea", 26),
	( 71, 900.00, 1, 1, "Available", "Sea", 27),
	( 72, 140.00, 9, 1, "Available", "Sea", 27),
	( 73, 900.00, 4, 1, "Available", "Sea", 27),
	( 74, 140.00, 5, 1, "Available", "Sea", 27),
	( 75, 900.00, 6, 1, "Available", "Sea", 27),
	( 76, 900.00, 1, 1, "Available", "Sea", 28),
	( 77, 140.00, 9, 1, "Available", "Sea", 28),
	( 78, 900.00, 4, 1, "Available", "Sea", 28),
	( 79, 140.00, 5, 1, "Available", "Sea", 28),
	( 80, 900.00, 6, 1, "Available", "Sea", 28),
	( 81, 900.00, 1, 1, "Available", "Sea", 31),
	( 82, 140.00, 9, 1, "Available", "Sea", 31),
	( 83, 900.00, 4, 1, "Available", "Sea", 31),
	( 84, 140.00, 5, 1, "Available", "Sea", 31),
	( 85, 900.00, 6, 1, "Available", "Sea", 31),
	( 86, 900.00, 1, 1, "Available", "Sea", 32),
	( 87, 140.00, 9, 1, "Available", "Sea", 32),
	( 88, 900.00, 4, 1, "Available", "Sea", 32),
	( 89, 140.00, 5, 1, "Available", "Sea", 32),
	( 90, 900.00, 6, 1, "Available", "Sea", 32),
	( 91, 900.00, 1, 1, "Available", "Sea", 33),
	( 92, 140.00, 9, 1, "Available", "Sea", 33),
	( 93, 900.00, 4, 1, "Available", "Sea", 33),
	( 94, 140.00, 5, 1, "Available", "Sea", 33),
	( 95, 900.00, 6, 1, "Available", "Sea", 33),
	( 96, 900.00, 1, 1, "Available", "Sea", 34),
	( 97, 140.00, 9, 1, "Available", "Sea", 34),
	( 98, 900.00, 4, 1, "Available", "Sea", 34),
	( 99, 140.00, 5, 1, "Available", "Sea", 34),
	( 100, 900.00, 1, 1, "Available", "Sea", 34),
	( 101, 900.00, 9, 1, "Available", "Sea", 35),
	( 102, 140.00, 4, 1, "Available", "Sea", 35),
	( 103, 900.00, 5, 1, "Available", "Sea", 35),
	( 104, 140.00, 6, 1, "Available", "Sea", 35),
	( 105, 900.00, 2, 1, "Available", "Sea", 35),
	( 106, 900.00, 1, 1, "Available", "Sea", 36),
	( 107, 140.00, 9, 1, "Available", "Sea", 36),
	( 108, 900.00, 4, 1, "Available", "Sea", 36),
	( 109, 140.00, 5, 1, "Available", "Sea", 36),
	( 110, 900.00, 6, 1, "Available", "Sea", 36),
	( 111, 900.00, 1, 1, "Available", "Sea", 37),
	( 112, 140.00, 9, 1, "Available", "Sea", 37),
	( 113, 900.00, 4, 1, "Available", "Sea", 37),
	( 114, 140.00, 5, 1, "Available", "Sea", 37),
	( 115, 900.00, 6, 1, "Available", "Sea", 37),
	( 116, 900.00, 1, 1, "Available", "Sea", 38),
	( 117, 140.00, 9, 1, "Available", "Sea", 38),
	( 118, 900.00, 4, 1, "Available", "Sea", 38),
	( 119, 140.00, 5, 1, "Available", "Sea", 38),
	( 120, 900.00, 6, 1, "Available", "Sea", 38),
	( 121, 900.00, 1, 1, "Available", "Sea", 41),
	( 122, 140.00, 9, 1, "Available", "Sea", 41),
	( 123, 900.00, 4, 1, "Available", "Sea", 41),
	( 124, 140.00, 5, 1, "Available", "Sea", 41),
	( 125, 900.00, 6, 1, "Available", "Sea", 41),
	( 126, 900.00, 1, 1, "Available", "Sea", 42),
	( 127, 140.00, 9, 1, "Available", "Sea", 42),
	( 128, 900.00, 4, 1, "Available", "Sea", 42),
	( 129, 140.00, 5, 1, "Available", "Sea", 42),
	( 130, 900.00, 6, 1, "Available", "Sea", 42),
	( 131, 900.00, 1, 1, "Available", "Sea", 43),
	( 132, 140.00, 9, 1, "Available", "Sea", 43),
	( 133, 900.00, 4, 1, "Available", "Sea", 43),
	( 134, 140.00, 5, 1, "Available", "Sea", 43),
	( 135, 900.00, 6, 1, "Available", "Sea", 43),
	( 136, 900.00, 1, 1, "Available", "Sea", 44),
	( 137, 140.00, 9, 1, "Available", "Sea", 44),
	( 138, 900.00, 4, 1, "Available", "Sea", 44),
	( 139, 140.00, 5, 1, "Available", "Sea", 44),
	( 140, 900.00, 6, 1, "Available", "Sea", 44),
	( 141, 900.00, 1, 1, "Available", "Sea", 45),
	( 142, 140.00, 9, 1, "Available", "Sea", 45),
	( 143, 900.00, 4, 1, "Available", "Sea", 45),
	( 144, 140.00, 5, 1, "Available", "Sea", 45),
	( 145, 900.00, 6, 1, "Available", "Sea", 45),
	( 146, 900.00, 1, 1, "Available", "Sea", 46),
	( 147, 140.00, 9, 1, "Available", "Sea", 46),
	( 148, 900.00, 4, 1, "Available", "Sea", 46),
	( 149, 140.00, 5, 1, "Available", "Sea", 46),
	( 150, 900.00, 6, 1, "Available", "Sea", 46),
	( 151, 900.00, 1, 1, "Available", "Sea", 47),
	( 152, 140.00, 9, 1, "Available", "Sea", 47),
	( 153, 900.00, 4, 1, "Available", "Sea", 47),
	( 154, 140.00, 5, 1, "Available", "Sea", 47),
	( 155, 900.00, 6, 1, "Available", "Sea", 47),
	( 156, 900.00, 1, 1, "Available", "Sea", 48),
	( 157, 140.00, 9, 1, "Available", "Sea", 48),
	( 158, 900.00, 4, 1, "Available", "Sea", 48),
	( 159, 140.00, 5, 1, "Available", "Sea", 48),
	( 160, 900.00, 6, 1, "Available", "Sea", 48),
	( 161, 900.00, 1, 1, "Available", "Sea", 51),
	( 162, 140.00, 9, 1, "Available", "Sea", 51),
	( 163, 900.00, 4, 1, "Available", "Sea", 51),
	( 164, 140.00, 5, 1, "Available", "Sea", 51),
	( 165, 900.00, 6, 1, "Available", "Sea", 51),
	( 166, 900.00, 1, 1, "Available", "Sea", 52),
	( 167, 140.00, 9, 1, "Available", "Sea", 52),
	( 168, 900.00, 4, 1, "Available", "Sea", 52),
	( 169, 140.00, 5, 1, "Available", "Sea", 52),
	( 170, 900.00, 6, 1, "Available", "Sea", 52),
	( 171, 900.00, 1, 1, "Available", "Sea", 53),
	( 172, 140.00, 9, 1, "Available", "Sea", 53),
	( 173, 900.00, 4, 1, "Available", "Sea", 53),
	( 174, 140.00, 5, 1, "Available", "Sea", 53),
	( 175, 900.00, 6, 1, "Available", "Sea", 53),
	( 176, 900.00, 1, 1, "Available", "Sea", 54),
	( 177, 140.00, 9, 1, "Available", "Sea", 54),
	( 178, 900.00, 4, 1, "Available", "Sea", 54),
	( 179, 140.00, 5, 1, "Available", "Sea", 54),
	( 180, 900.00, 6, 1, "Available", "Sea", 54),
	( 181, 900.00, 1, 1, "Available", "Sea", 55),
	( 182, 140.00, 9, 1, "Available", "Sea", 55),
	( 183, 900.00, 4, 1, "Available", "Sea", 55),
	( 184, 140.00, 5, 1, "Available", "Sea", 55),
	( 185, 900.00, 6, 1, "Available", "Sea", 55),
	( 186, 900.00, 1, 1, "Available", "Sea", 56),
	( 187, 140.00, 9, 1, "Available", "Sea", 56),
	( 188, 900.00, 4, 1, "Available", "Sea", 56),
	( 189, 140.00, 5, 1, "Available", "Sea", 56),
	( 190, 900.00, 6, 1, "Available", "Sea", 56),
	( 191, 900.00, 1, 1, "Available", "Sea", 57),
	( 192, 140.00, 9, 1, "Available", "Sea", 57),
	( 193, 900.00, 4, 1, "Available", "Sea", 57),
	( 194, 140.00, 5, 1, "Available", "Sea", 57),
	( 195, 900.00, 6, 1, "Available", "Sea", 57),
	( 196, 900.00, 1, 1, "Available", "Sea", 58),
	( 197, 140.00, 9, 1, "Available", "Sea", 58),
	( 198, 900.00, 4, 1, "Available", "Sea", 58),
	( 199, 140.00, 5, 1, "Available", "Sea", 58),
	( 200, 900.00, 6, 1, "Available", "Sea", 58)
	;