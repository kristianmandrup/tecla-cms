require 'spec_helper'

# See:
# https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-(and-RSpec)
# http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html
describe Cms::PageController do
  describe "GET #index" do
    it "renders the :index template"
  end

  describe "GET #show" do
    it "renders the :show template"
  end
end