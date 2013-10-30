require './davinci-sinatra.rb'

get "/" do
  @customer = Customer.find(1)

  halt erb(:intro)
end

get "/sign_up" do
  @customer = Customer.find(1)

  halt erb(:sign_up)
end

post "/sign_up" do
  @customer = Customer.find(1)

  if params["commit"] == "Go back"
    redirect "/"
  elsif params["commit"] == "Continue"
    @customer.first_name = params["first_name"]
    @customer.last_name  = params["last_name"]
    if @customer.save
      redirect  "/shipping"
    else
      halt erb(:sign_up)
    end
  end
end

get "/shipping" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all

  halt erb(:shipping)
end

post "/shipping" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all

  if params["commit"] == "Go back"
    redirect "/sign_up"
  elsif params["commit"] == "Continue"
    @customer.ship_speed = params["ship_speed"]
    @customer.ship_address1  = params["ship_address1"]
    @customer.ship_city      = params["ship_city"]
    @customer.ship_state     = params["ship_state"]
    @customer.ship_zip_code  = params["ship_zip_code"]
    if @customer.save
      redirect "/billing"
    else
      halt erb(:shipping)
    end
  end
end

get "/billing" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all

  halt erb(:billing)
end

post "/billing" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all

  if params["commit"] == "Go back"
    redirect "/shipping"
  elsif params["commit"] == "Continue"
    @customer.bill_address_same_as_ship = params["bill_address_same_as_ship"]
    @customer.bill_address1             = params["bill_address1"]
    @customer.bill_city                 = params["bill_city"]
    @customer.bill_state                = params["bill_state"]
    @customer.bill_zip_code             = params["bill_zip_code"]
    if @customer.save
      redirect "/review"
    else
      halt erb(:billing)
    end
  end
end

get "/review" do
  @customer = Customer.find(1)

  halt erb(:review)
end

post "/review" do
  @customer = Customer.find(1)

  if params["commit"] == "Go back"
    redirect "/billing"
  elsif params["commit"] == "Place order"
    redirect "/thank_you"
  end
end

get "/thank_you" do
  halt erb(:thank_you)
end
