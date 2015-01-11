module TermUI
  
  # The base class for all widgets.
  class Widget
    
    include HasApplication
    include HasBorders
    include HasDimensions
    include HasEvents
    include HasForegroundAndBackground
    include HasMargins
    include HasPadding
    include HasRelativeCoordinates
    
    def initialize(attributes={})
      super
      
      @offsets = Offsets.new( widget: self )
    end
    
    # Get the offsets of this widget.
    # 
    # @return [Offsets]
    attr_reader :offsets
    
    # Get the outer width of this widget.
    # This is the dimension including any borders, margins, or padding sizes.
    # 
    # @return [Integer]
    def outer_width
      @width + borders.width + margins.width + padding.width
    end
    
    # Get the outer width of this widget.
    # This is the dimension including any borders, margins, or padding sizes.
    # 
    # @return [Integer]
    def outer_height
      @height + borders.height + margins.height + padding.height
    end
    
    # Get the cursor for this application.
    # 
    # @return [Cursor]
    def cursor
      application.cursor
    end
    
    # Queue all objects for drawing during the next loop cycle.
    # 
    # @return [Widget] This widget.
    def redraw
      application.redraw
      
      self
    end
    
    # Update this widget.
    def update
      # NOTE: Does nothing here on purpose.
    end
    
    # Draw this widget.
    # 
    # @return [Widget] This widget.
    def draw
      draw_background
      draw_border
      
      self
    end
    
    # Focus on this widget.
    # 
    # @return [Widget] This widget.
    def focus
      application.focus(self)
    end
    
    # Check whether this widget is focused.
    # 
    # @return [Boolean]
    def focused?
      application.focused == self # TODO: application.focused?(self)
    end
    
    protected
    
    # Change a cell relative to this widget's coordinates.
    def draw_cell(options={})
      raise TypeError, 'options must respond to :to_hash or :to_h' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      
      options = { x: 0, y: 0, foreground: Termbox::DEFAULT, background: Termbox::DEFAULT }.merge(options)
      
      raise ArgumentError, ':x option must respond to :to_i' unless options[:x].respond_to?(:to_i)
      raise ArgumentError, ':y option must respond to :to_i' unless options[:y].respond_to?(:to_i)
      raise ArgumentError, ':foreground option must respond to :to_i' unless options[:foreground].respond_to?(:to_i)
      raise ArgumentError, ':background option must respond to :to_i' unless options[:background].respond_to?(:to_i)
      
      options[:x]          = options[:x].to_i
      options[:y]          = options[:y].to_i
      options[:foreground] = options[:foreground].to_i
      options[:background] = options[:background].to_i
      
      # Translate the coordinates by absolute coordinates
      options[:x] += absolute_x
      options[:y] += absolute_y
      
      # TODO: What about bottom and right margins?
      
      # Convert character to unicode # TODO: Is utf8_char_to_unicode even needed at this point?
      # TODO: If an options[:character] is an integer, the use that. In any other case, use the below
      options[:character] = Termbox.utf8_char_to_unicode( options[:character].to_s[0] ) unless options[:character].nil?
      options[:character] ||= 0
      
      Termbox.change_cell( options[:x], options[:y], options[:character], options[:foreground], options[:background] )
    end
    
    # TODO: Note the redundency in code with this and #draw_cell
    # Change a rectangle of cells relative to this widget's coordinates.
    def draw_rectangle(options={})
      raise TypeError, 'options must respond to :to_hash or :to_h' unless options.respond_to?(:to_hash) || options.respond_to?(:to_h)
      options = options.to_hash rescue options.to_h
      
      options = { x: 0, y: 0, width: 1, height: 1, foreground: Termbox::DEFAULT, background: Termbox::DEFAULT }.merge(options)
      
      raise ArgumentError, ':x option must respond to :to_i' unless options[:x].respond_to?(:to_i)
      raise ArgumentError, ':y option must respond to :to_i' unless options[:y].respond_to?(:to_i)
      raise ArgumentError, ':width option must respond to :to_i' unless options[:width].respond_to?(:to_i)
      raise ArgumentError, ':height option must respond to :to_i' unless options[:height].respond_to?(:to_i)
      raise ArgumentError, ':foreground option must respond to :to_i' unless options[:foreground].respond_to?(:to_i)
      raise ArgumentError, ':background option must respond to :to_i' unless options[:background].respond_to?(:to_i)
      
      options[:x]          = options[:x].to_i
      options[:y]          = options[:y].to_i
      options[:width]      = options[:width].to_i
      options[:height]     = options[:height].to_i
      options[:foreground] = options[:foreground].to_i
      options[:background] = options[:background].to_i
      
      options[:width] = 1 if options[:width] < 1
      options[:height] = 1 if options[:height] < 1
      
      # Translate the coordinates by absolute coordinates
      options[:x] += absolute_x
      options[:y] += absolute_y
      
      # Convert character to unicode # TODO: Is utf8_char_to_unicode even needed at this point?
      # TODO: If an options[:character] is an integer, the use that. In any other case, use the below
      options[:character] = Termbox.utf8_char_to_unicode( options[:character].to_s[0] ) unless options[:character].nil?
      options[:character] ||= 0
      
      options[:width].times do |x_offset|
        options[:height].times do |y_offset|
          Termbox.change_cell( options[:x]+x_offset, options[:y]+y_offset, options[:character], options[:foreground], options[:background] )
        end
      end
    end
    
    # Draw the background of this widget.
    def draw_background
      draw_rectangle( width: width, height: height, foreground: foreground, background: background )
    end
    
    # Draw the border of this widget.
    def draw_border
      
    end
    
    def switch_foreground_and_background
      f, b = foreground, background
      
      self.foreground, self.background = b, f
      
      redraw
    end
    
  end
  
end
