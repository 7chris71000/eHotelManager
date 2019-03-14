class RoomsController < ApplicationController

	def index
		
	end

	def new
	end

	def show
		set_room
	end

	def edit
		set_room
	end

	def create
	end

	def update
		# Do logic
		# params["stay"]["date_start"] Gives start date
		# params["stay"]["date_end"] Gives end date
		start = params["stay"]["date_start"]
		ending = params["stay"]["date_end"]

		if start >= ending
			# Should not work 
		else 
			# Should work
		end


		render 'edit'		
	end

	def destroy
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

end
