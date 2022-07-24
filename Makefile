deploy:
		git push heroku master
lint:
	  bundle exec rubocop && bundle exec slim-lint app/views/
install:
	  bundle
tests:
		bin/rails test