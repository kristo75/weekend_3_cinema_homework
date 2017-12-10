require_relative("../db/sql_runner")
require( 'pry-byebug' )
class Customer

  attr_reader :id
  attr_accessor :funds, :name

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM customers'
    customers_hashes = SqlRunner.run(sql)
    result = customers_hashes.map {|customers_hash|
      Customer.new(customers_hash)}
    return result
  end


  def self.delete_all()
    sql = 'DELETE FROM customers'
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers
    SET(name, funds) =($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*  From films
    INNER JOIN tickets ON films.id = tickets.film_id
    Where tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map {|film| Film.new(film)}
    return result
  end



end
