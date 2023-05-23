# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

# Homepage
![Homepage gif](/docs/Screen%20Recording%202023-05-23%20at%206.55.13%20PM.gif)

User could browse through the products and select the products on any categories that they wished to do.The product will be added to the cart.

# Cart-details
![Cart](/docs/Cart.png)

The cart will show the total amount to be paid. In cart, you can increment or decrement the products.
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
