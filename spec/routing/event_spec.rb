require 'rails_helper'

RSpec.describe "events", type: :routing do
  it "routes /future to events#index" do
    expect(get: "/future").to route_to(controller: "events", action: "index")
  end
end