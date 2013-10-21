require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/elements/:id" do
	id = params[:id]
	@elements = Element.find(id)
	halt erb(:show)
end

