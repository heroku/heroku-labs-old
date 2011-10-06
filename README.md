heroku-beta-command
===================

Stubbed client plugin for beta program feature.

Basic CLI DX
------------

    $ heroku beta
    You are currently not enrolled in our beta program.
    
    If you would like to participate, and are willing 
    to commit to providing helpful feedback and testing 
    new features as they are released, send an email to 
    beta@heroku.com. Include an explanation of why you 
    would make a good beta tester, and what features you 
    are interested in.

    $ heroku beta --app myapp
    Foo
    Bar
    
    To see the details of particular program run:
    'heroku beta:info <program>'
    
    To enable a particular program run:
    'heroku beta:enable <program> --app myapp'
    
    To disable a particular program run:
    'heroku beta:disable <program> --app myapp'

    $ heroku beta:info Bar
    Bar helps developers build, deploy, and ...
    
    Details: http://addons.heroku.com/bar
    Docs: http://devcenter.heroku.com/articles/bar (username/password)
    Support: support@bar.com

    $ heroku beta:enable Bar --app myapp
    -----> Enabling the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar [enabled]

    $ heroku beta:disable Bar --app myapp
    -----> Disabling the bar beta for myapp... done
    
    $ heroku beta --app myapp
    Foo
    Bar