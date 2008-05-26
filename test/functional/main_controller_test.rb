require File.dirname(__FILE__) + '/../test_helper'

class MainControllerTest < ActionController::TestCase

  self.display_invalid_content = true
  assert_valid_css_files 'application'

  def test_about
    assert_routing '/', :controller => 'main', :action => 'about'
    get :about
    assert_response :success
    assert_template 'about'
    assert_valid_markup
  end
end
