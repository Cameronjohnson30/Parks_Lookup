FactoryBot.define do
  factory(:quote) do
    name {Faker::Name.name}
    description {Faker::Movie.quote}
  end
end