bargainburg.backend
===================

Backend services and REST API

##Routes
* /v1/categories/:category\_id/merchants(.:format)
    * GET
* /v1/categories(.:format)
    * GET
    Parameters
        expand_merchants=1
    * POST
* /v1/categories/:id(.:format)
    * GET
    * PUT
* /v1/point\_of\_contacts(.:format)
    * GET
    * POST
* /v1/point\_of\_contacts/:id(.:format)
    * GET
    * PUT
* /v1/merchants/:merchant\_id/coupons(.:format)
    * GET
* /v1/merchants/:merchant\_id/point\_of\_contacts(.:format)
    * GET
* /v1/merchants(.:format)
    * GET
    * POST
* /v1/merchants/:id(.:format)
    * GET
    * PUT
* /v1/coupons(.:format)
    * GET
    * POST
* /v1/coupons/:id(.:format)
    * GET
    * PUT
* /v1/search(.:format)
    * GET
    Parameters
        query=SEARCH_STRING
* /v1/login(.:format)
    * POST
* /v1/logout(.:format)
    * POST




##Installation Specifics
* Ruby version = 1.9.3
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
