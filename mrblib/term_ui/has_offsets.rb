module TermUI
  
  # Adds the `offsets` attribute to objects.
  module HasOffsets
    
    include HasBorders
    include HasMargins
    include HasPadding
    
    def initialize(attributes={})
      super
      
      @offsets = Offsets.new( margins: @margins, borders: @borders )
    end
    
    # Get the offsets of this widget.
    # 
    # @return [Offsets]
    attr_reader :offsets
    
  end
  
end
