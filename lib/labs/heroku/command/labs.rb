class Heroku::Command::Labs < Heroku::Command::Base

  # labs
  #
  # lists available features for an app
  #
  def index
    features = heroku.list_features(app)
    longest = features.map { |f| f["name"].length }.sort.last
    enabled, disabled = features.partition { |f| f["enabled"] }

    display "=== Enabled Features"
    enabled.each do |feature|
      display "%-#{longest}s  # %s" % [ feature["name"], feature["summary"] ]
    end
    display

    display "=== Disabled Features"
    disabled.each do |feature|
      display "%-#{longest}s  # %s" % [ feature["name"], feature["summary"] ]
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
    message = "Enabling #{feature_name}"
    message += " for #{app}" if app
    action(message) do
      heroku.enable_feature(app, feature_name)
    end
    display "WARNING: This feature is experimental and may change or be removed without notice."
  end

  # labs:disable FEATURE
  #
  # disables FEATURE on an app
  #
  def disable
    feature_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:disable feature") if feature_name.to_s.strip.empty?
    message = "Disabling #{feature_name}"
    message += " for #{app}" if app
    action(message) do
      heroku.disable_feature(app, feature_name)
    end
  end

private

  def app
    options[:app] || nil
  end

end
