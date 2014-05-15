# DB Reference

Used for creating a predefined set of model instances, similar to db:seed, but will not repopulate if entries already exist.

## Installation

Add this line to your application's Gemfile:

    gem 'db_reference'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install db_reference

## Usage

Place references in 'db/reference/'
References will be loaded in ascending order, so if an order is desired, prepend 000, 001, 002... etc to the filename.

Run with:
    rake reference:load

## Example

The below example ensures that there are 6 locations existing in the database after running the 'rake reference:load'


### db/schema.rb
    create_table 'locations', :force => true do |t|
      t.string 'name', :null => false
    end


### db/reference/000_locations.rb
    Location.update_or_create :id => 1, :name => 'Wellington City'
    Location.update_or_create :id => 2, :name => 'Lower Hutt'
    Location.update_or_create :id => 3, :name => 'Kapiti Coast'
    Location.update_or_create :id => 4, :name => 'Porirua'
    Location.update_or_create :id => 5, :name => 'Upper Hutt'
    Location.update_or_create :id => 6, :name => 'Wairarapa'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## History

Version 0.1  initial release
Version 0.2  Support for Rails 4
