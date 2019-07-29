require 'csv'

class Gossip
  attr_reader :author, :content                   #On défini les variables d'instance pour afficher dans le csv le nom de l'auter et son contenu
  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|    # On exporte l'auteur et le contenu dans gossip.csv
    csv << [@author, @content]
    end
  end

  def self.all                                    #Nous permet de créer un array dans lequel tous les gossip seront stocké
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end

  return all_gossips
  end

  def self.find(id)                               #cette méthode permet de trouver l'id qui correspond à tel potin
    return self.all[id.to_i]                      #on convertit en Integer l'id
  end

end
