require('rspec')
require('food')
require('restaurant')
require('pg')

DB = PG.connect({:dbname => 'restaurants_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurants *;")
    DB.exec("DELETE FROM food *;")
  end
end


# testaurant1 = Restaurant.new({:name => "Wongs King", :location => 'Division', :phone => '1231231234', :id => nil})
# testaurant2 = Restaurant.new({:name => "Jakes Famous Crawfish", :location => 'Stark', :phone => '3213214321', :id => nil})
# testaurant3 = Restaurant.new({:name => "LePigeon", :location => 'Burnside', :phone => '4564564567', :id => nil})
#
# test_food1 = Food.new({:type => 'Chinese', :cost => '$', :rating => 3, :id =>  nil})
# test_food2 = Food.new({:type => 'Seafood', :cost => '$$', :rating => 4, :id =>  nil})
# test_food3 = Food.new({:type => 'French', :cost => '$$$', :rating => 5, :id =>  nil})
