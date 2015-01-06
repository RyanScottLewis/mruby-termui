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
      @top = value.to_i
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
      @right = value.to_i
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
      @bottom = value.to_i
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
      @left = value.to_i
    end
    
  end
  
end
