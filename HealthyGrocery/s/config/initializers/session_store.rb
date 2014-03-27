# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_s_session',
  :secret      => '5ad5606e3e85fa4b9d7e504aecbf2c238b4e70bb04ceb19aee5e1247854460c99f9a5ab01e6ac6f624b455efaec15d4e67c744bd88c2cb27c5b6ef67e5fb1b82'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
