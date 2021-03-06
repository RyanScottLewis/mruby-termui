module TermUI
  
  class Label < Widget
    
    def initialize(attributes={})
      @horizontal_alignment, @vertical_alignment = :left, :top
      @bold, @underline = false, false
      @text = ""
      
      super
    end
    
    # TODO: #text_foreground, #text_background (? Maybe a separate Text widget, like in )
    
    # Get the width of this label.
    # 
    # @return [Integer]
    def width
      result = super
      result = text_width if result == 0 # TODO: :auto
      
      result
    end
    
    # Get the height of this label.
    # 
    # @return [Integer]
    def height
      result = super
      result = text_height if result == 0 # TODO: :auto
      
      result
    end
    
    # Get the text of this label.
    # 
    # @return [String]
    attr_reader :text
    
    # Set the text of this label.
    # 
    # @param [#to_s] value
    # @return [String]
    def text=(value)
      @text = value.to_s
    end
    
    # Get the lines of this label.
    # 
    # @return [<String>]
    def lines
      @text.split("\n") # NOTE: Would use String#lines but it's output doesn't think a trailing newline character constitutes a line unless it is followed by another character. #split also removes the newline characters.
    end
    
    # Get the width of the text of this label.
    # 
    # @return [Integer]
    def text_width
      return 0 if @text.empty?
      
      lines.collect(&:length).sort.last
    end
    
    # Get the height of the text of this label.
    # 
    # @return [Integer]
    def text_height
      result = lines.length
      
      result == 0 ? 1 : result
    end
    
    # Get whether the text is bold.
    # 
    # @return [Boolean]
    def bold?
      @bold
    end
    
    # Set whether the text is bold.
    # 
    # @return [Boolean]
    def bold=(value)
      @bold = !!value
    end
    
    # Get whether the text is underlined.
    # 
    # @return [Boolean]
    def underlined?
      @underline
    end
    
    # Set whether the text is underlined.
    # 
    # @return [Boolean]
    def underline=(value)
      @underline = !!value
    end
    
    # Get the horizontal alignment of this widget.
    # 
    # @return [Symbol]
    attr_reader :horizontal_alignment
    
    # Set the horizontal alignment of this widget.
    # Must be :left, :center, or :right.
    # 
    # @param [#to_sym] value
    # @return [Symbol]
    def horizontal_alignment=(value)
      value = value.to_sym
      raise ArgumentError, 'horizontal_alignment must be one of :left, :center, or :right' unless [:left, :center, :right].include?(value)
      
      @horizontal_alignment = value
    end
    
    # Get the vertical alignment of this widget.
    # Will be :left, :center, or :right.
    # 
    # @return [Symbol]
    attr_reader :vertical_alignment
    
    # Set the vertical alignment of this widget.
    # Must be :left, :center, or :right.
    # 
    # @param [#to_sym] value
    # @return [Symbol]
    def vertical_alignment=(value)
      value = value.to_sym
      raise ArgumentError, 'vertical_alignment must be one of :top, :center, or :bottom' unless [:top, :center, :bottom].include?(value)
      
      @vertical_alignment = value
    end
    
    def draw
      super
      
      draw_text unless text.empty?
    end
    
    protected
    
    # Helper method for subclasses
    def text_to_draw
      text
    end
    
    # Helper method for subclasses
    def character_to_draw(character)
      character
    end
    
    # TODO: Should use instance vars 
    def draw_text
      x_offset = x_offset_start = x_offset_from_alignment
      y_offset = y_offset_from_alignment
      
      text_to_draw.each_char do |character|
        if character == "\n"
          x_offset = x_offset_start
          
          y_offset += 1
        else
          foreground_and_flags = foreground if !bold? && !underlined?
          foreground_and_flags = foreground | Termbox::BOLD if bold?
          foreground_and_flags = foreground | Termbox::UNDERLINE if underlined?
          foreground_and_flags = foreground | Termbox::BOLD | Termbox::UNDERLINE if bold? && underlined?
          
          options = translate( x: x_offset, y: y_offset ).merge( character: character_to_draw(character), foreground: foreground_and_flags, background: background )
          
          pencil.draw_cell( options )
          
          x_offset += 1
        end
      end
    end
    
    def x_offset_from_alignment
      case horizontal_alignment
        when :left   then offsets.left
        when :center then ( ( text_width-width ).abs/2 ).to_i
        when :right  then ( text_width-width ).abs
      end
    end
    
    def y_offset_from_alignment
      case vertical_alignment
        when :top    then offsets.top
        when :center then ( ( text_height-height ).abs/2 ).to_i
        when :bottom then ( text_height-height ).abs
      end
    end
    
  end
  
end
