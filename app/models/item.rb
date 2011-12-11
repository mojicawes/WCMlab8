class Item < ActiveRecord::Base
  attr_accessible :title, :body, :done
  
  belongs_to :user
  
  default_scope :order => 'items.created_at DESC'
end