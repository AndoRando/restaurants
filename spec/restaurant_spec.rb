require('spec_helper')

describe(Restaurant) do
  describe('#save, .all') do
    it('saves restaurants to an array, and returns the array containing them after') do
      testaurant1 = Restaurant.new({:name => "Wongs King", :location => 'Division', :phone => '1231231234', :id => nil})
      testaurant1.save()
      testaurant2 = Restaurant.new({:name => "Jakes Famous Crawfish", :location => 'Stark', :phone => '3213214321', :id => nil})
      testaurant2.save()
      expect(Restaurant.all()).to(eq([testaurant1, testaurant2]))
    end
  end

  describe('#name') do
    it('returns the name of the restaurant') do
      testaurant1 = Restaurant.new({:name => "Wongs King", :location => 'Division', :phone => '1231231234', :id => nil})
      testaurant1.save()
      expect(testaurant1.name()).to(eq("Wongs King"))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      testaurant1 = Restaurant.new({:name => "Wongs King", :location => 'Division', :phone => '1231231234', :id => nil})
      testaurant2 = Restaurant.new({:name => "Wongs King", :location => 'Division', :phone => '1231231234', :id => nil})
      expect(testaurant1).to(eq(testaurant2))
    end
  end
end
