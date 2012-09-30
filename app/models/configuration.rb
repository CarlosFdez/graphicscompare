class Configuration < ActiveRecord::Base
  attr_accessible :name, :image

  belongs_to :game
end
