class Heroku::Client
  
  def list_features(app)
    json_decode(get("/apps/#{app}/features", :accept => :json).to_s)
  end
  
  def get_feature(app, name)
    json_decode get("/apps/#{app}/features/#{name}", :accept => :json).to_s
  end
  
  def enable_feature(app, name)
    json_decode post("/apps/#{app}/features/#{name}", :accept => :json).to_s
  end
  
  def disable_feature(app, name)
    json_decode delete("/apps/#{app}/features/#{name}", :accept => :json).to_s
  end
  
end
