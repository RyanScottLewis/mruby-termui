module TermUI
  
  class Margins
    
    include HasAttributes
    
    def initialize(attributes={})
      @top, @left, @bottom, @right = 0, 0, 0, 0
      
      super
    end
    
    # Get the top margin.
    # 
    # @return [Integer]
    attr_reader :top
    
    # Set the top margin.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def top=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @top = value
    end
    
    # Get the right margin.
    # 
    # @return [Integer]
    attr_reader :right
    
    # Set the right margin.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def right=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @right = value
    end
    
    # Get the bottom margin.
    # 
    # @return [Integer]
    attr_reader :bottom
    
    # Set the bottom margin.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def bottom=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @bottom = value
    end
    
    # Get the left margin.
    # 
    # @return [Integer]
    attr_reader :left
    
    # Set the left margin.
    # 
    # @param value [#to_i]
    # @return [Integer]
    def left=(value)
      value = value.to_i
      value = 0 if value < 0
      
      @left = value
    end
    
    # Get the total height of the margins.
    # 
    # @return [Integer]
    def height
      @top + @bottom
    end
    
    # Get the total width of the margins.
    # 
    # @return [Integer]
    def width
      @left + @right
    end
    
  end
  
end
