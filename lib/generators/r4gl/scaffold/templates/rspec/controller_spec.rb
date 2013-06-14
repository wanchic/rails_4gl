require 'spec_helper'

describe <%= class_name.pluralize %>Controller do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= class_name.pluralize %>Controller. Be sure to keep this updated too.

  let(:valid_session) { {} }

  <%= controller_methods "rspec/actions" %>

end