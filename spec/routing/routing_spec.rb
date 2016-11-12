require 'rails_helper'

Rails.application.routes.draw do
  get "future" => "events#index"
  # ...
end