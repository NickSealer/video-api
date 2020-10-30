def video_seed
  puts "==============================================="
  puts "Video seeding starts."
  Video.create(name: "TESV Skyrim", description: "The Elder Scrolls V: Skyrim", url: "https://youtu.be/JSRtYpNRoN0")
  Video.create(name: "TESV Dawnguard", description: "The Elder Scrolls V: Dawnguard", url: "https://youtu.be/oZqXKZOS2jQ")
  Video.create(name: "TESV Hearthfire", description: "The Elder Scrolls V: Hearthfire", url: "https://youtu.be/TvhQZoyZn1g")
  Video.create(name: "TESV Dragonborn", description: "The Elder Scrolls V: Dragonborn", url: "https://youtu.be/OsROQUWaHnQ")
  Video.create(name: "DS3", description: "Dark Souls 3", url: "https://youtu.be/oX0cvtjKt9E")
  Video.create(name: "DS3 Ashes of Ariandel", description: "Dark Souls 3: Ashes of Ariandel", url: "https://youtu.be/iu1NCPMC7D0")
  Video.create(name: "DS3 The Ringed City", description: "Dark Souls 3: The Ringed City", url: "https://youtu.be/4hYKbLZ3BlE")
  puts "Video seeding finished."
  puts "==============================================="
end

video_seed()
