class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectname
      t.string :description
      t.date   :start_date
      t.date   :end_date
      t.string :project_location
      t.string :rate
      t.text   :note
      t.integer :client_id
      t.timestamps
    end
  end
end
