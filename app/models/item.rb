class Item < ActiveRecord::Base
  attr_accessible :title, :body, :done
  
  belongs_to :user
  
  validates :title, :presence => true
  validates :body, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'items.created_at DESC'
end