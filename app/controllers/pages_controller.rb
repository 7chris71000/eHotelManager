class PagesController < ApplicationController

	def index
		@title = "Welcome"
	end
	
	def filter
		@title = "Filter"


		get_all_chains
		get_all_hotels

		# @hotelAddresses = []

		# @hotels.each do |hotel|
		# 	@hotelAddresses << hotel["hotelAddresses"]
		# end

		# @hotelsUnique = @hotelAddresses.uniq

	end

	def settings
		@title = "User Settings"
	end

	private

		def get_all_chains
			@hotel_chains = ActiveRecord::Base.connection.execute(
				"
				SELECT DISTINCT ChainName 
				FROM hotel_chains
				;
				"
				);
		end

		def get_all_hotels
			@hotels = ActiveRecord::Base.connection.execute(
				"
				SELECT DISTINCT HotelAddress 
				FROM hotels
				;
				"
				);
		end

end
