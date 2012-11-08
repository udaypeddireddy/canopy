class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.integer :user_id
      t.boolean :is_approved
      t.string :subject
      t.string :request_for
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
