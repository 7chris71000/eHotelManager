class RoomsController < ApplicationController

	def index
		
	end

	def new
	end

	def show
		set_room
	end

	def edit
		@title = "Book Room"
		set_room
	end

	def create
	end

	def update
		# Do logic
		# params["stay"]["date_start"] Gives start date
		# params["stay"]["date_end"] Gives end date
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

		isCustomer = (current_user.user_type == 'customer')
		if isCustomer
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

		print("\n\n\nTEST\n\n\n")

		render 'success'		
	end

	def destroy

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

end
