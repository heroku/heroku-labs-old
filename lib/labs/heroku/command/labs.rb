class Heroku::Command::Labs < Heroku::Command::BaseWithApp

  # labs
  #
  # lists available features for an app
  #
  def index
    features = heroku.list_features(app)
    longest  = features.map { |f| f["name"].length }.sort.last
    format   = "%-#{longest+3}s %-10s %s"

    display format % %w( Feature Enabled Description )
    display format % %w( ======= ======= =========== )

    features.each do |feature|
      display format % [ feature["name"], feature["enabled"] ? "yes" : "no", feature["summary"] ]
    end
  end

  # labs:info FEATURE
  #
  # displays additional information about FEATURE
  #
  def info
    feature_name = args.shift
    fail("Usage: heroku labs:info feature") unless feature_name
    feature = heroku.get_feature(app, feature_name)
    display "=== #{feature['name']}"
    display "Description:   #{feature['summary']}"
    display "Documentation: #{feature['docs']}"
    display "Enabled:       #{feature['enabled'] ? 'yes' : 'no'}"
  end

  # labs:enable FEATURE
  #
  # enables FEATURE on an app
  #
  def enable
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:enable feature") if feature_name.to_s.strip.empty?
    action("Enabling #{feature_name} for #{app}") do
      heroku.enable_feature(app, feature_name)
    end
  end

  # labs:disable FEATURE
  #
  # disables FEATURE on an app
  #
  def disable
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:disable feature") if feature_name.to_s.strip.empty?
    action("Disabling #{feature_name} for #{app}") do
      heroku.disable_feature(app, feature_name)
    end
  end

end
