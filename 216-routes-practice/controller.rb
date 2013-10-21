require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/contact_form" do
	halt erb(:contact_form)
end

get "/form_in_table" do
	halt erb(:form_in_table)
end

get "/headers" do
	halt erb(:headers)
end

get "/inline" do
	halt erb(:inline)
end

get "/nested_lists" do
	halt erb(:nested_lists)
end



