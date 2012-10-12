class Game < ActiveRecord::Base
  attr_accessible :name
  attr_protected :id  # we need id to be modifiable in seeds.rb

  has_many :configurations
end
