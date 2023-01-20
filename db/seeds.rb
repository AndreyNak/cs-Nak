# frozen_string_literal: true

mode_data = [
  {
    name: 'DM',
    description: 'Classic shooting practice mode. Instant respawn after deat',
    image: 'DM.jpg'

  },
  {
    name: 'Knife',
    description: 'Thematic maps for training the game with a knife',
    image: 'KNIFE.jpg'
   },
  {
    name: 'Arena',
    description: 'Each round you play with a new opponent. This is a classic "ladder" in which you need to get to the first place and defeat your opponents',
    image: 'ARENA.jpg'
  }
]

map = Map.create(
  name: 'de_dust2',
  image: 'https://cybershoke.net/storage/images/mapsv2/de_dust2.jpg'
)

mode_data.each do |i|
  mode = Mode.create(
    name: i[:name],
    description: i[:description],
    image: i[:image]
  )
  3.times do |index|
    Server.create(
      ip: "62.1#{index}.213.157:27016",
      name: "##{index} DM",
      count_users: 0,
      prime: index.even?,
      mode:,
      map:
    )
  end
end
