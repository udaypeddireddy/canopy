class CreatePlacementFulfilments < ActiveRecord::Migration
  def change
    create_table :placement_fulfilments do |t|
      t.integer :vendor_id
      t.integer :client_id
      t.integer :subvendor_id
      t.integer :consultant_id
      t.integer :salesperson_id
      t.integer :recruiter_id
      t.boolean :user_acceptance
      t.datetime :user_acceptance_timestamp
      t.string   :rate_code
      t.string   :consultant_type
      t.text   :note

      t.timestamps
    end
  end
end
