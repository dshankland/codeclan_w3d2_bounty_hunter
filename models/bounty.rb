require('pg')

class Bounty

  attr_reader :id
  attr_accessor :name, :species, :value, :last_location

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @value = options['value'].to_i
    @last_location = options['last_location']
    @id = options['id'].to_i if options['id']
  end

  # save method to insert data into table
  def save()
    # connect to the database
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write INSERT sql
    sql = "INSERT INTO bounties (name, species, value, last_location) VALUES ($1, $2, $3, $4) RETURNING id "
    # create a values array for exec_prepared statement
    values = [@name, @species, @value, @last_location]
    # prepare the statement
    db.prepare("save", sql)
    # run the prepared statement
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    # close the db
    db.close()
  end

  # TODO: update
  def update()
    # connect to db
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write some UPDATE sql
    sql = "UPDATE bounties SET (name, species, value, last_location) = ($1, $2, $3, $4) WHERE id = $5"
    # create values array for exec_prepared statement
    values = [@name, @species, @value, @last_location, @id]
    # prepare the statement
    db.prepare("update", sql)
    # run the prepared statement
    db.exec_prepared("update", values)
    # close the db
    db.close()
  end

  # TODO: delete_all
  def Bounty.delete_all()
    # connect to db
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write some DELETE SQL
    sql = "DELETE FROM bounties"
    # prepare the statement
    db.prepare("delete_all", sql)
    # run the prepared statement
    db.exec_prepared("delete_all")
    # close the db
    db.close()
  end

  # TODO: delete
  def delete()
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write some DELETE SQL
    sql = "DELETE FROM bounties WHERE id = $1"
    # create values array for exec_prepared statement
    values = [@id]
    # prepare the statement
    db.prepare("delete", sql)
    # run the prepared statement
    db.exec_prepared("delete", values)
    # close the db
    db.close()
  end

  # TODO: find_by_name to return an instance of a class
  def Bounty.find_by_name(name)
    # connect to db
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write some DELETE SQL
    sql = "SELECT * FROM bounties WHERE name = $1"
    # create values array for exec_prepared statement
    values = [name]
    # prepare the statement
    db.prepare("find_by_name", sql)
    # run the prepared statement
    found = db.exec_prepared("find_by_name", values)
    # close the db
    db.close()
    return found[0]
  end

  # TODO: find returns once instance when an id is passed in
  def Bounty.find(id)
    # connect to db
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    # write some DELETE SQL
    sql = "SELECT * FROM bounties WHERE id = $1"
    # create values array for exec_prepared statement
    values = [id]
    # prepare the statement
    db.prepare("find", sql)
    # run the prepared statement
    found = db.exec_prepared("find", values)
    # close the db
    db.close()
    return found[0]
  end

end