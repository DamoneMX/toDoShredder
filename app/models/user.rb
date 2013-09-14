gem 'bcrypt-ruby'
require 'bcrypt'
class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  attr_accessible :email, :firstName, :lastName, :password, :loginTime
  
  validates :firstName, presence: true,  length: { maximum: 40 }
  validates :lastName,  length: { maximum: 40 }
  validates :password, length: { minimum: 6, maximum: 40}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
  #has_secure_password    
    
  before_save :prePersist
  
  def prePersist
    self.email = email.downcase
  end  
    
end
