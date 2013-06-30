class <%= plural_class_name %>Controller < ApplicationController
  respond_to :html

  before_action { |c| c.set_model(<%= class_name %>) }
  before_action :set_<%= instances_name %>, only: [:show, :edit, :update, :destroy]

  <%= controller_methods :actions %>

  private

  def set_<%= instances_name %>
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
  end

  def <%= instance_name %>_params
    params.require(:<%= instance_name %>).permit(<%= model_attributes.map{ |attribute| ":#{attribute.name}" }.flatten.join(", ") %>)
  end

  def record_name
    @<%= instance_name %>.<%= model_attributes.first.name %>
  end
end