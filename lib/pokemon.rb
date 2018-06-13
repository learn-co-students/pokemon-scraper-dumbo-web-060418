require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id_num, db)
    pokemon_row = db.execute(
      "SELECT * FROM pokemon
      WHERE pokemon.id = #{id_num};")

      pika = Pokemon.new(id: pokemon_row[0][0], name: pokemon_row[0][1], type: pokemon_row[0][2], db: db)
  end
end
