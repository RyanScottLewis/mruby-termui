module TermUI
  
  # A TUI application.
  # Should only ever have 1 instance per thread.
  class Application
    
    class << self
      
      def run
        new.run
      end
      
    end
    
    include HasChildren
    include HasEvents
    
    def initialize(attributes={})
      super
      
      Termbox.init
      
      @running = false
      @redraw = true
      @wait_time = 10
      @cursor = Cursor.new( application: self )
      @event_dispatcher = Event::Dispatcher.new( application: self )
    end
    
    # Get the text cursor.
    # 
    # @return [Cursor]
    attr_reader :cursor
    
    # Get the time to wait for events in milliseconds.
    # 
    # @return [Integer]
    attr_reader :wait_time
    
    # Set the time to wait for events in milliseconds.
    # Set to 0 to wait forever.
    # 
    # @param [#to_i] value The new value.
    # @return [Integer]
    def wait_time=(value)
      # TODO: TypeError, :to_i
      value = value.to_i
      value = 0 if value < 0
      
      @wait_time = value
    end
    
    # Get the event dispatcher.
    # 
    # @return [Event::Dispatcher]
    attr_reader :event_dispatcher
    
    # Get the width of the application's screen.
    # 
    # @return [Integer]
    def width
      Termbox.width
    end
    
    # Get the height of the application's screen.
    # 
    # @return [Integer]
    def height
      Termbox.height
    end
    
    # Update this application.
    # 
    # @return [Application] This application.
    def update
      update_children
      
      self
    end
    
    # Draw this application.
    # 
    # @return [Application] This application.
    def draw
      Termbox.clear
      
      draw_children
      cursor.draw
      
      Termbox.present
      
      @redraw = false
      
      self
    end
    
    # Queue all children for drawing during the next loop cycle.
    # 
    # @return [Application] This application.
    def redraw
      @redraw = true
      
      self
    end
    
    # Get whether all children will redraw in the next loop cycle.
    # 
    # @return [Boolean]
    def redraw?
      @redraw == true
    end
    
    # Check if this application is running.
    # 
    # @return [Boolean]
    def running?
      @running
    end
    
    # Run this application.
    # 
    # @return [Application] This application.
    def run
      @running = true
      is_polling = wait_time == 0 ? true : false
      
      while @running
        update
        
        # TODO: Should send to a "draw" queue?
        draw if redraw?
        
        is_polling ? event_dispatcher.poll : event_dispatcher.peek(wait_time)
      end
      
      self
    ensure
      Termbox.shutdown
      
      self
    end
    
    # Stop the application.
    # 
    # @return [Application] This application.
    def stop
      @running = false
      
      self
    end
    
    # Add a child to this application.
    # 
    # @param [Widget] widget The child to add.
    # @return [Widget] The added widget.
    def add_child(widget)
      super
      
      widget.application = self
      widget.parent = self
      
      widget
    end
    
    # Get the currently focused widget.
    attr_reader :focused
    
    # Set focus to a widget.
    # 
    # There can only be one widget focused at a time within an application, if any.
    # All dispatched events are sent to the currently focused widget, or the application if no widget is focused.
    def focus(widget)
      raise TypeError, 'widget must be nil or be a TermUI::Widget' unless widget.nil? || widget.is_a?(TermUI::Widget)
      
      dispatch_event( :unfocus )
      
      @focused = widget
      
      dispatch_event( :focus, target: widget )
      
      widget
    end
    
    # Dispatch an event.
    # 
    # @param [#to_sym] name The name of the event class.
    # @return [Event::Base] The event.
    def dispatch_event( event_name, options={})
      raise TypeError, 'options must respond to #to_hash or #to_h' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      
      event_dispatcher.target = options[:target] if options.has_key?(:target)
      event = Event.new_from_name(event_name)
      
      event_dispatcher.dispatch_event(event)
    end
    
  end
  
end
