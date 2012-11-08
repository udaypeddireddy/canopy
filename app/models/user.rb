class User < ActiveRecord::Base
  attr_accessible :accesslevel_id, :email,:firstname,:lastname, :password, :password_confirmation, :is_active
  
attr_accessor :password
before_save :encrypt_password
  
before_create :setdefault_pwd
has_many :timesheets
has_many :projects , :through => :assignments, :uniq => true
has_many :user_requests
has_one :organization_profile
has_one :personal_profile
has_many :timesheets
has_many :assignments
has_many :status_reports

validates :firstname,:lastname, :length => {:minimum => 2, :maximum => 254}, :on=>:create
validates_confirmation_of :password, :on=>:changepwd
validates_presence_of :email, :firstname, :lastname, :on=>:create
validates :email,:format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
validates_uniqueness_of :email

  
  def setdefault_pwd
    self.password = SecureRandom.hex(3)
    
 self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)


  end
  
  def active_assignment
    self.projects.where("assignments.is_active = ?", true).first
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  
  
end
