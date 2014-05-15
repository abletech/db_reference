module DbReference
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    # Given a hash of attributes including the ID, look up the record by ID. 
    #
    # If it does not exist, it is created with the rest of the options. 
    # If it exists, it is updated with the given options. 
    #
    # Returns the record.
    def update_or_create(attributes = {})
      id = attributes.delete(:id)
     
      record = if self.respond_to?(:find_or_initialize_by_id)
        find_or_initialize_by_id(id)
      else # rails4
        where(id: id).first_or_initialize
      end
      
      attributes.each_pair do |key, value|
        record.send "#{key}=", value
      end
      
      begin
        record.save!
      rescue
        puts "Save failed for #{record.class}[#{id}] with attributes #{attributes.inspect}"
        raise
      end

      record
    end
  end
end

ActiveRecord::Base.send :include, DbReference

