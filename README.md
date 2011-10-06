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
    
    'heroku beta:info [addon]' to see the details of a beta addon
    'heroku beta:enable [addon] --app myapp' to enable a beta addon
    'heroku beta:disable [addon] --app myapp' to disable a beta addon

Viewing the details of a particular beta addons. This command does not require an application context.

    $ heroku beta:info Bar    
    Details: http://addons.heroku.com/bar
    Docs: http://devcenter.heroku.com/articles/bar (username/password)
    Support: support@bar.com

Enabling a particular beta addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku beta:enable Bar --app myapp
    Enabled the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar *

Disabling a particular beta addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku beta:disable Bar --app myapp
    Disabled the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar

Proposed Core Application Updates
---------------------------------

    heroku.list_beta_addons(app) # lists the beta addons for app, enabled addons marked
    heroku.get_beta_addon(addon) # gets the details of addon, consider generisizing to get_addon
    heroku.enable_beta_addon(app, addon) # enables addon for app
    heroku.disable_beta_addon(app, addon) # disables addon for app