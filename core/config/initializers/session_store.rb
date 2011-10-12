# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_core_session',
  :secret      => 'd9fde626f06866a11639d9b21a0adf66196e8872edbc1e299ad1a5958ca46eb36690bad358c7615cca1fe1c4e9837706718bc476be975db7a40e30ba606a8795'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
