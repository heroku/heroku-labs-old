# heroku-labs

Use experimental features on your Heroku app

## WARNING

The features added through labs are experimental and may change or be removed without notice.

## Installation

    $ heroku plugins:install http://github.com/heroku/heroku-labs.git

## Usage

View the available features

    $ heroku labs --app myapp
    === Enabled Features

    === Disabled Features
    flux_capacitor  # add time travel capability

View detailed information about a particular feature

    $ heroku labs:info test_feature
    === flux_capacitor
    Description:   add time travel capability
    Documentation: http://devcenter.heroku.com/articles/flux_capacitor
    Enabled:       no

Enable a feature for an app

    $ heroku labs:enable flux_capacitor --app myapp
    -----> Enabling flux_capacitora for myapp... done

Disable a feature for an app

    $ heroku labs:disable bar --app myapp
    -----> Disabling flux_capacitora for myapp... done
