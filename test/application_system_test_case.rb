require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  include Devise::Test::IntegrationHelpers

  def setup
    super
    @default_host = Capybara.app_host
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end

  def teardown
    super
    Capybara.app_host = @default_host
  end
end
