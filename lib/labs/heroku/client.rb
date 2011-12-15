class Heroku::Client

  def list_features(app)
    json_decode(get("features?app=#{app}", :accept => :json).to_s)
  end

  def get_feature(app, name)
    json_decode get("features/#{name}?app=#{app}", :accept => :json).to_s
  end

  def enable_feature(app, name)
    json_decode post("/features/#{name}?app=#{app}", :accept => :json).to_s
  end

  def disable_feature(app, name)
    json_decode delete("/features/#{name}?app=#{app}", :accept => :json).to_s
  end

end
