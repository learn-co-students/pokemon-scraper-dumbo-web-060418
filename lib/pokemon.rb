require 'pry'
class Pokemon

  @@all = []

attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(name: new_pokemon[0][1], type: new_pokemon[0][2], db: db, id: new_pokemon[0][0])
    # binding.pry
  end





end
