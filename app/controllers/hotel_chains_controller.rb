class HotelChainsController < ApplicationController

	def index

		@chains = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotel_chains
				ORDER BY ChainID
				;
				"
				);
	 
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
