class HomeController < ApplicationController
  def index
    render template: 'index' # This will look for index.html.erb in app/views/
  end
end

