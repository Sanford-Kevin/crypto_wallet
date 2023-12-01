namespace :dev do
  desc "Configurando o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...","Apagado!") { %x(rails db:drop) }
      show_spinner("Criando BD...","Criado!") { %x(rails db:create) }
      show_spinner("Migrando BD...","Migrado!") { %x(rails db:migrate)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas...") do

    coins = [

            {
              description: "Bitcoin", 
              acronym: "BTC",
              url_image: "https://seeklogo.com/images/B/bitcoin-logo-594596D72F-seeklogo.com.png" 
            },
          
            {
              description: "Ethereum", 
              acronym: "ETH",
              url_image: "https://seeklogo.com/images/E/ethereum-logo-EC6CDBA45B-seeklogo.com.png" 
            },
          
            {
              description: "Dash", 
              acronym: "DASH",
              url_image: "https://i.pinimg.com/474x/ae/40/95/ae409569f90130d875a7b36f37071440.jpg" 
            },
          
            {
              description: "Iota", 
              acronym: "IOT",
              url_image: "https://altcoinsbox.com/wp-content/uploads/2023/03/iota-logo-300x300.webp" 
            },
          
            {
              description: "ZCash", 
              acronym: "ZEC",
              url_image: "https://seeklogo.com/images/Z/zcash-zec-logo-B77DE94668-seeklogo.com.png" 
            }
     ]
         
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos Mineração...") do  
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :shark)
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

end
