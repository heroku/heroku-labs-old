heroku-beta-command
===================

Stubbed client plugin for beta program feature.

Basic CLI DX
------------

Developers not enrolled in the beta program see the following when attempting to invoke the beta command.

    $ heroku beta
    You are currently not enrolled in our beta program.
    
    If you would like to participate, and are willing 
    to commit to providing helpful feedback and testing 
    new features as they are released, send an email to 
    beta@heroku.com. Include an explanation of why you 
    would make a good beta tester, and what features you 
    are interested in.

Viewing the particular beta addons a particular app has enabled. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku beta --app myapp
    Foo
    Bar
    
    To see the details of particular beta addon run:
    'heroku beta:info [addon]'
    
    To enable a particular beta addon run:
    'heroku beta:enable [addon] --app myapp'
    
    To disable a particular beta addon run:
    'heroku beta:disable [addon] --app myapp'

Viewing the details of a particular beta addons. This command does not require an application context.

    $ heroku beta:info Bar
    Bar helps developers build, deploy, and ...
    
    Details: http://addons.heroku.com/bar
    Docs: http://devcenter.heroku.com/articles/bar (username/password)
    Support: support@bar.com

Enabling a particular beta addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku beta:enable Bar --app myapp
    -----> Enabling the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar *

Disabling a particular beta addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku beta:disable Bar --app myapp
    -----> Disabling the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar