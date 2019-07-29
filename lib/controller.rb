require 'gossip'
require 'bundler'
Bundler.require


class ApplicationController < Sinatra::Base

    #On créé un chemein vers la page index.erb
    get '/' do
      erb :index, locals: {gossips: Gossip.all} # "locals:" permet d'envoyer à notre fichier ERB des variables que l'on utilisera
    end
    #on créé le chemin vers la page new (new_gossip.erb), qui nous permet d'envoyer nos potains via un formulaire
    get '/gossips/new/' do
      erb :new_gossip
    end

    post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save       #Nous permet de sauvegarder dans notre dossier csv
      redirect '/'                                                             #Permet de rediriger l'utilisateur vers une autre page - dans ce cas là l'utilisateur sera redirigé vers le menu principal
      puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
    end

    get '/gossips/:id' do                                                          #la valeur de :id est accessible dans le hash sous params['id']. On peut ensuite le mettre en entrée de la méthode find du gossip pour trouver le gossip de cette id.
        erb :show, locals: {id: params['id'], gossip: Gossip.new(params['id'])}   #nous permet d'avoir des URLs dynamiques
    end

end
