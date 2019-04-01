class RoomsController < ApplicationController

	def index
		
	end

	def new
		@title = "New Room"
		@new_room = Room.new
		get_all_hotels
	end

	def create

		if params["extendable"] = "True"
			extendable = 1
		else
			extendable = 0
		end

		roomMaxID = ActiveRecord::Base.connection.execute(
      "
      SELECT MAX( RoomID ) FROM rooms;
      "
      );

    if (!roomMaxID[0][0].present?)
      roomMaxID = 0
    end

		ActiveRecord::Base.connection.execute(
			"
			INSERT INTO rooms
			VALUES 
			(
			#{roomMaxID[0][0] + 1}, 
			'#{params["price"]}', 
			'#{params["capacity"]}', 
			#{extendable}, 
			'#{params["status"]}', 
			'#{params["view"]}',
			'#{params["hotelID"]}'
			);
			"
			);


		# Add to Amenitites
		amenitiesString = params["amenities"]
		if(amenitiesString == "")

		elsif(!amenitiesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO amenities
					VALUES 
					( '#{roomMaxID[0][0] + 1}', '#{amenitiesString}');
					"
					);
		else	
			amenitiesArray = amenitiesString.split(",")
			amenitiesArray.each do |amenity|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO amenities
					VALUES 
					( '#{roomMaxID[0][0] + 1}', '#{amenity}');
					"
					);
			end
		end


		# Add to Problems
		problemsString = params["problems"]

		if(problemsString == "")

		elsif(!problemsString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO problems
					VALUES 
					( '#{roomMaxID[0][0] + 1}', '#{problemsString}');
					"
					);
		else
			problemsArray = problemsString.split(",")
			problemsArray.each do |problem|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO problems
					VALUES 
					( '#{roomMaxID[0][0] + 1}', '#{problem}');
					"
					);
			end
		end
	end

	def show
		set_room
	end

	def edit
		@title = "Book Room"
		set_room
		@room_empty = Room.find(params[:id])
	end

	def update

		if params["extendable"] = "True"
			extendable = 1
		else
			extendable = 0
		end

		ActiveRecord::Base.connection.execute(
			"
			UPDATE rooms
			SET 
			Price = '#{params["price"]}',
			Capacity = '#{params["capacity"]}',
			Extendable = #{extendable},
			Status = '#{params["status"]}',
			WindowView = '#{params["view"]}'
			WHERE RoomID = #{params[:id]}
			;
			"
			);


		# Add to Amenitites
		amenitiesString = params["amenities"]
		if(amenitiesString == "")

		elsif(!amenitiesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO amenities
					VALUES 
					( '#{params[:id]}', '#{amenitiesString}');
					"
					);
		else	
			amenitiesArray = amenitiesString.split(",")
			amenitiesArray.each do |amenity|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO amenities
					VALUES 
					( '#{params[:id]}', '#{amenity}');
					"
					);
			end
		end


		# Add to Problems
		problemsString = params["problems"]

		if(problemsString == "")

		elsif(!problemsString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO problems
					VALUES 
					( '#{params[:id]}', '#{problemsString}');
					"
					);
		else
			problemsArray = problemsString.split(",")
			problemsArray.each do |problem|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO problems
					VALUES 
					( '#{params[:id]}', '#{problem}');
					"
					);
			end
		end
	end

	def destroy

		ActiveRecord::Base.connection.execute(
			"
			DELETE 
			FROM customer_rooms
			WHERE RoomID = #{params[:id]}
			;
			"
			);

		ActiveRecord::Base.connection.execute(
			"
			DELETE 
			FROM rooms
			WHERE RoomID = #{params[:id]}
			;
			"
			);

	end

	def success
		@title = "Success"
	end

	def holdingForCheckout
		start = params["date_start"]
		ending = params["date_end"]

		get_all_rooms

		noVacancy = false

		@booked_rooms.each do |room|

			a = room["Checkin"]
			b = room["Checkout"]
			n = start
			m = ending

			# Checkin and checkout ~between current
			if (n.between?(a,b)) or (m.between?(a,b)) or (n < a and b < m) or (n >= m)
				noVacancy = true
			end

			break if noVacancy
		end

		if current_user.user_type == 'customer'
			# user signed in is customer
			get_user_customer
		else
			get_user_employee
		end

		if noVacancy
			# Do not add to database and send back to update form 
			print("\nError in adding room due to times requested.\n\n")
			redirect_to edit_room_path
			return

		else 
			# Update database 
			print("\nUpdating the Database\n\n")
			
			ActiveRecord::Base.connection.execute(
				"
				INSERT INTO customer_rooms
				VALUES 
				( #{params[:id]}, #{@online['CustomerID']}, '#{start}', '#{ending}');
				"
				);
		end

		render 'success'
	end


	private

		def set_room
			roomId = params[:id]

			room = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM rooms r
				JOIN hotels h
				on r.HotelID = h.HotelID
				JOIN hotel_chains hc
				on h.ChainID = hc.ChainID
				WHERE RoomID = #{roomId}
				;
				"
				);

			@room = room.first()

		end

		def get_all_rooms
			@booked_rooms = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM customer_rooms
				;
				"
				);
		end

		def get_user_customer

			online = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM customers
				WHERE UserID = #{current_user.id}
				;
				"
				);

			@online = online.first()
		end

		def get_user_employee

			customerSSN = params["customerSSN"]

			online = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM customers
				WHERE SSNSIN = #{customerSSN}
				;
				"
				);

			@online = online.first()
		end

		def get_all_hotels
			@hotels = ActiveRecord::Base.connection.execute(
      "
      SELECT * 
      FROM hotels
      ;
      "
      );
		end

end
