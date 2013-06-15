class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_field_length_param

end
