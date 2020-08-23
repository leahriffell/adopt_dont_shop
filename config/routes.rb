Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/pets', to: 'pets#index'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to:'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets', to:'shelter_pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to:'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to:'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  patch '/pets/:id/adoptable', to: 'pets#change_adoption_status'
  patch '/pets/:id/pending', to: 'pets#change_adoption_status'
end
