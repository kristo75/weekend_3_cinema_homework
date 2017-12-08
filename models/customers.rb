require_relative("../db/sql_runner")

class Customer

def initialize(options)
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
end
