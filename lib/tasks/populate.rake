namespace :populate do
  desc 'Populate Games'
  task games: :environment do
    20.times do
      game = Game.create(name: Faker::Games::SuperSmashBros.stage, description: Faker::Games::Pokemon.location)
      5.times { Character.create(name: Faker::Games::Pokemon.name, power: Faker::Games::Pokemon.move, game_id: game.id) }
    end
  end

end
