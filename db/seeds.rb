5.times do
beacon1 = Beacon.create(
	name: Faker::Appliance.equipment,
	major: Faker::Number.between(500, 800),
	minor: Faker::Number.between(100, 400),
	latitude: Faker::Address.latitude,
	longitude: Faker::Address.longitude)

campaign1 = beacon1.campaigns.create(
	name: Faker::Appliance.brand,
	description: Faker::Address.full_address,
	start_time: Faker::Time.between(DateTime.now - 4, DateTime.now),
	end_time: Faker::Time.between(DateTime.now - 1, DateTime.now + 6),
	enabled: Faker::Boolean.boolean)
end