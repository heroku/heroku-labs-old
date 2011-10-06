require 'heroku/command/beta'

Heroku::Command::Help.group('Beta') do |group|
  group.command('beta --app myapp', 'Lists beta addons')
  group.command('beta:info [addon]', 'Displays details of a beta addon')
  group.command('beta:enable [addon] --app myapp', 'Enables a beta addon')
  group.command('beta:disable [addon] --app myapp', 'Disables a beta addon')
end