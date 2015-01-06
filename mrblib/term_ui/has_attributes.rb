module TermUI
  
  # Adds the `update_attributes` method.
  module HasAttributes
    
    # Initialize this object by optionally updating attributes with a Hash.
    def initialize(attributes={})
      raise TypeError, 'attributes must respond to :to_hash or :to_h' unless attributes.respond_to?(:to_hash) || attributes.respond_to?(:to_h)
      attributes = attributes.to_hash rescue attributes.to_h
      
      update_attributes(attributes)
    end
    
    # Update any attributes on this object.
    def update_attributes(attributes={})
      attributes.each { |name, value| send( "#{name}=", value ) }
    end
    
  end
  
end
