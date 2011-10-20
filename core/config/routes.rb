ActionController::Routing::Routes.draw do |map|
  map.resources :apps do |app|
    app.resources :features, :only => :index, :member => { :enable => :put, :disable => :put }
  end
  map.resources :features, :only => :show
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
