# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas", format: :shark)
spinner.auto_spin

coins = [

    {
    description: "Bitcoin", 
    scronym: "BTC",
    url_image: "https://seeklogo.com/images/B/bitcoin-logo-594596D72F-seeklogo.com.png" 
    },

    {
    description: "Ethereum", 
    scronym: "ETH",
    url_image: "https://seeklogo.com/images/E/ethereum-logo-EC6CDBA45B-seeklogo.com.png" 
    },

    {
    description: "Dash", 
    scronym: "DASH",
    url_image: "https://i.pinimg.com/474x/ae/40/95/ae409569f90130d875a7b36f37071440.jpg" 
    },

    {
    description: "Iota", 
    scronym: "IOT",
    url_image: "https://altcoinsbox.com/wp-content/uploads/2023/03/iota-logo-300x300.webp" 
    },

    {
    description: "ZCash", 
    scronym: "ZEC",
    url_image: "https://seeklogo.com/images/Z/zcash-zec-logo-B77DE94668-seeklogo.com.png" 
    }
   ]

coins.each do |coin|
    sleep(1)
    Coin.find_or_create_by!(coin)
end

spinner.success("(Concluido!)")

