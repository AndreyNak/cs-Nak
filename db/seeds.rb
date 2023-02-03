# frozen_string_literal: true

require_relative 'seeds/data'
require_relative 'seeds/utils'

generate_users
generate_lessons

maps_data.each do |params|
  map = Map.create(params)
  map.main_image.attach(io: File.open("app/assets/images/#{map.name}.jpg"), filename: "#{map.name}.jpg")
end

mode_data.each do |params|
  mode = Mode.create(params)
  (1..3).each do |index|
    Server.create(
      ip: "62.1#{index}.213.157:27016",
      name: "##{index} #{mode.name}",
      count_users: rand(30),
      prime: index.even?,
      mode:,
      map: Map.find(index)
    )
  end
  Server.create(
    ip: '62.15.213.157:27016',
    name: '#5 DM',
    count_users: Server::FULL_COUNT_SERVER,
    prime: rand(2).zero?,
    mode:,
    map: Map.find(Map.pluck(:id).sample)
  )
end
