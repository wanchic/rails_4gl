module Rails4gl
  class Railtie < Rails::Railtie
    initializer "rails_4gl.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        # puts "Extending #{self} with Rails4gl::Controller"
        # ActionController::Base gets a method that allows controllers to include the new behavior
        include Rails4gl::Controller # ActiveSupport::Concern
      end
    end

    initializer "field_error_proc" do
      # Original Code solution from Phobetron
      # http://stackoverflow.com/questions/5267998/rails-3-field-with-errors-wrapper-changes-the-page-appearance-how-to-avoid-t/5268065#5268065

      ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
        class_attr_index = html_tag.index 'class="'

        if class_attr_index
          html_tag.insert class_attr_index+7, 'error '
        else
          if html_tag.index('/>')
            html_tag.insert html_tag.index('/>'), 'class="error" '

          else
            html_tag.insert html_tag.index('>'), ' class="error"'

          end

        end

        "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
      end

    end

  end
end
