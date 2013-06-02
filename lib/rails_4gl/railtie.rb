module Rails4gl
  class Railtie < Rails::Railtie
    initializer "rails_4gl.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        # puts "Extending #{self} with Rails4gl::Controller"
        # ActionController::Base gets a method that allows controllers to include the new behavior
        include Rails4gl::Controller # ActiveSupport::Concern
      end
    end
  end
end
