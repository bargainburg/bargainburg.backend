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
* /v1/merchants(.:format)(?expand_coupons=1)
    * GET - return all fo the merchants, if expand_coupons is set then an array of the coupon ids and names will be returned within reach merchant
    * POST - create a merchant
* /v1/merchants/:id(.:format)
    * GET - return a single merchant
    * PUT - update a merchant's fields
* /v1/coupons(.:format)
    * GET - return all of the coupons
    * POST - create a coupon
* /v1/coupons/:id(.:format)
    * GET - return a single coupon
    * PUT - update a coupon's fields
* /v1/search(.:format)?query=StringToSearchFor
    * GET - return results of search in query parameter
* /v1/login(.:format)
    * POST - login as given user 
* /v1/logout(.:format)
    * POST - logout as current user




##Installation Specifics
* Ruby version = 1.9.3
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
