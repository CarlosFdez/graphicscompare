class Configuration < ActiveRecord::Base
  attr_accessible :name, :image, :width, :height

  belongs_to :game

  def as_json(options={})
    super(only: [:name, :image, :width, :height])
  end
end
