class HotelsController < ApplicationController

	def index
		@form_data = params
		params["capacity"] != "" ? capacity = params["capacity"] : capacity = "%"
		params["chain"] != "" ? chain = params["chain"] : chain = "%"
		params["rating"] != "" ? rating = params["rating"] : rating = "%"
		params["number_of_rooms"] != "" ? noOfRooms = params["number_of_rooms"] : noOfRooms = "%"
		params["price"] != "" ? price = params["price"] : price = "%" 

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

		@hotels = results
	 
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

end
