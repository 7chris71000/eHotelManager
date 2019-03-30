# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_29_172752) do

  create_table "amenities", id: false, force: :cascade do |t|
    t.integer "RoomID"
    t.string "Amenity", limit: 255
  end

  create_table "archive", primary_key: "ArchiveID", force: :cascade do |t|
    t.integer "RoomID"
    t.integer "CustomerID"
    t.decimal "Price", precision: 6, scale: 2
    t.integer "Capacity"
    t.string "BookedRented", limit: 255
    t.date "ArchiveCheckin"
    t.date "ArchiveCheckout"
  end

  create_table "customer_archives", id: false, force: :cascade do |t|
    t.integer "ArchiveID"
    t.integer "CustomerID"
  end

  create_table "customer_rooms", id: false, force: :cascade do |t|
    t.integer "RoomID"
    t.integer "CustomerID"
    t.date "Checkin"
    t.date "Checkout"
  end

  create_table "customers", primary_key: "CustomerID", force: :cascade do |t|
    t.string "CFirstName", limit: 255
    t.string "CLastName", limit: 255
    t.integer "SSNSIN"
    t.string "CustomerAddress", limit: 255
    t.date "DateOfRegistration"
  end

  create_table "email_addresses", id: false, force: :cascade do |t|
    t.integer "ChainID"
    t.string "EmailAddress", limit: 255
  end

  create_table "employees", primary_key: "EmployeeID", force: :cascade do |t|
    t.string "EFirstName", limit: 255
    t.string "ELastName", limit: 255
    t.string "EmployeeAddress", limit: 255
    t.integer "SSNSIN"
    t.integer "HotelID"
  end

  create_table "hotel_chains", primary_key: "ChainID", force: :cascade do |t|
    t.string "ChainName", limit: 255
    t.string "OfficeAddress", limit: 255
    t.integer "NoOfHotels"
  end

  create_table "hotels", primary_key: "HotelID", force: :cascade do |t|
    t.string "HotelAddress", limit: 255
    t.string "City", limit: 255
    t.string "ContactEmail", limit: 255
    t.integer "NoOfRooms"
    t.integer "Category"
    t.integer "ChainID"
  end

  create_table "phone_numbers", id: false, force: :cascade do |t|
    t.integer "ChainID"
    t.decimal "PhoneNo", precision: 10
  end

  create_table "roles", id: false, force: :cascade do |t|
    t.integer "EmployeeID"
    t.string "Role", limit: 255
  end

  create_table "rooms", primary_key: "RoomID", force: :cascade do |t|
    t.decimal "Price", precision: 6, scale: 2
    t.integer "Capacity"
    t.boolean "Extendable"
    t.string "Status", limit: 255
    t.string "View", limit: 255
    t.integer "HotelID"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
