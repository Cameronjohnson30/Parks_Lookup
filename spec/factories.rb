FactoryBot.define do
  factory(:park) do
    name {Faker::Name.name}
    managed_by {"State"}
    description {"blah its a park"}
  end
end