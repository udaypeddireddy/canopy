class CreateStatusReports < ActiveRecord::Migration
  def change
    create_table :status_reports do |t|
      t.string :consultant_name
      t.string :client
      t.string :consultant_source
      t.date   :date
      t.string :source_requirement
      t.string :status
      t.string :technology
      t.string :vendor
      t.string :vendor_email
      t.string :vendor_poc
      t.string :vendor_tel
      t.integer :user_id

      t.timestamps
    end
  end
end
