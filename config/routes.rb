TrailFinder::Application.routes.draw do
  match("/", {:via => :get, :to => "trails#index"})

  match("trails", {:via => :get, :to => "trails#index"})
  match("trails", {:via => :post, :to => "trails#create"})
  match("trails/:trail_slug", {:via => :get, :to => "trails#show"})
  match("trails/:trail_slug/edit", {:via => :get, :to => "trails#edit"})
  match("trails/:trail_slug", {:via => [:patch, :put], :to => "trails#update"})
  match("trails/:trail_slug", {:via => :delete, :to => "trails#destroy"})

  match("locations", {:via => :get, :to => "locations#index"})
  match("locations", {:via => :post, :to => "locations#create"})
  match("locations/:location_slug", {:via => :get, :to => "locations#show"})
  match("locations/:location_slug/edit", {:via => :get, :to => "locations#edit"})
  match("locations/:location_slug", {:via => [:patch, :put], :to => "locations#update"})
  match("locations/:location_slug", {via: :delete, to: "locations#destroy" })

  match("tags", {:via => :get, :to => "tags#index"})
  match("tags", {:via => :post, :to => "tags#create"})
  match("tags/:tag_slug", {:via => :get, :to => "tags#show"})
  match("tags/:tag_slug/edit", {:via => :get, :to => "tags#edit"})
  match("tags/:tag_slug", {:via => [:patch, :put], :to => "tags#update"})
  match("tags/:tag_slug", {via: :delete, to: "tags#destroy" })

end
