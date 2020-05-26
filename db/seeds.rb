# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserGames.delete_all
User.delete_all
Tile.delete_all
Game.delete_all

avatar = "https://upload.wikimedia.org/wikipedia/commons/4/49/Syvia_of_Sylvia%27s_reaturant_N.Y.C_%28cropped%29.jpg"

userA = User.create(username: 'alpha', password_digest: User.digest('foobar'), country: 'usa', avatar: avatar )
userB = User.create(username: 'beta', password_digest: User.digest('foobar'), country: 'italy', avatar: avatar )
userC = User.create(username: 'gamma', password_digest: User.digest('foobar'), country: 'russia', avatar: avatar )
userD = User.create(username: 'epsilon', password_digest: User.digest('foobar'), country: 'canada', avatar: avatar )

game1 = Game.create(difficulty: "Easy")
game2 = Game.create(difficulty: "Medium")
game3 = Game.create(difficulty: "Hard")

tile1_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/php-logo_1.png"
tile2_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/css3-logo.png"
tile3_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/html5-logo.png"
tile4_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/jquery-logo.png"
tile5_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/js-logo.png"
tile6_img = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/74196/photoshop-logo.png"

tile1 = Tile.create(game_id: game1.id, url: tile1_img)
tile2 = Tile.create(game_id: game1.id, url: tile2_img)
tile3 = Tile.create(game_id: game1.id, url: tile3_img)

tile4 = Tile.create(game_id: game2.id, url: tile1_img)
tile5 = Tile.create(game_id: game2.id, url: tile2_img)
tile6 = Tile.create(game_id: game2.id, url: tile3_img)
tile7 = Tile.create(game_id: game2.id, url: tile4_img)

tile8 = Tile.create(game_id: game3.id, url: tile1_img)
tile9 = Tile.create(game_id: game3.id, url: tile2_img)
tile10 = Tile.create(game_id: game3.id, url: tile3_img)
tile11 = Tile.create(game_id: game3.id, url: tile4_img)
tile12 = Tile.create(game_id: game3.id, url: tile5_img)
tile13 = Tile.create(game_id: game3.id, url: tile6_img)

UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))

UserGames.create(user_id: userC.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userC.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userC.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userC.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userC.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))

UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))

UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))

UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userD.authenticate('foobar').id, game_id: game2.id, score: rand(1..45))
UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game1.id, score: rand(1..60))
UserGames.create(user_id: userB.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))
UserGames.create(user_id: userA.authenticate('foobar').id, game_id: game3.id, score: rand(1..30))

puts "Seed Complete!"
