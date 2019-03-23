class PagesController < ApplicationController

	def index
		@title = "Welcome"
	end
	
	def filter
		@title = "Filter"
	end

end
