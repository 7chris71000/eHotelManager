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
		@title = "New Hotel Chain"
		@new_chain = HotelChain.new

	end

	def create
		chainMaxID = ActiveRecord::Base.connection.execute(
      "
      SELECT MAX( ChainID ) FROM hotel_chains;
      "
      );

    if (!chainMaxID[0][0].present?)
      chainMaxID = 0
    end

		ActiveRecord::Base.connection.execute(
			"
			INSERT INTO hotel_chains
			VALUES 
			(
			#{chainMaxID[0][0] + 1}, 
			'#{params["name"]}', 
			'#{params["address"]}', 
			'#{params["NumHotels"]}'
			);
			"
			);


		phonesString = params["phones"]

		if(phonesString == "")

		elsif(!phonesString.include? ",")
			ActiveRecord::Base.connection.execute(
					"
					INSERT INTO chain_phone_numbers
					VALUES 
					( '#{chainMaxID[0][0] + 1}', '#{phonesString}');
					"
					);
		else
			phonesArray = phonesString.split(",")
			phonesArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO chain_phone_numbers
					VALUES 
					( '#{chainMaxID[0][0] + 1}', '#{phones}');
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
					( '#{chainMaxID[0][0] + 1}', '#{emailsString}');
					"
					);
		else
			emailsArray = emailsString.split(",")
			emailsArray.each do |phone|

				ActiveRecord::Base.connection.execute(
					"
					INSERT INTO email_addresses
					VALUES 
					( '#{chainMaxID[0][0] + 1}', '#{emails}');
					"
					);
			end
		end
		render 'success_chain_add'
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

		render 'success_chain'

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
		render 'success_chain_delete'
	end

	def success_chain
		@title = "Successful Update"
	end

	def success_chain_delete
		@title = "Successful Delete"
	end

	def success_chain_add
		@title = "Successful Addition"
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
