class CreatePersonalProfiles < ActiveRecord::Migration
  def change
    create_table :personal_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.date   :dob
      t.string :email
      t.date   :expiry_date
      t.string :mobile
      t.string :phone_work
      t.string :state
      t.string :technology
      t.integer :user_id
      t.string :visa_type
      t.string :zip
      t.string :ssn
      t.integer :project_id

      t.timestamps
    end
  end
end
