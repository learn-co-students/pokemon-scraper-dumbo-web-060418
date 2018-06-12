require 'pry'

class Pokemon

  attr_accessor :hp
  attr_reader :name, :type, :db, :id

  def initialize(name:, type:, db:, id:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokemon, type)
  end

  def self.find(id, db)
    poke_stats = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(name: poke_stats[1], type: poke_stats[2], db: db, id: poke_stats[0], hp: poke_stats[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, self.id)
    self.hp = new_hp
  end

end
