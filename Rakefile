require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the reference plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the reference plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Reference'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'tasks/**/*',
  'rails/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "db_reference"
  s.version = "0.0.7"
  s.author = "Cam Fowler"
  s.email = "cameron.fowler@abletech.co.nz"
  s.homepage = "http://www.abletech.co.nz/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Loads files from db/reference/"
  s.description = """

Used for creating a predefined set of models, similar to db:seed, but will not repopulate if entries already exist.

Place references in 'db/reference/'
References will be loaded in ascending order, so if an order is desired, prepend 000, 001, 002... etc to the filename.

Run with:
  rake reference:load

Example
=======

The below example ensures that there are 6 locations existing in the database after running the 'rake reference:load'


# db/schema.rb
create_table 'locations', :force => true do |t|
  t.string 'name', :null => false
end


# db/reference/000_locations.rb
Location.update_or_create :id => 1, :name => 'Wellington City'
Location.update_or_create :id => 2, :name => 'Lower Hutt'
Location.update_or_create :id => 3, :name => 'Kapiti Coast'
Location.update_or_create :id => 4, :name => 'Porirua'
Location.update_or_create :id => 5, :name => 'Upper Hutt'
Location.update_or_create :id => 6, :name => 'Wairarapa'

  """
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

