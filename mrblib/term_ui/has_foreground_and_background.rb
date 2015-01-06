module TermUI
  
  # Adds the #foreground and #background attributes.
  module HasForegroundAndBackground
    
    include HasAttributes
    
    def initialize(attributes={})
      @foreground, @background = Termbox::DEFAULT, Termbox::DEFAULT
      
      super
    end
    
    # Get the foreground color of this widget.
    attr_reader :foreground
    
    # Set the foreground color of this widget.
    def foreground=(value)
      raise ArgumentError, "foreground must respond to :to_i" unless value.respond_to?(:to_i)
      
      @foreground = value.to_i
    end
    
    # Get the background color of this widget.
    attr_reader :background
    
    # Set the background color of this widget.
    def background=(value)
      raise ArgumentError, "background must respond to :to_i" unless value.respond_to?(:to_i)
      
      @background = value.to_i
    end
    
  end
  
end
