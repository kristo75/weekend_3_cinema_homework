require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()


customer1 = Customer.new({'name' => 'Kris', 'funds' => 20})
customer2 = Customer.new({'name' => 'Simon', 'funds' => 40})

customer1.save()
customer2.save()

customer1.name = "Alex"


customer1.funds = "17"

customer1.update

film1 = Film.new({'title' => 'Attack of the killer tomatoes',  'price' => 7})
film2 = Film.new({'title' => 'Open Water', 'price' => 14})

film1.title = "Bang"
film1.price = "3"
film1.update


film1.save()
film2.save()

ticket1 = Ticket.new({'film_id' => film1.id, "customer_id" => customer1.id})
ticket2 = Ticket.new({'film_id' => film2.id, "customer_id" => customer2.id})

ticket1.save()
ticket2.save()

ticket1.film_id = film2.id
ticket1.update

# customer = customer1.films()
films = customer1.films()
binding.pry
nil
