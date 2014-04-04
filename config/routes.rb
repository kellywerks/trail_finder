TrailFinder::Application.routes.draw do
  match("trails", {:via => :get, :to => "trails#index"})
  match("trails", {:via => :post, :to => "trails#create"})
  match("trails/:trail_slug", {:via => :get, :to => "trails#show"})
  match("trails/:trail_slug/edit", {:via => :get, :to => "trails#edit"})
  match("trails/:trail_slug", {:via => [:patch, :put], :to => "trails#update"})
  match("trails/:trail_slug", {:via => :delete, :to => "trails#destroy"})
end
