class CreateSelfServices < ActiveRecord::Migration
  def change
    create_table :self_services do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
