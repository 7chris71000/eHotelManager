class HotelsController < ApplicationController

	def index

		@title = "Results"

		@form_data = params
		params["capacity"] != "" ? capacity = params["capacity"] : capacity = "%"
		params["chain"] != "" ? chain = params["chain"] : chain = "%"
		params["rating"] != "" ? rating = params["rating"] : rating = "%"
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
				AND NoOfRooms LIKE '#{noOfRooms}'
				AND Price LIKE '#{price}'
				ORDER BY rooms.RoomID
				;
				"
			);

		@rooms = results

		print("\n\n\n\n\n\n\n#{@rooms}\n\n\n\n\n\n\n\n\n")

		# take out results that are booked in time requested
		get_all_rooms

		print("\n\n\n\n\n\n\n#{@booked_rooms}\n\n\n\n\n\n\n\n\n")

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

	def new
	end

	def show
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	def list
		print("\n\n\n\n\n\n#{params[:id]}\n\n\n\n\n\n\n\n")
		@hotels = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotels
				ORDER BY HotelID
				;
				"
				);
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

end
