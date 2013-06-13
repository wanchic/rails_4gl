require 'spec_helper'

describe <%= class_name %> do
  before do
    @valid_attributes = {
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