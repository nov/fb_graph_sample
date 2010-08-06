require 'test_helper'

class RoutingTest < ActionController::TestCase

  test "should map HTTP method and path to the expected controller and path" do
    expected_routings = {
      "GET /"                  => 'top#index',
      "GET /dashboard"         => 'dashboard#show',
      "GET /facebook"          => 'facebooks#show',
      "GET /facebook/new"      => 'facebooks#new',
      "GET /facebook/callback" => 'facebooks#create',
      "DELETE /facebook"       => 'facebooks#destroy',
    }
    expected_routings.each do |input, output|
      method, path = input.split
      controller, action = output.split('#')
      assert_recognizes(
        {:controller => controller, :action => action},
        {:method => method, :path => path}
      )
    end
  end

end
