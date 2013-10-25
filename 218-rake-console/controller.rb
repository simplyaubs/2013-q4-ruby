require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/elements/:id" do
  id = params[:id]
  @element = Element.find(id)
  halt erb(:show_element)
end

get "/create_element" do
	oxygen = 	Element.new
	oxygen.name = "oxygen"
	oxygen.number = 16
	oxygen.symbol = "O"
	oxygen.save!

	halt erb(:index)
end

get "/cities/:id" do
  id = params[:id]
  @city = WorldCity.find(id)
  halt erb(:show_city)
end

get '/population_double' do
  paris = WorldCity.find(2)
  paris.population_in_millions =
    paris.population_in_millions * 2
  paris.save!
  halt erb(:index)
end