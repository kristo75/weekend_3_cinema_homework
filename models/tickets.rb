require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :funds

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @film_id]
    tickets = SqlRunner.run( sql, values ).first
    @id = tickets['id'].to_i
  end

  def self.all()
    sql = SELECT FROM tickets
    tickets = SqlRunner.run(sql, values)
    result = self.map_tickets(tickets)
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM tickets'
    SqlRunner.run(sql)
  end
end
