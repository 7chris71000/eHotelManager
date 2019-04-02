# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new

    @hotels = ActiveRecord::Base.connection.execute(
      "
      SELECT * 
      FROM hotels
      ;
      "
      );

    super
  end

  # POST /resource
  def create

    firstName = params["fname"]
    lastName = params["lname"]
    address = params["address"]
    ssn = params["ssn"]
    date = Time.now.strftime("%Y-%m-%d")
    hotelID = params["selHotelID"]
    type = params["user"]["user_type"]

    userMaxID = ActiveRecord::Base.connection.execute(
      "
      SELECT MAX( id ) FROM users;
      "
      );

    if (!userMaxID[0][0].present?)
      userMaxID = 0
    end

    print("\n\n\n
      \n#{userMaxID}
      \n\n\n\n")

    # get ID to put into customers or employees
    # use SQL to update DB
    if( type == "customer" )

      maxId = ActiveRecord::Base.connection.execute(
        "
        SELECT MAX( CustomerID ) FROM customers;
        "
        );

      if (!maxId[0][0].present?)
        maxId = 0
      end

      ActiveRecord::Base.connection.execute(
        "
        INSERT INTO customers
        VALUES 
        ( #{maxId[0][0] + 1} , '#{firstName}', '#{lastName}', '#{address}', #{ssn}, #{date}, #{userMaxID[0][0] + 1})
        ;
        "
        );
    else 

      maxId = ActiveRecord::Base.connection.execute(
        "
        SELECT MAX( EmployeeID ) FROM employees;
        "
        );

      # maxIdRoom = ActiveRecord::Base.connection.execute(
      #   "
      #   SELECT MAX( RoomID ) FROM rooms;
      #   "
      # );

      # print("\n\n\n\n\n\n\n\n\nMax room id #{maxIdRoom}\n\n\n\n\n\n")

      if (!maxId[0][0].present?)
        maxId = 0
      end

      ActiveRecord::Base.connection.execute(
        "
        INSERT INTO employees
        VALUES 
        ( #{maxId[0][0] + 1}, '#{firstName}', '#{lastName}', '#{address}', #{ssn}, #{hotelID}, #{userMaxID[0][0] + 1})
        ;
        "
        );
    end



    super
  end

  # GET /resource/edit
  def edit

    get_user_type

    if current_user.user_type == 'customer'
      @custEmp_empty = Customer.find(@user_type["CustomerID"])
    else
      @custEmp_empty = Employee.find(@user_type["EmployeeID"])
    end   
    
    # super
  end

  # PUT /resource
  def update
    # super
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
    super

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :password, :password_confirmation, :user_type) }
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

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

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
