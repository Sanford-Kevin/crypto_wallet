namespace :dev do
  desc "Configurando o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...","Apagado!") do
        %x(rails db:drop)
      end
      
      show_spinner("Criando BD...","Criado!") do
        %x(rails db:create)
      end
      
      show_spinner("Migrando BD...","Migrado!") { %x(rails db:migrate)}
      
      show_spinner("Carregando BD...","Concluído com sucesso!") { %x(rails db:seed)}
    else
      puts "Você não está em ambiente de desenvolvimento"
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
