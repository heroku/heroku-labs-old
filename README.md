heroku-labs-command
===================

Stubbed client plugin for labs program feature.

Basic CLI DX
------------

Developers not enrolled in the labs program see the following when attempting to invoke the labs command.

    $ heroku labs
    You are currently not enrolled in our labs program.
    
    If you would like to participate, and are willing 
    to commit to providing helpful feedback and testing 
    new features as they are released, send an email to 
    labs@heroku.com. Include an explanation of why you 
    would make a good tester, and what features you are
    interested in.

Viewing the particular experimental addons a particular app has enabled. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs --app myapp
    Foo
    Bar
    
    'heroku labs:info [addon]' to see the details of an addon
    'heroku labs:enable [addon] --app myapp' to enable an addon
    'heroku labs:disable [addon] --app myapp' to disable an addon

Viewing the details of a particular experimental addon. This command does not require an application context.

    $ heroku labs:info Bar    
    Details: http://addons.heroku.com/bar
    Docs: http://devcenter.heroku.com/articles/bar (username/password)
    Support: support@bar.com

Enabling a particular experimental addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs:enable Bar --app myapp
    Enabled bar for myapp
    
    $ heroku labs --app myapp
    Foo
    Bar *

Disabling a particular experimental addon for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same patterns as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs:disable Bar --app myapp
    Disabled bar for myapp
    
    $ heroku labs --app myapp
    Foo
    Bar

Proposed Core Application Updates
---------------------------------

    heroku.list_experimental_addons(app) # lists the experimental addons for app, enabled addons marked
    heroku.get_experimental_addon(addon) # gets the details of addon, consider generisizing to get_addon
    heroku.enable_experimental_addon(app, addon) # enables addon for app
    heroku.disable_experimental_addon(app, addon) # disables addon for app