module TermUI
  
  # Adds the `top`, `right`, `bottom`, `left`, `width`, and `height` attributes to objects.
  module HasSideAttributes
    
    include HasAttributes
    
    def initialize(attributes={})
      @top, @left, @bottom, @right = 0, 0, 0, 0
      
      super
    end
    
    # Get the top attribute.
    # 
    # @return [Integer]
    attr_reader :top
    
    # Set the top attribute.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def top=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @top = value
    end
    
    # Get the right attribute.
    # 
    # @return [Integer]
    attr_reader :right
    
    # Set the right attribute.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def right=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @right = value
    end
    
    # Get the bottom attribute.
    # 
    # @return [Integer]
    attr_reader :bottom
    
    # Set the bottom attribute.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def bottom=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @bottom = value
    end
    
    # Get the left attribute.
    # 
    # @return [Integer]
    attr_reader :left
    
    # Set the left attribute.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def left=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @left = value
    end
    
    # Get the total height of the attributes.
    # 
    # @return [Integer]
    def height
      @top + @bottom
    end
    
    # Get the total width of the attributes.
    # 
    # @return [Integer]
    def width
      @left + @right
    end
    
  end
  
end
