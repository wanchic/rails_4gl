require 'spec_helper'

describe <%= class_name %> do
  before do
    @valid_attributes = {
      <%- model_attributes.each do |attribute| -%>
      <%- case attribute.type
              when :string, :text         ; ds = 'SecureRandom.hex'
              when :integer               ; ds = 'rand(903814893)'
              when :float, :decimal       ; ds = 'rand(903814893) + rand()'
              when :datetime, :timestamp  ; ds = 'Time.at(rand * Time.now.to_i)'
              when :date                  ; ds = '(Time.at(rand * Time.now.to_i)).strftime("%m/%d/%Y")'
              when :time                  ; ds = '(Time.at(rand * Time.now.to_i)).strftime("%H:%M")'
              when :binary                ; ds = '[0, 1].sample'
              when :boolean               ; ds = '[true, false].sample'
              else                        ; ds = "'Unknown'"
          end -%>
      <%= attribute.name %>: <%= ds %><%= "," unless attribute == model_attributes.last %>
      <%- end -%>
  }
  end

  it 'creates a new instance of given valid attributes' do
    lambda {
      <%= class_name %>.create(@valid_attributes)
    }.should change(<%= class_name %>, :count).by(1)
  end

  context 'Validations' do
    before do
      @<%= instances_name %> = <%= class_name %>.new
    end

    %w(<%= model_attributes.map{ |attribute| attribute.name }.flatten.join(" ") %>).each do |attr|
      it "must have a #{attr}" do
        @<%= instances_name %>.should_not be_valid
        @<%= instances_name %>.errors_on(attr).should_not be_blank
      end
    end

  end
end