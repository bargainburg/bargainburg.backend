bargainburg.backend
===================

Backend services and REST API

##Routes
* /v1/categories/:category\_id/merchants(.:format)
    * GET - return all of the merchants within the given category
* /v1/categories(.:format)(?expand\_merchants=1)
    * GET - return all of the categories. If expand\_merchants is set then a set of the merchant ids and names will be nested inside each category
    * POST - create a category
* /v1/categories/:id(.:format)
    * GET - return a single category
    * PUT - update a single category
* /v1/point\_of\_contacts(.:format)
    * GET - return all of the points of contact
    * POST - create a point of contact
* /v1/point\_of\_contacts/:id(.:format)
    * GET - return an individual point of contact
    * PUT - update an individual point of contact
* /v1/merchants/:merchant\_id/coupons(.:format)
    * GET - returns all of the coupons for a merchant
* /v1/merchants/:merchant\_id/point\_of\_contacts(.:format)
    * GET - return all of the points of contact for a merchant
* /v1/merchants(.:format)(?expand\_coupons=1)
    * GET - return all fo the merchants, if expand\_coupons is set then an array of the coupon ids and names will be returned within reach merchant
    * POST - create a merchant
* /v1/merchants/:id(.:format)(?(only\_names=1|category\_id=cat\_id))
    * GET - return a single merchant. If only\_names is set then only the
      name and id of each merchant is returned. If category_id is set, then
      the results will be restricted to those belonging to that category.
    * PUT - update a merchant's fields
* /v1/coupons(.:format)
    * GET - return all of the coupons
    * POST - create a coupon
* /v1/coupons/:id(.:format)
    * GET - return a single coupon
    * PUT - update a coupon's fields
* /v1/users
    * POST - create a user
* /v1/search(.:format)?query=StringToSearchFor
    * GET - return results of search in query parameter
* /v1/login(.:format)
    * POST - login as given user 
* /v1/logout(.:format)
    * POST - logout as current user

##Tips and tricks
* When images are uploaded with a coupon they are reachable at "URL/coupons/ID/FILENAME". Notice that there is no /v1/
* When POSTing or PUTing data to the API make sure to wrap the fields in the correct type. Ex. {"coupon":{"merchant\_id":5, "another\_field":"value"}}
* All fields can be found in the file db/schema.rb
* Validations for those fields are in app/models/OBJECT


##Testing

Run test suite:

    bundle exec rspec --color --format Fuubar

Run test suite whenever a file changes:

  1. `cp Guardfile.example Guardfile`
  2. `bundle exec guard --force-polling`

A test coverage report will be generated with each test run under
`coverage/`. Open `coverage/index.html` to see the test coverage.


If you want some pretty notification stuff for the tests, [look at adding
notifiers to your Guardfile](https://github.com/guard/guard).

I'm using the `gntp` (with [Growl](http://growl.info/)) and `tmux` notifiers.

    notification :tmux
    notification :gntp

The GNTP one looks like this:

![GNTP Notifier](http://i.imgur.com/PHrEtwv.png)


##Installation Specifics
* Ruby version = 1.9.3
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
