heroku-labs-command
===================

Stubbed client plugin for labs program feature.

Basic CLI DX
------------

Viewing the particular features a particular app has enabled. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same pattern as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs --app myapp
    foo
    bar

Viewing the details of a particular feature. This command does not require an application context.

    $ heroku labs:info bar
    Details: http://addons.heroku.com/bar
    Docs: http://devcenter.heroku.com/articles/bar
    Support: support@bar.com

Enabling a particular feature for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same pattern as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs:enable bar --app myapp
    Enabled bar for myapp
    
    $ heroku labs --app myapp
    foo
    bar *

Disabling a particular feature for a particular app. Note that '--app' is an optional argument; when not provided, the context of the current application is assumed (same pattern as with most other Heroku commands), if a context is missing, a friendly error message is displayed.

    $ heroku labs:disable bar --app myapp
    Disabled bar for myapp
    
    $ heroku labs --app myapp
    foo
    bar

Proposed Core Application Updates
---------------------------------

Lists the features for app, enabled features marked

    heroku.list_features(app)
    {
       "name": "foo",
       "flag": "foo_flag",
       "details": "http://addons.heroku.com/bar",
       "documentation": "http://devcenter.heroku.com/articles/bar",
       "support": "support@bar.com",
       "enabled": true
    }

Gets the details of a feature

    heroku.get_feature(feature_name)
    {
       "name": "foo",
       "flag": "foo_flag",
       "details": "http://addons.heroku.com/bar",
       "documentation": "http://devcenter.heroku.com/articles/bar",
       "support": "support@bar.com"
    }

Enables feature for app

    heroku.enable_feature(app, feature_name)
    {
       "name": "foo",
       "flag": "foo_flag",
       "details": "http://addons.heroku.com/bar",
       "documentation": "http://devcenter.heroku.com/articles/bar",
       "support": "support@bar.com"
       "enabled": true
    }

Disables feature for app

    heroku.disable_feature(app, feature_name)
    {
       "name": "foo",
       "flag": "foo_flag",
       "details": "http://addons.heroku.com/bar",
       "documentation": "http://devcenter.heroku.com/articles/bar",
       "support": "support@bar.com"
       "enabled": false
    }