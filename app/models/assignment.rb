class Assignment < ActiveRecord::Base
  attr_accessible :is_active, :project_id, :user_id
  belongs_to :user
  belongs_to :project
  before_create :activate_assignment

  private
    def activate_assignment
      self.class.where("user_id = ?", self.user_id).update_all(:is_active => false)
      self.is_active = true
    end
end
