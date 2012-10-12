class AddDimensionsToConfigurations < ActiveRecord::Migration
  def up
    add_column :configurations, :width, :integer
    add_column :configurations, :height, :integer
  end

  def down
    remove_column :configurations, :width
    remove_column :configurations, :height
  end
end
