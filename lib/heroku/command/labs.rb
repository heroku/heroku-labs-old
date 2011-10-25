class Heroku::Command::Labs < Heroku::Command::BaseWithApp

  # labs
  #
  # lists features
  #
  def index
    features = heroku.list_features(app)
    lines = features.map do |feature|
      row = [feature['enabled'] ? '*' : ' ', feature['name']]
      row.join(' ')
    end
  end

  # labs:info feature
  #
  # displays details of a feature
  #
  def info
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:info feature") if feature_name.to_s.strip.empty?
    feature = heroku.get_feature(feature_name)
    display " Details: #{feature['details']}"
    display " Docs: #{feature['documentation']}"
    display " Support: #{feature['support']}"
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