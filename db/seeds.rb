# frozen_string_literal: true

30.times do |index|
  Server.create(ip: "62.1#{index}.213.157:27016", name: "##{index} DM", count_users: 0)
end

Mode.create(
  name: 'DM',
  description: 'Classic shooting practice mode. Instant respawn after deat',
  servers: Server.limit(2)
)
Mode.create(
  name: 'Knife',
  description: 'Thematic maps for training the game with a knife',
  servers: Server.limit(2)
)
Mode.create(
  name:
    'Arena',
  description:
    'Each round you play with a new opponent. This is a classic "ladder" in which you need to get to the first place and defeat your opponents',
  servers: Server.limit(2)
)
