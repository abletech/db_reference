require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/db_reference_tasks.rake"
    end
  end
end

