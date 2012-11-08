class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :parent_id
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :federal_id
      

      t.timestamps
    end
  end
end
