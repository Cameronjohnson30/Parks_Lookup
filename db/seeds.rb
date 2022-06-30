class Seed 
  
  def self.begin 
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    20.times do |i|
      @manager = ['State', 'National Park']
      @random = @manager.sample
      park = Park.create!(
        name: Faker::Games::Zelda.character,
        managed_by: @random,
        description: Faker::Lorem.sentences(number: 1)
      )
      puts "Park #{i}: Name is #{park.name} managed by #{park.managed_by} and description is '#{park.description}'."
    end
  end
end
Seed.begin