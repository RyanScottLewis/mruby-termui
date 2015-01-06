module TermUI
  
  # Adds the `margins` attribute to objects, which can be :vertical or :horizontal.
  module HasMargins
    
    include HasAttributes
    
    def initialize(attributes={})
      attributes[:margins] ||= {}

      raise TypeError, ':margins option must respond to #to_hash or #to_h' unless attributes[:margins].respond_to?(:to_hash) || attributes[:margins].respond_to?(:to_h)
      attributes[:margins] = attributes[:margins].to_hash rescue attributes[:margins].to_h
      
      @margins = Margins.new( attributes[:margins] )
      
      super
    end
    
    # Get the margins of this widget.
    attr_reader :margins
    
    # Set the margins of this widget.
    # 
    # @param value [Margins] The new Margins instance.
    def margins=(value)
      raise TypeError, 'margins must be a Margins instance' unless value.is_a?(Margins)
      
      @margins = value
    end
    
  end
  
end
