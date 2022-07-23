deploy:
		git subtree push --prefix collective_blog/ heroku master
lint:
	  cd collective_blog && bundle exec rubocop && bundle exec slim-lint app/views/
install:
	  cd collective_blog && bundle
test:
		cd collective_blog && bin/rails test