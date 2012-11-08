class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :password_salt
      t.string :password_hash
      t.boolean :password_reset
      t.boolean :is_active

      t.timestamps
    end
  end
end
