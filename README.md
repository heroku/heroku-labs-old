# heroku-labs

Use experimental features on your Heroku app

## WARNING

The features added through labs are experimental and will change and eventually be removed without notice.

## Installation

    $ heroku plugins:install https://github.com/heroku/heroku-labs.git

## Usage

View the available features

    $ heroku labs --app myapp
    === App Features (myapp)
    [+] flux_capacitor  # Add time travel capability

    === User Features (user@example.org)
    [+] superpowers     # Adds flight and laser vision

View detailed information about a particular feature

    $ heroku labs:info flux_capacitor
    === flux_capacitor
    Summary: Add time travel capability
    Docs:    http://devcenter.heroku.com/articles/flux_capacitor

Enable a feature for an app

    $ heroku labs:enable flux_capacitor --app myapp
    -----> Enabling flux_capacitor for myapp... done
    WARNING: This feature is experimental and may change or be removed without notice.

Disable a feature for an app

    $ heroku labs:disable flux_capacitor --app myapp
    -----> Disabling flux_capacitor for myapp... done
