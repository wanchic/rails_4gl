require 'spec_helper'

describe <%= class_name.pluralize %>Controller do
  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) { {
  <%- model_attributes.each do |attribute| -%>
  <%- case attribute.type
            when :string, :text         ; ds = "'Sample Text'"
            when :integer               ; ds = 00010
            when :float, :decimal       ; ds = 1.23456
            when :datetime, :timestamp  ; ds = "8/22/1998 14:41"
            when :time                  ; ds = "14:41"
            when :date                  ; ds = "8/22/1998"
            when :binary                ; ds = 1
            when :boolean               ; ds = true
            else                        ; ds = "'Unknown'"
          end -%>
    <%= attribute.name %>: <%= ds %><%= "," unless attribute == model_attributes.last %>
  <%- end -%>
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= class_name.pluralize %>Controller. Be sure to keep this updated too.

  let(:valid_session) { {} }

  <%= controller_methods "rspec/actions" %>

end