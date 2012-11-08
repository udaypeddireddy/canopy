# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120829091402) do

  create_table "assignments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "alternate_email"
    t.string   "manager_email"
    t.string   "manager_name"
    t.string   "manager_phone"
    t.text     "note"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "clients_vendors", :id => false, :force => true do |t|
    t.integer "client_id"
    t.integer "vendor_id"
  end

  create_table "organization_profiles", :force => true do |t|
    t.string   "billing_type"
    t.boolean  "is_admin"
    t.string   "role"
    t.string   "user_type"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "personal_profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.date     "dob"
    t.string   "email"
    t.date     "expiry_date"
    t.string   "mobile"
    t.string   "phone_work"
    t.string   "state"
    t.string   "technology"
    t.integer  "user_id"
    t.string   "visa_type"
    t.string   "zip"
    t.string   "ssn"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "placement_fulfilments", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "client_id"
    t.integer  "subvendor_id"
    t.integer  "consultant_id"
    t.integer  "salesperson_id"
    t.integer  "recruiter_id"
    t.boolean  "user_acceptance"
    t.datetime "user_acceptance_timestamp"
    t.string   "rate_code"
    t.string   "consultant_type"
    t.text     "note"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "projectname"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "project_location"
    t.string   "rate"
    t.text     "note"
    t.integer  "client_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "recruitment_metrics", :force => true do |t|
    t.boolean  "placement_success"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "self_services", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "status_reports", :force => true do |t|
    t.string   "consultant_name"
    t.string   "client"
    t.string   "consultant_source"
    t.date     "date"
    t.string   "source_requirement"
    t.string   "status"
    t.string   "technology"
    t.string   "vendor"
    t.string   "vendor_email"
    t.string   "vendor_poc"
    t.string   "vendor_tel"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "timesheet_days", :force => true do |t|
    t.integer  "timesheet_id"
    t.date     "date"
    t.float    "regular_time"
    t.float    "over_time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "timesheets", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "proof_path"
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_requests", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "is_approved"
    t.string   "subject"
    t.string   "request_for"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password_salt"
    t.string   "password_hash"
    t.boolean  "password_reset"
    t.boolean  "is_active"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "vendor_contacts", :force => true do |t|
    t.string   "poc_name"
    t.string   "poc_email"
    t.string   "poc_alternate_email"
    t.string   "sub_sign_authority"
    t.string   "sub_sign_authority_title"
    t.integer  "vendor_id"
    t.string   "phone"
    t.string   "fax"
    t.string   "phone_extension"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "federal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
