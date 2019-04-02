class EmployeesController < ApplicationController

	def update
		def update
    # super
    get_user_type
    if current_user.user_type == 'customer'
    	ActiveRecord::Base.connection.execute(
    		"
    		UPDATE customers
    		SET 
    		CFirstName = '#{params["fname"]}',
    		CLastName = '#{params["lname"]}',
    		CustomerAddress = '#{params["address"]}',
    		SSNSIN = '#{params["ssnsin"]}'
    		WHERE CustomerID = #{@user_type["CustomerID"]}
    		;
    		"
    		);
    else
    	ActiveRecord::Base.connection.execute(
    		"
    		UPDATE employees
    		SET 
    		EFirstName = '#{params["fname"]}',
    		ELastName = '#{params["lname"]}',
    		EmployeeAddress = '#{params["address"]}',
    		SSNSIN = '#{params["ssnsin"]}'
    		WHERE EmployeeID = #{@user_type["EmployeeID"]}
    		;
    		"
    		);

      # Add to Roles
      rolesString = params["roles"]

      if(rolesString == "")

      elsif(!rolesString.include? ",")
      	ActiveRecord::Base.connection.execute(
      		"
      		INSERT INTO roles
      		VALUES 
      		( '#{@custEmp_empty["EmployeeID"]}', '#{rolesString}');
      		"
      		);
      else
      	rolesArray = rolesString.split(",")
      	rolesArray.each do |role|

      		ActiveRecord::Base.connection.execute(
      			"
      			INSERT INTO roles
      			VALUES 
      			( '#{@custEmp_empty["EmployeeID"]}', '#{role}');
      			"
      			);
      	end
      end
    end

  end
end

  private 
	  def get_user_type

	  	if current_user.user_type == 'customer'
	  		custEmp = 'customers'
	  	else
	  		custEmp = 'employees'
	  	end

	  	@user_type = ActiveRecord::Base.connection.execute(
	  		"
	  		SELECT *
	  		FROM #{custEmp}
	  		WHERE UserID = #{current_user.id}
	  		;
	  		"
	  		);
	  	@user_type = @user_type.first

	  end



end