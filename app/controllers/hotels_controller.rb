class HotelsController < ApplicationController

	def index
	end

	def new
		@title = "New Hotel"
		get_all_chains
		@hotel_empty = Hotel.new
	end

	def show
	end

	def edit
		@title = "Update Hotel"
		set_hotel
		@hotel_empty = Hotel.find(params[:id])
	end

	def create
		hotelMaxID = ActiveRecord::Base.connection.execute(
      "
      SELECT MAX( HotelID ) FROM hotels;
      "
      );

    if (!hotelMaxID[0][0].present?)
      hotelMaxID = 0
    end

		ActiveRecord::Base.connection.execute(
			"
			INSERT INTO hotels
			VALUES 
			(
			#{hotelMaxID[0][0] + 1}, 
			'#{params["address"]}', 
			'#{params["city"]}', 
			'#{params["email"]}', 
			'#{params["numrooms"]}', 
			'#{params["rating"]}', 
			'#{params["chain"]}'
			);
			"
			);


		phonesString = params["phones"]

		if(phonesString == "")

		elsif(!phonesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO hotel_phone_numbers
					VALUES 
					( '#{hotelMaxID[0][0] + 1}', '#{phonesString}');
					"
					);
		else
			phonesArray = phonesString.split(",")
			phonesArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO hotel_phone_numbers
					VALUES 
					( '#{hotelMaxID[0][0] + 1}', '#{phones}');
					"
					);
			end
		end
		render 'success_hotel_add'
	end

	def update
		set_hotel

		ActiveRecord::Base.connection.execute(
			"
			UPDATE hotels
			SET 
			HotelAddress = '#{params["address"]}',
			City = '#{params["city"]}',
			ContactEmail = '#{params["email"]}',
			NoOfRooms = '#{params["numrooms"]}',
			Category = '#{params["rating"]}',
			ChainID = '#{@chainID}'
			WHERE HotelID = #{params[:id]}
			;
			"
			);

		# Add to Amenitites
		phonesString = params["phones"]

		if(phonesString == "")

		elsif(!phonesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO hotel_phone_numbers
					VALUES 
					( '#{params[:id]}', '#{phonesString}');
					"
					);
		else
			phonesArray = phonesString.split(",")
			phonesArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO hotel_phone_numbers
					VALUES 
					( '#{params[:id]}', '#{phones}');
					"
					);
			end
		end
		render 'success_hotel'
	end

	def success_hotel
		@title = "Successful Update"
	end

	def success_hotel_delete
		@title = "Successful Update"
	end

	def success_hotel_add
		@title = "Successful Addition"
	end

	def destroy
		ActiveRecord::Base.connection.execute(
			"
			DELETE 
			FROM hotels
			WHERE HotelID = #{params[:id]}
			;
			"
			);

		render 'success_hotel_delete'
	end

	def results
		
		@title = "Results"

		@form_data = params
		params["capacity"] != "" ? capacity = params["capacity"] : capacity = "%"
		params["chain"] != "" ? chain = params["chain"] : chain = "%"
		params["rating"] != "" ? rating = params["rating"] : rating = "%"
		params["city"] != "" ? city = params["city"] : city = "%"
		params["hotel-address"] != "" ? hotel_address = params["hotel-address"] : hotel_address = "%"
		params["number_of_rooms"] != "" ? noOfRooms = params["number_of_rooms"] : noOfRooms = "%"
		params["price"] != "" ? price = params["price"] : price = "%" 
		params["date_start"] != "" ? date_start = params["date_start"] : date_start = "%" 
		params["date_end"] != "" ? date_end = params["date_end"] : date_end = "%" 

		
		results = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotels h
				JOIN hotel_chains hc
				on h.ChainID = hc.ChainID
				JOIN rooms
				on rooms.HotelID = h.HotelID
				WHERE Capacity LIKE '#{capacity}'
				AND ChainName LIKE '#{chain}'
				AND Category LIKE '#{rating}'
				AND City LIKE '#{city}'
				AND HotelAddress LIKE '#{hotel_address}'
				AND NoOfRooms LIKE '#{noOfRooms}'
				AND Price LIKE '#{price}'
				ORDER BY rooms.RoomID
				;
				"
			);

		@rooms = results

		# print("\n\n\n\n\n\n\n#{@rooms}\n\n\n\n\n\n\n\n\n")

		# take out results that are booked in time requested
		get_all_rooms

		# print("\n\n\n\n\n\n\n#{@booked_rooms}\n\n\n\n\n\n\n\n\n")

		@booked_rooms.each do |booked_room|
			a = booked_room["Checkin"]
			b = booked_room["Checkout"]
			n = date_start
			m = date_end

			# Checkin and checkout ~between current
			if (n.between?(a,b)) or (m.between?(a,b)) or (n < a and b < m) or (n >= m)
				# if here the rooms is booked therefore take out of @rooms
				@rooms.each do |room|
					if room["RoomID"] == booked_room["RoomID"]
						@rooms.delete(room)
					end
				end

			end

		end

	end

	private

		def get_all_rooms
			@booked_rooms = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM customer_rooms
				;
				"
				);
		end

		def get_all_chains
			@chains = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotel_chains
				;
				"
				);
		end

		def set_hotel
			hotelID = params[:id]

			hotel = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotels h
				JOIN hotel_chains hc
				on h.ChainID = hc.ChainID
				WHERE HotelID = #{hotelID}
				;
				"
				);

			@hotel = hotel.first()
			@chainID = @hotel["ChainID"]

		end

end
