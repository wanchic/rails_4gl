require "spec_helper"

describe <%= class_name.pluralize %>Controller do
  describe 'routing' do
    <%= controller_methods "rspec/routes" %>

  end

end
