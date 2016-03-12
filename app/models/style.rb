class Style < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 25}	
  has_many :recipes_style
  has_many :recipes, throught: :recipes_style
end
