Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "content#home"

  get 'content/generate_name', to: 'content#generate_name'
end
