class CreateTimesheetDays < ActiveRecord::Migration
  def change
    create_table :timesheet_days do |t|
      t.integer  :timesheet_id
      t.date     :date
      t.float  :regular_time
      t.float  :over_time

      t.timestamps
    end
  end
end
