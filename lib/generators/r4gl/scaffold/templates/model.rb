class <%= class_name %> < ActiveRecord::Base
<%= "  set_table_name :#{table_name}\n" if table_name -%>

  <%- vp_of = Array.new(model_attributes) -%>
  <%- vp_of.delete_if { |a| a.type == 'boolean' } -%>
  validates_presence_of <%= vp_of.map { |a| ":#{a.name}" }.join(", ") %>
  <%- model_attributes.each do |a| -%>
  <%- if a.type == 'boolean' -%>
  validates :<%= a.name %>, :inclusion => { :in => [true, false] }  # Validates presence of boolean :<%= a.name %>
  <%- end -%>
  <%- end -%>
end
