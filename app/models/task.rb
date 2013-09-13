class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :notes, :status
  
  before_create :prepersist
  
  protected
    def prepersist
      self.status = true
    end
    
  
end
