require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )


customer1 = Customer.new({'name' => 'Kris', 'funds' => 20})
customer2 = Customer.new({'name' => 'Simon', 'funds' => 40})

customer1.save()
customer2.save()

film1 = Film.new({'title' => 'Attack of the killer tomatoes',  'price' => 7})
film2 = Film.new({'title' => 'Open Water', 'price' => 14})

film1.save()
film2.save()

ticket1 = Ticket.new({'film_id' => film1.id, "customer_id" => customer1.id})
ticket2 = Ticket.new({'film_id' => film2.id, "customer_id" => customer2.id})

ticket1.save()
ticket2.save()
