class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :alternate_email
      t.string :manager_email
      t.string :manager_name
      t.string :manager_phone
      t.text   :note

      t.timestamps
    end
  end
end
