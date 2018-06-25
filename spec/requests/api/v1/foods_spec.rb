require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    customer_list = create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(customer_list.count)
  end
end
