class HashTag < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :texes
  validates :name, length: {minimum: 1, maximum: 139}

  default_scope order('updated_at DESC')
  paginates_per 15
end
