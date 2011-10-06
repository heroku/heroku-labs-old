class Heroku::Command::Beta < Heroku::Command::BaseWithApp

  # beta
  #
  # lists beta addons
  #
  def index
    addons = heroku.list_beta_addons(app) # enabled addons marked
    if addons.empty?
      display " You are currently not enrolled in our beta program."
      display " If you would like to participate, and are willing"
      display " to commit to providing helpful feedback and testing"
      display " new features as they are released, send an email to"
      display " beta@heroku.com. Include an explanation of why you"
      display " would make a good beta tester, and what features you"
      display " are interested in."
    else
      lines = addons.map do |addon|
        row = [addon['enabled'] ? '*' : ' ', addon['name']]
        row.join(' ')
      end
      display lines.join("\n")
      display
      display " 'heroku beta:info [addon]' to see the details of an addon"
      display " 'heroku beta:enable [addon] --app myapp' to enable an addon"
      display " 'heroku beta:disable [addon] --app myapp' to disable an addon"
    end
  end

  # beta:info [addon]
  #
  # displays details of a beta addon
  #
  def info
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku beta:info [addon]") if addon_name.to_s.strip.empty?
    addon = heroku.get_beta_addon(addon_name) # consider heroku.get_addon
    display " Details: #{addon['details']}"
    display " Docs: #{addon['documentation']}"
    display " Support: #{addon['support']}"
  end
  
  # beta:enable [addon]
  #
  # enables a beta addon
  #
  def enable
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku beta:enable [addon]") if addon_name.to_s.strip.empty?
    heroku.enable_beta_addon(app, addon_name)
    display "Enabled #{addon_name} for #{app}.#{heroku.host}"
  end
  
  # beta:disable [addon]
  #
  # disables a beta addon
  #
  def disable
    addon_name = args.shift.downcase rescue nil
    fail("Usage: heroku beta:disable [addon]") if addon_name.to_s.strip.empty?
    heroku.disable_beta_addon(app, addon_name)
    display "Disabled #{addon_name} for #{app}.#{heroku.host}"
  end

end