class PagesController < ApplicationController

	def index
		@title = "Welcome"
	end
	
	def filter
		@title = "Filter"


		@hotel_chains = ActiveRecord::Base.connection.execute(
        "
        SELECT * 
        FROM hotel_chains
        ;
        "
      );

	end

end
