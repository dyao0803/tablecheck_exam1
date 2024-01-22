# frozen_string_literal: true

namespace :v1 do
  get "status" => "status#index"
  get "get_weather" => "get_weather#show"
end