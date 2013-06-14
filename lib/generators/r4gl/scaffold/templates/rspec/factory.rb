# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :<%= instances_name.singularize %> do
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
    <%= attribute.name %> <%= ds %>
    <%- end -%>
  end
end