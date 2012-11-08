class CreateVendorContacts < ActiveRecord::Migration
  def change
    create_table :vendor_contacts do |t|
      t.string :poc_name
      t.string :poc_email
      t.string :poc_alternate_email
      t.string :sub_sign_authority
      t.string :sub_sign_authority_title
      t.integer :vendor_id
      t.string :phone
      t.string :fax
      t.string :phone_extension

      t.timestamps
    end
  end
end
