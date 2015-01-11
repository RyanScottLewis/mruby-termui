module TermUI
  
  class Offsets
    
    # Get the widget to calculate offsets for.
    # 
    # @return [Widget]
    attr_reader :widget
    
    # Set the widget to calculate offsets for.
    # 
    # @param [Widget] value
    # @return [Widget]
    def widget=(value)
      raise TypeError, 'value must be a Widget' unless value.is_a?(Widget)
      
      @widget = value
    end
    
    # Get the top offset from the contents of a widget from the top.
    # 
    # @return [Integer]
    def top
      return 0 if widget.nil?
      
      widget.margin.top + widget.border.top
    end
    
    # Get the right offset from the contents of a widget from the right.
    # 
    # @return [Integer]
    def right
      return 0 if widget.nil?
      
      widget.margin.right + widget.border.right
    end
    
    # Get the bottom offset from the contents of a widget from the bottom.
    # 
    # @return [Integer]
    def bottom
      return 0 if widget.nil?
      
      widget.margin.bottom + widget.border.bottom
    end
    
    # Get the left offset from the contents of a widget from the left.
    # 
    # @return [Integer]
    def left
      return 0 if widget.nil?
      
      widget.margin.left + widget.border.left
    end
    
  end
  
end
