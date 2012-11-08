class CreateOrganizationProfiles < ActiveRecord::Migration
  def change
    create_table :organization_profiles do |t|
      t.string :billing_type
      t.boolean :is_admin
      t.string :role
      t.string :user_type
      t.integer :user_id

      t.timestamps
    end
  end
end
