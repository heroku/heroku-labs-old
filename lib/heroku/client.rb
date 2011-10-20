class Heroku::Client
  
  def list_features(app)
    json_decode get("/apps/#{app}/features").to_s
  end
  
  def get_feature(name)
    json_decode get("/features/#{name}").to_s
  end
  
  def enable_feature(app, name)
    json_decode put("/apps/#{app}/features/#{name}/enable").to_s
  end
  
  def disable_feature(app, name)
    json_decode put("/apps/#{app}/features/#{name}/disable").to_s
  end
  
end