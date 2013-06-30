# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :<%= instances_name.singularize %> do
    <%- model_attributes.each do |attribute| -%>
    <%- case attribute.type
              when 'string', 'text'        ; ds = 'SecureRandom.hex'
              when 'integer'               ; ds = 'rand(903814893)'
              when 'float', 'decimal'      ; ds = 'rand(903814893) + rand()'
              when 'datetime', 'timestamp' ; ds = 'Time.at(rand * Time.now.to_i)'
              when 'date'                  ; ds = '(Time.at(rand * Time.now.to_i)).strftime("%m/%d/%Y")'
              when 'time'                  ; ds = '(Time.at(rand * Time.now.to_i)).strftime("%H:%M")'
              when 'binary'                ; ds = '[0, 1].sample'
              when 'boolean'               ; ds = '[true, false].sample'
              else                         ; ds = "'Unknown'"
            end -%>
    <%= attribute.name %> { <%= ds %> }
    <%- end -%>
  end
end