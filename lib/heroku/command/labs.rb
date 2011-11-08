class Heroku::Command::Labs < Heroku::Command::BaseWithApp

  # labs
  #
  # lists features
  #
  def index
    output = []
    output << "Feature              Enabled    Description"
    output << "=======              =======    ==========="
    features = heroku.list_features(app)
    lines = features.map do |feature|
      name = feature['name']
      enabled = feature['enabled'] ? 'yes' : 'no'
      description = feature['description']
      output << "%-20s %-10s %-78s" % [name, enabled, description]
    end
    display output.join("\n")
  end

  # labs:info feature
  #
  # displays details of a feature
  #
  def info
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:info feature") if feature_name.to_s.strip.empty?
    feature = heroku.get_feature(feature_name)
    display "=== #{feature['name']}"
    display "Description:   #{feature['details']}"
    display "Documentation: #{feature['documentation']}"
  end
  
  # labs:enable feature
  #
  # enables a feature
  #
  def enable
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:enable feature") if feature_name.to_s.strip.empty?
    heroku.enable_feature(app, feature_name)
    display "Enabled #{feature_name} for #{app}.#{heroku.host}"
  end
  
  # labs:disable feature
  #
  # disables a feature
  #
  def disable
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:disable feature") if feature_name.to_s.strip.empty?
    heroku.disable_feature(app, feature_name)
    display "Disabled #{feature_name} for #{app}.#{heroku.host}"
  end

end