require 'generators/r4gl'


module R4gl
  module Generators
    class SetupGenerator < Base

      def create_i18t
        template 'locales/activerecord.erb', "config/locales/defaults/activerecord/en.yml"
        template 'locales/delocalize.erb', "config/locales/defaults/delocalize/en.yml"
        template 'locales/globals.erb', "config/locales/defaults/globals/en.yml"
        template 'locales/helpers.erb', "config/locales/defaults/helpers/en.yml"
        template 'locales/routes.erb', "config/locales/defaults/routes/en.yml"
      end

    end
  end
end
