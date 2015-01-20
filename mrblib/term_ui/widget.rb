module TermUI
  
  # The base class for all widgets.
  class Widget
    
    include HasApplication
    include HasDimensions
    include HasEvents
    include HasForegroundAndBackground
    include HasOffsets
    include HasRelativeCoordinates
    
    # Get the outer width of this widget.
    # This is the dimension including any borders, margins, or padding sizes.
    # 
    # @return [Integer]
    def outer_width
      width + offsets.width + padding.width
    end
    
    # Get the outer width of this widget.
    # This is the dimension including any borders, margins, or padding sizes.
    # 
    # @return [Integer]
    def outer_height
      height + offsets.height + padding.height
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
    
    # TODO: Widget drawing should be it's own module or class?
    
    def validate_cell_drawing_options(options)
      options = options.to_hash rescue options.to_h
      
      options = { x: 0, y: 0, foreground: Termbox::DEFAULT, background: Termbox::DEFAULT }.merge(options)
      
      options[:x]          = options[:x].to_i
      options[:y]          = options[:y].to_i
      options[:foreground] = options[:foreground].to_i
      options[:background] = options[:background].to_i
      
      options
    end
    
    def validate_rectangle_drawing_options(options)
      options = validate_cell_drawing_options(options)
      
      options = { width: 1, height: 1 }.merge(options)
      
      options[:width]  = options[:width].to_i
      options[:height] = options[:height].to_i
      
      options[:width]  = 1 if options[:width] < 1
      options[:height] = 1 if options[:height] < 1
      
      options
    end
    
    def translate_cell_drawing_options(options)
      # Translate the coordinates by absolute coordinates
      options[:x] += absolute_x
      options[:y] += absolute_y
      
      # Translate the coordinates by offsets
      options[:x] += offsets.left
      options[:y] += offsets.top
      
      options
    end
    
    # Convert options[:character] to unicode.
    # TODO: Is utf8_char_to_unicode even needed at this point?
    def convert_cell_drawing_character_option_to_unicode(options)
      options[:character] = Termbox.utf8_char_to_unicode( options[:character].to_s[0] ) unless options[:character].nil?
      options[:character] ||= 0
      
      options
    end
    
    # Change a cell relative to this widget's coordinates.
    def draw_cell(options={})
      options = validate_cell_drawing_options(options)
      options = translate_cell_drawing_options(options)
      options = convert_cell_drawing_character_option_to_unicode(options)
      
      # TODO: Unless :x or :y is out of the widgets drawing area (absolute coordinate plus dimension)
      Termbox.change_cell( options[:x], options[:y], options[:character], options[:foreground], options[:background] )
    end
    
    # Change a rectangle of cells relative to this widget's coordinates.
    # TODO: :filled option
    def draw_rectangle(options={})
      options = validate_rectangle_drawing_options(options)
      options = translate_cell_drawing_options(options)
      options = convert_cell_drawing_character_option_to_unicode(options)
      
      options[:width].times do |x_offset|
        options[:height].times do |y_offset|
          # TODO: Unless :x or :y is out of the widgets drawing area (absolute coordinate plus dimension plus x/y_offset)
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
