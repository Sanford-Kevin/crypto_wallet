# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cadastrando as moedas..."

Coin.create!(
    description: "Bitcoin", 
    scronym: "BTC",
    url_image: "https://seeklogo.com/images/B/bitcoin-logo-594596D72F-seeklogo.com.png" 
)

Coin.create!(
    description: "Ethereum", 
    scronym: "ETH",
    url_image: "https://seeklogo.com/images/E/ethereum-logo-EC6CDBA45B-seeklogo.com.png" 
)

Coin.create!(
    description: "Dash", 
    scronym: "DASH",
    url_image: "https://i.pinimg.com/474x/ae/40/95/ae409569f90130d875a7b36f37071440.jpg" 
)

puts "Moedas cadastradas com sucesso"