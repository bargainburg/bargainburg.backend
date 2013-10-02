namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Category, Merchant, Coupon, PointOfContact].each(&:delete_all)
    
    Category.populate 4 do |category|
      category.name = Populator.words(1..3).titleize
		Merchant.populate 1..10 do |merchant|
		  merchant.category_id = category.id
		  merchant.name = Populator.words(1..5).titleize
		  merchant.email = Faker::Internet.email
		  merchant.description = Populator.sentences(2..10)
		  merchant.price_range = [1,2,3,4,5]
		  merchant.created_at = 2.years.ago..Time.now
		  merchant.approved = [true, false]
		  merchant.phone   = Faker::PhoneNumber.phone_number
		  merchant.hours = "M-F 9-5"
		  merchant.link = "www.web.com"

			Coupon.populate 5 do |coupon|
			  coupon.name    = Faker::Name.name
			  coupon.begin_date = 2.month.ago..1.month.ago
			  coupon.end_date = 1.month.ago..Time.now
			  coupon.created_date = Time.now
			  coupon.description = Populator.sentences(2..10)
			  coupon.image = "Path/To/File/image.png"
			  coupon.hidden = [true,false]
			  coupon.category_id = category.id
			  coupon.merchant_id = merchant.id
			end

			PointOfContact.populate 2 do |poc|
			  poc.name	= Faker::Name.name
			  poc.phone	= Faker::PhoneNumber.phone_number
			  poc.email	= Faker::Internet.email
			  poc.merchant_id = merchant.id
			end
		end
    end

    
  end
end
