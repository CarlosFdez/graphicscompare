# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Used for creating ids
games_order = [
  'Ys Oath in Felghana'
]

yaml = YAML.load_file('data/games.yml')
Game.delete_all
Configuration.delete_all

games_order.each_with_index do |item, i|
  game = Game.new(name: item)
  game.update_attribute('id', i + 1)
  game.save
  
  puts "Added game #{item}"

  yaml[item].each_pair do |name, settings|
    config = Configuration.new(
      name: name,
      image: settings['image'],
      width: settings['width'],
      height: settings['height'])
    config.game = game
    config.save
    puts "    Added configuration #{name}"
  end
end

puts "Finished adding games and configurations"