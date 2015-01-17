module TermUI
  
  class Offsets
    
    include HasAttributes
    
    def initialize(attributes={})
      super
      
      raise ArgumentError, 'margins attribute must be set' if @margins.nil?
      raise ArgumentError, 'borders attribute must be set' if @borders.nil?
    end
    
    # Get the margins to calculate offsets for.
    # 
    # @return [Margins]
    attr_reader :margins
    
    # Set the margins to calculate offsets for.
    # 
    # @param [Margins] value
    # @return [Margins]
    def margins=(value)
      raise TypeError, 'value must be a Margins instance' unless value.is_a?(Margins)
      
      @margins = value
    end
    
    # Get the borders to calculate offsets for.
    # 
    # @return [Borders]
    attr_reader :borders
    
    # Set the borders to calculate offsets for.
    # 
    # @param [Borders] value
    # @return [Borders]
    def borders=(value)
      raise TypeError, 'value must be a Borders instance' unless value.is_a?(Borders)
      
      @borders = value
    end
    
    # Get the top offset from the contents of a widget from the top.
    # 
    # @return [Integer]
    def top
      @margins.top + @borders.top
    end
    
    # Get the right offset from the contents of a widget from the right.
    # 
    # @return [Integer]
    def right
      @margins.right + @borders.right
    end
    
    # Get the bottom offset from the contents of a widget from the bottom.
    # 
    # @return [Integer]
    def bottom
      @margins.bottom + @borders.bottom
    end
    
    # Get the left offset from the contents of a widget from the left.
    # 
    # @return [Integer]
    def left
      @margins.left + @borders.left
    end
    
  end
  
end
