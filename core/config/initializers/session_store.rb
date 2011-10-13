# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_core_session',
  :secret      => '1a43e5d5d94fddfdbbdc5c2e10e9cc7d250dd76006008bb301758911d2c1ee1a9ef814d1aec7ce029328fb5d6e8804cd7682e9f55f6d87d570323f41e193f7c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
