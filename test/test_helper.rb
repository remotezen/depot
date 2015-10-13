ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
#require "minitest/rails/capybara"


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def login_as(user)
    session[:user_id] = users(user).id
  end
  def logout
    session.delete :user_id
  end
  def setup
    login_as :one if defined? session
  end
  # Add more helper methods to be used by all tests here...
end
