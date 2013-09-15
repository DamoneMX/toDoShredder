class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :notes, :status
  
  before_create :prepersist
  
  protected
    def prepersist
      self.status = true
    end
    
  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (:followed_user_ids) OR user_id = :user_id",
          followed_user_ids: followed_user_ids, user_id: user)
  end   
  
  def self.findActiveTasksForUser(user)
    where("status = :status AND user_id = :user_id", status: true ,user_id: user)
  end 
  
end
