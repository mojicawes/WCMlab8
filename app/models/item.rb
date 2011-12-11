class Item < ActiveRecord::Base
  attr_accessible :title, :desc, :done
  
  belongs_to :user
  
  validates :title, :presence => true
  validates :desc, :presence => true
  validates :done, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'items.create_at DESC'
end
