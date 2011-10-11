class Heroku::Command::Labs < Heroku::Command::BaseWithApp

  # labs
  #
  # lists addons
  #
  def index
    addons = heroku.list_experimental_addons(app)
    if addons.empty?
      display " You are currently not enrolled in our labs program."
      display " If you would like to participate, and are willing"
      display " to commit to providing helpful feedback and testing"
      display " new features as they are released, send an email to"
      display " labs@heroku.com. Include an explanation of why you"
      display " would make a good tester, and what features you are"
      display " interested in."
    else
      lines = addons.map do |addon|
        row = [addon['enabled'] ? '*' : ' ', addon['name']]
        row.join(' ')
      end
      display lines.join("\n")
      display
      display " 'heroku labs:info [addon]' to see the details of an addon"
      display " 'heroku labs:enable [addon] --app myapp' to enable an addon"
      display " 'heroku labs:disable [addon] --app myapp' to disable an addon"
    end
  end

  # labs:info [addon]
  #
  # displays details of an addon
  #
  def info
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:info [addon]") if addon_name.to_s.strip.empty?
    addon = heroku.get_experimental_addon(addon_name)
    display " Details: #{addon['details']}"
    display " Docs: #{addon['documentation']}"
    display " Support: #{addon['support']}"
  end
  
  # labs:enable [addon]
  #
  # enables an addon
  #
  def enable
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:enable [addon]") if addon_name.to_s.strip.empty?
    heroku.enable_experimental_addon(app, addon_name)
    display "Enabled #{addon_name} for #{app}.#{heroku.host}"
  end
  
  # labs:disable [addon]
  #
  # disables an addon
  #
  def disable
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku labs:disable [addon]") if addon_name.to_s.strip.empty?
    heroku.disable_experimental_addon(app, addon_name)
    display "Disabled #{addon_name} for #{app}.#{heroku.host}"
  end

end