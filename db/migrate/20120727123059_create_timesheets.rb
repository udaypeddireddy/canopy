class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :start_date
      t.date :end_date
      t.string :proof_path
      t.boolean :status
      t.integer :user_id
      t.integer :project_id
      t.text    :comment

      t.timestamps
    end
  end
end
