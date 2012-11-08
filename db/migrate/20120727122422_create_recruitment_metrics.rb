class CreateRecruitmentMetrics < ActiveRecord::Migration
  def change
    create_table :recruitment_metrics do |t|
      t.boolean :placement_success
      t.integer :user_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
