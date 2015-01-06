module TermUI
  
  # The container for Event::Base subclasses.
  module Event
    
    @all = []
    
    class << self
      
      # Get all Event::Base subclasses.
      # 
      # @return [Array<Class>]
      attr_reader :all
      
      # Find an Event::Base subclass by it's name.
      # 
      # @param [#to_sym] name The name of the event. For example, `SomeAction` would be `:some_action`.
      # @return [nil, Class] The Event::Base subclass.
      def find_by_name(name)
        raise TypeError, 'name must respond to #to_sym' unless name.respond_to?(:to_sym)
        name = name.to_sym
        
        all.find { |event_class| event_class.name == name }
      end
      
      # Initialize an Event::Base subclass by it's name.
      # 
      # @param [#to_sym] name The name of the event class.
      def new_from_name(name, attributes={})
        event_class = find_by_name(name)
        raise ArgumentError, "Unknown event name '#{name}'" if event_class.nil?
        
        event_class.new(attributes)
      end
      
    end # << self
    
  end
  
end
