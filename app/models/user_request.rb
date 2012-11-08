class UserRequest < ActiveRecord::Base
  attr_accessible :is_approved, :user_id, :subject, :body, :email, :request_for
  belongs_to :user

end
