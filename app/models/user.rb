gem 'bcrypt-ruby'
require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :email, :firstName, :lastName, :password
  
  validates :firstName, presence: true,  length: { maximum: 40 }
  validates :lastName,  length: { maximum: 40 }
  validates :password, length: { minimum: 6, maximum: 40}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
  #has_secure_password    
    
  before_save :prePersist
  
  def prePersist
    self.email = email.downcase
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::DEFAULT_COST
    self.password = BCrypt::Password.create(password, cost: cost)
  end  
    
end
