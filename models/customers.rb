require_relative("../db/sql_runner")

class Customer

  attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options ['id']
  @name = options['name']
  @funds = options['funds'].to_i
end

def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM customers'
    customers = SqlRunner.run(sql, values)
    result = self.map_customers(customers)
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM customers'
    SqlRunner.run(sql)
  end
end
