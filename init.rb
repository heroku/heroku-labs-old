require 'heroku/command/labs'

Heroku::Command::Help.group('Labs') do |group|
  group.command('labs --app myapp', 'Lists addons')
  group.command('labs:info [addon]', 'Displays details of an addon')
  group.command('labs:enable [addon] --app myapp', 'Enables an addon')
  group.command('labs:disable [addon] --app myapp', 'Disables an addon')
end