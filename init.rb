require 'heroku/command/labs'

Heroku::Command::Help.group('Labs') do |group|
  group.command('labs --app myapp', 'Lists features')
  group.command('labs:info feature', 'Displays details of a feature')
  group.command('labs:enable feature --app myapp', 'Enables a feature')
  group.command('labs:disable feature --app myapp', 'Disables a feature')
end