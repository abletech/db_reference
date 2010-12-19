namespace :db do
  desc "Loads reference data values for the current environment."
  task :reference => :environment do
    files = Dir[File.join(Rails.root, 'db', 'reference', '*.rb')].sort
    files += Dir[File.join(Rails.root, 'db', 'reference', Rails.env, '*.rb')].sort
    
    files.each do |file|
      puts "Populating reference #{file}"
      load file
    end
  end
  
  desc "Drops, creates, migrates, populates"
  task :clear => ['db:drop', 'db:create', 'db:migrate', 'db:reference'] do
  end
end

