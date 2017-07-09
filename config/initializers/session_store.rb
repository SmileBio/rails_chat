# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_go_friends_test_session'
Rails.application.config.session_store :redis_store, servers: ["redis://h:p13cc84dbc61209991252ec2a27a4cc9842d9031fdd36cc19dc9586c020fab499@ec2-34-230-117-175.compute-1.amazonaws.com:18759"]
