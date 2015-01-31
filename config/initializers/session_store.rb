# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wiggles_session',
  :secret      => 'd0f5d79084c2258cbae6c21d0c481996c2d70ddff46e7e830755746cbb47befbc31e7e7aa36ee3d7cc0800103d937bf2d2b95737f136ba1a91c3d75cb3b33735'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
