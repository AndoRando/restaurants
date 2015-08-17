class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @location = attr.fetch(:location)
    @phone = attr.fetch(:phone)
    @id = attr.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM  restaurants;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch("name")
      location = restaurant.fetch("location")
      phone = restaurant.fetch("phone")
      id = restaurant.fetch("id").to_i()
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone, :id => id}))
    end
    restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (name, location, phone) VALUES ('#{@name}', '#{@location}', '#{@phone}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_restaurant|
    self.name().==(another_restaurant.name()).&(self.id().==(another_restaurant.id()))
  end

end
