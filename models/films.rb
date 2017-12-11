require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def customer()
      sql =   "SELECT  customer.*
      FROM customer
      INNER JOIN tickets
      ON tickets.customer_id = customer_id
      WHERE  = $1"
      values =[@id]

      return result
    end


  def save()
      sql = "INSERT INTO films
      (title, price)
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@title, @price]
      film = SqlRunner.run( sql, values ).first
      @id = film['id'].to_i
    end

    def self.all()
      sql = 'SELECT * FROM films'
      films = SqlRunner.run(sql)
      result = films.map {|film| Film.new(film)}
      return result
    end


    def self.delete_all()
      sql = 'DELETE FROM films'
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE films
      SET(title, price)
      =($1, $2)
      WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

    def film_count()
      sql = 'SELECT * FROM films'
      films = SqlRunner.run(sql)
      result = films.count {|film| Film.new(film)}
      return result

      def customers()
        sql = "SELECT customers.*  FROM customers
        INNER JOIN tickets ON tickets.customer_id
        = customers.id WHERE film_id = $1,;"
        values = [@id]
        customers = SqlRunner.run(sql, values)
        result = customers.map {|customer| Customer.new(customer)}
        return result
      end

    end

end
