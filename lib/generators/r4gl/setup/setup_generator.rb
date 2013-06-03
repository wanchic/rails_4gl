require 'generators/r4gl'


module R4gl
  module Generators
    class SetupGenerator < Base

      def add_gems
        add_gem "rspec-rails", group: [:development, :test]
        add_gem "factory_girl_rails", group: [:development, :test]

        add_gem "cucumber-rails", group: :test, require: false
        add_gem "database_cleaner", group: :test
        add_gem "simplecov", group: :test, require: false

        add_gem "seedbank"
        add_gem "delocalize"

        Bundler.with_clean_env do
          run "bundle install"
          run "rails g rspec:install"
          run "rails g cucumber:install"
        end

      end

      def configure_simplecov
        code = "#Simple Coverage\nrequire 'simplecov'\nSimpleCov.start"

        sub_file 'spec/spec_helper.rb', search = "ENV[\"RAILS_ENV\"] ||= 'test'", "#{search}\n\n#{code}\n"
        sub_file 'features/support/env.rb', search = "require 'cucumber/rails'", "#{search}\n\n#{code}\n"
      end

      def configure_seedbank
        template "gems/seeds.erb", "db/seeds.rb"
        Dir.mkdir "db/seeds" unless File.exists?("db/seeds")
      end

      def default_i18t
        code = "config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]"

        sub_file 'config/application.rb',
                  search = "# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]",
                  "#{search}\n    #{code}\n"

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

      def default_views
        remove_file 'app/views/layouts/application.html.erb'
        template "views/layouts/application.html.erb", "app/views/layouts/application.html.erb"

        %w[field_length form_errors form_submit].each do |file|
          template "views/helpers/_#{file}.html.erb", "app/views/helpers/_#{file}.html.erb"
        end

        %w[footer header message].each do |file|
          template "views/layouts/_#{file}.html.erb", "app/views/layouts/_#{file}.html.erb"
        end

      end

      private

      def destination_path(path)
        File.join(destination_root, path)
      end

      def sub_file(relative_file, search_text, replace_text)
        path = destination_path(relative_file)
        file_content = File.read(path)

        unless file_content.include? replace_text
          content = file_content.sub(/(#{Regexp.escape(search_text)})/mi, replace_text)
          File.open(path, 'wb') { |file| file.write(content) }
        end

      end

      def add_gem(name, options = {})
        gemfile_content = File.read(destination_path("Gemfile"))
        File.open(destination_path("Gemfile"), 'a') { |f| f.write("\n") } unless gemfile_content =~ /\n\Z/
        gem name, options unless gemfile_content.include? name
      end

    end
  end
end
