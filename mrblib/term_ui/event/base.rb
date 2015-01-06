module TermUI
  module Event
    
    # The base class for all events.
    class Base
      
      class << self
        
        # Get the name of this event class as a symbol.
        # For example, `SomeAction` would be `:some_action`.
        # 
        # @return [Symbol]
        def name
          # to_s.gsub( 'TermUI::Event::', '').gsub(/::/, ?_).gsub(/([a-z])([A-Z])/, '\1_\2').downcase.to_sym
          
          to_s.split(/::/).last.gsub(/([a-z])([A-Z])/, '\1_\2').downcase.to_sym
        end
        
        # Add the subclass to `Event.all`, when inherited.
        def inherited(subclass)
          Event.all << subclass
        end
        
      end # << self
      
      include HasAttributes
      
      # Get the name of this event's class.
      def name
        self.class.name
      end
      
      # Get the widget or application this event was dispatched to.
      # 
      # @return [TermUI::Application, TermUI::Widget]
      attr_reader :target
      
      # Set the widget or application this event was dispatched to.
      # 
      # @param [TermUI::Application, TermUI::Widget] value
      # @return [TermUI::Application, TermUI::Widget]
      def target=(value)
        raise TypeError, 'target must be a TermUI::Application or TermUI::Widget' unless value.is_a?(TermUI::Application) || value.is_a?(TermUI::Widget)
        
        @target = value
      end
      
      # Get this event as a Hash.
      def to_h
        { name: self.class.name }
      end
      
      # Check if something is equivalent to this event.
      def ==(other)
        # TODO: Below is needed?
        # object_equivalence = super
        # return true if object_equivalence
        
        raise TypeError, 'other must respond to #to_hash or #to_h' unless other.respond_to?(:to_hash) || other.respond_to?(:to_h)
        other = other.to_hash rescue other.to_h
        
        other == to_h
      end
      
    end
    
  end
end
