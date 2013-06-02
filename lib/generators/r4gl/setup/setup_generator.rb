require 'generators/r4gl'


module R4gl
  module Generators
    class SetupGenerator < Base

      def default_i18t
        %w[activerecord delocalize globals helpers routes].each do |file|
          template "locales/#{file}.erb", "config/locales/defaults/#{file}/en.yml"
        end

      end

      def default_fonts
        %w[Bold BoldItalic Italic Regular].each do |type|
          %w[eot svg ttf woff].each do |file|
            copy_file "fonts/liberation-sans/LiberationSans-#{type}-webfont.#{file}",
                      "app/assets/fonts/liberation-sans/LiberationSans-#{type}-webfont.#{file}"
          end
        end

        copy_file 'fonts/liberation-sans/Red Hat Liberation License.txt',
                  'app/assets/fonts/liberation-sans/Red Hat Liberation License.txt'
      end

      def default_stylesheets
        remove_file 'app/assets/stylesheets/application.css'

        %w[application layout].each do |file|
          template "stylesheets/#{file}.erb", "app/assets/stylesheets/#{file}.css.scss"
        end

        template 'stylesheets/fonts/liberation-sans.erb', "lib/assets/stylesheets/fonts/liberation-sans.css.scss"

        %w[buttons fonts forms functions globals messages].each do |file|
          template "stylesheets/#{file}.erb", "lib/assets/stylesheets/#{file}.css.scss"
        end

      end

    end
  end
end
