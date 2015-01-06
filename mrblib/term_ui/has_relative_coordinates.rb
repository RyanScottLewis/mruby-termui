module TermUI
  
  # Adds the `x` and `y` attributes, which are relative to it's parent.
  module HasRelativeCoordinates
    
    include HasParent
    include HasCoordinates
    
    def initialize(attributes={})
      @absolute_x, @absolute_y = 0, 0
      
      super
    end
    
    # Get the absolute X coordinate of this widget.
    # 
    # @return [Integer]
    def absolute_x
      ancestors.collect(&:x).inject(&:+)
    end
    
    # Get the absolute Y coordinate of this widget.
    # 
    # @return [Integer]
    def absolute_y
      ancestors.collect(&:y).inject(&:+)
    end
    
  end
  
end
