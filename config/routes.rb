Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, constraints: { format: :json } do
    draw(:v1)
  end
end
