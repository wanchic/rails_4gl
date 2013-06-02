class <%= plural_class_name %>Controller < ApplicationController
  respond_to :html

  before_filter { |c| c.set_model(<%= class_name %>) }

  <%= controller_methods :actions %>

end