class HotelChainsController < ApplicationController

	def index

		@title = "Hotel Chains"

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

		get_chain_name

		@title = @chain_name['ChainName']

		@hotels = ActiveRecord::Base.connection.execute(
			"
			SELECT * 
			FROM hotels
			WHERE ChainID = #{params[:id]}
			ORDER BY HotelID
			;
			"
			);

	end

	def edit
		@title = "Update Chain"
		get_chain_name
		@chain_empty = HotelChain.find(params[:id])
	end

	def create
	end

	def update
		ActiveRecord::Base.connection.execute(
			"
			UPDATE hotel_chains
			SET 
			ChainName = '#{params["name"]}'	,
			OfficeAddress = '#{params["address"]}',
			NoOfHotels = '#{params["numhotels"]}'
			WHERE ChainID = #{params[:id]}
			;
			"
			);

		phonesString = params["phones"]

		if(phonesString == "")

		elsif(!phonesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO chain_phone_numbers
					VALUES 
					( '#{params[:id]}', '#{phonesString}');
					"
					);
		else
			phonesArray = phonesString.split(",")
			phonesArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO chain_phone_numbers
					VALUES 
					( '#{params[:id]}', '#{phones}');
					"
					);
			end
		end

		emailsString = params["emails"]

		if(emailsString == "")

		elsif(!emailsString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO email_addresses
					VALUES 
					( '#{params[:id]}', '#{emailsString}');
					"
					);
		else
			emailsArray = emailsString.split(",")
			emailsArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO email_addresses
					VALUES 
					( '#{params[:id]}', '#{emails}');
					"
					);
			end
		end

	end

	def destroy
		ActiveRecord::Base.connection.execute(
			"
			DELETE 
			FROM hotel_chains
			WHERE ChainID = #{params[:id]}
			;
			"
			);
	end

	private

		def get_chain_name
			@chain_name = ActiveRecord::Base.connection.execute(
				"
				SELECT * 
				FROM hotel_chains
				WHERE ChainID = #{params[:id]}
				ORDER BY ChainID
				;
				"
				);
			@chain_name = @chain_name.first
		end

end
