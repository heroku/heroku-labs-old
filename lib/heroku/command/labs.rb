class Heroku::Command::Labs < Heroku::Command::BaseWithApp

  # labs
  #
  # lists features
  #
  def index
    features = heroku.list_features(app)
    if features.empty?
      display " You are currently not enrolled in our labs program."
      display " If you would like to participate, and are willing"
      display " to commit to providing helpful feedback and testing"
      display " new features as they are released, send an email to"
      display " labs@heroku.com. Include an explanation of why you"
      display " would make a good tester, and what features you are"
      display " interested in."
    else
      lines = features.map do |feature|
        row = [feature['enabled'] ? '*' : ' ', feature['name']]
        row.join(' ')
      end
      display lines.join("\n")
      display
      display " 'heroku labs:info feature' to see the details of a feature"
      display " 'heroku labs:enable feature --app myapp' to enable a feature"
      display " 'heroku labs:disable feature --app myapp' to disable a features"
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